# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

Željko Filipin's personal blog at https://filipin.eu, built with Jekyll and hosted on GitHub Pages (via the `CNAME` file and `github-pages` gem). The `jekyll-theme-hacker` remote theme is applied on top of the `default` layout.

## Common commands

Serve the site locally at http://127.0.0.1:4000/:

```
bundle install
bundle exec jekyll s
```

Bundler is configured via `.bundle/config` to install gems into `vendor/bundle`.

No Ruby on the host, so the above won't work directly — use Docker. Build the site into an arbitrary destination (e.g. `/tmp/site`) with:

```
docker run --rm -v "$PWD:/w" -w /w -v /tmp:/tmp \
  -e PAGES_REPO_NWO=zeljkofilipin/filipin.eu ruby:3.3 bash -c \
  'git config --global --add safe.directory /w && \
   bundle config set --local path vendor/bundle && \
   bundle exec jekyll build -d /tmp/site'
```

`PAGES_REPO_NWO` is required because the `github-pages` gem resolves repo metadata from it; without the env var the build fails. `git safe.directory` is required because the container runs as root against the host-owned repo. The `/tmp` mount lets the build output land outside the repo (so `.gitignore` stays untouched).

Run the linter locally (requires Docker — runs `github/super-linter` against the repo; matches the GitHub Actions workflow in `.github/workflows/linter.yml`):

```
rake
```

Disabled super-linter validators are declared in `.github/workflows/linter.yml` (for CI) and mirrored in the `Rakefile` (for local runs). The Rakefile additionally disables `TRIVY`, which CI leaves on — locally it only flags a Dockerfile inside `vendor/bundle`. A `.markdownlint.json` is present (relaxes `line-length`, `no-inline-html`, `single-h1`), but since `VALIDATE_MARKDOWN` is off nothing currently runs against it.

## Content structure

- `_posts/<year>/YYYY-MM-DD-slug.md` — blog posts. Posts are bucketed into per-year subdirectories (Jekyll recurses into `_posts`). Front matter needs `tags` (space-separated) and `title`; the `post` layout is applied automatically via the `defaults` block in `_config.yml`.
- `_tags/<tag>.md` — one file per tag. Each has front matter `name: <tag>` and optional body content rendered on the tag page. The `tag` layout (`_layouts/tag.html`) lists all posts whose front matter `tags` include `page.name`. Adding a new tag to a post requires creating a matching `_tags/<tag>.md` for the tag page to exist — enforced by `script/check-tags`, wired into the `Lint Code Base` workflow.
- `index.md`, `blog.md`, `tags.md`, `license.md` — top-level pages. `blog.md` is the post index; `tags.md` lists all tags with post counts.
- `_layouts/post.html` — overrides the remote theme's post layout. Automatically prepends an estimated reading time (computed from word count at ~200 wpm) and appends a standard feedback footer to every post. Do not add reading time lines or `## Feedback` sections to post files — the layout handles both.
- `_layouts/tag.html` — custom tag layout; lists all posts for a given tag.
- `assets/` — images and other static files referenced by posts. Organized by year and post: `assets/<year>/<post-slug>/<file>` when a post has multiple assets, or `assets/<year>/<post-slug>.<ext>` when it has exactly one. Assets shared across posts within the same year live at `assets/<year>/` root; cross-year shared assets live under the earliest year that references them. Site-wide assets (homepage logo, author photo) stay at `assets/` root.
- `permalink: /:title` in `_config.yml` means post URLs are `/<slug-from-title>` not date-based. Changing a post's title will change its URL and break inbound links.

## Tag conventions

- Tags in the `tags:` front matter field are kept **alphabetically sorted**.
- **Embed-only tags** — add these only when the post actually embeds the content (iframe, `<video>`, etc.), not merely links to it: `commons`, `drive`, `facebook`, `strava`, `twitter`, `video`, `youtube`.
- `image` — add when a post contains any visual (screenshot, photo, logo), whether via markdown `![]()` or HTML `<img>`. Formerly called `photo`.
- Run `script/check-tags` (or `rake`) to verify every tag used in a post has a matching `_tags/<tag>.md`.

## Spelling

`.vscode/settings.json` carries a large `cSpell.words` allowlist of names and domain terms (people, places, tools). When adding posts that mention new proper nouns, add them there to keep the VS Code spellchecker quiet.

## Languages

### File formats

- **Markdown** (~529 files — `_posts/`, `_tags/`, top-level pages): super-linter validators `VALIDATE_MARKDOWN` (markdownlint) and `VALIDATE_MARKDOWN_PRETTIER` — both **disabled**
- **YAML** (2 files — `_config.yml`, `.github/workflows/linter.yml`): super-linter validator `VALIDATE_YAML` — **enabled**
- **HTML** (2 files — `_layouts/post.html`, `_layouts/tag.html`): super-linter validators `VALIDATE_HTML` and `VALIDATE_HTML_PRETTIER` — both **disabled**
- **JSON** (4 files — `.markdownlint.json`, `.vscode/settings.json`, `.claude/settings.local.json`, `.devcontainer/devcontainer.json`): super-linter validator `VALIDATE_JSON` — **enabled**
- **Ruby** (3 files — `Gemfile`, `Rakefile`, `script/check-tags`): super-linter validator `VALIDATE_RUBY` — **disabled**

### Natural languages (blog content)

- **English** — majority of posts; super-linter has `VALIDATE_NATURAL_LANGUAGE` (textlint) and `VALIDATE_SPELL_CODESPELL` (codespell) — both **disabled**; neither supports Croatian anyway
- **Croatian** — minority of posts; no super-linter validator; see spellchecking item in Tooling backlog

## Working style

- Keep changes small — each change should be scoped so it can stand on its own as a single commit.
- No Ruby or Node on the host. Run linters and ad-hoc scripts via `docker run --rm -v "$PWD:/w" -w /w ruby:3.3 …` or the equivalent `node:20` image. Super-linter runs via the pinned image in the `Rakefile`.
- One change per turn — apply the edit, run CI locally (`rake`), then hand it back for the user to commit. **Never make git commits yourself, under any circumstances.**
- This repo is used on several machines. Anything worth remembering across sessions belongs in **this file** (CLAUDE.md), not in per-machine Claude memory — memory is local to one installation and will be invisible on the other machines.

## Verifying refactoring with a build diff

For any refactoring — especially changes that rewrite refs across many posts (asset reorgs, slug renames, layout swaps) — build the site before and after and diff the output — the diff must contain **only** the intended change. A find-and-replace can silently hit text it shouldn't (e.g. a `/assets/` in prose or a code block); the build diff is the ground-truth check, much stronger than browser spot-checks. Do this per commit, not batched.

Procedure: build into `/tmp/filipin-old` using the Docker command above, apply the change, build into `/tmp/filipin-new`, then `diff -rq /tmp/filipin-old /tmp/filipin-new`.

Jekyll output contains timestamp lines (`article:published_time`, schema.org JSON-LD `dateModified`/`datePublished`) that reflect build time, so tag pages (`_site/tags/*.html`) and `feed.xml` always differ between two builds — ~38 spurious diffs per build. Filter them with `sed -E 's/20[0-9]{2}-[0-9]{2}-[0-9]{2}T[0-9]{2}:[0-9]{2}:[0-9]{2}[+-][0-9]{2}:[0-9]{2}/TS/g'` on both sides before comparing. After filtering, the only differing files should be the posts you touched, and every differing line should contain the token you intended to change.

## HTML to Markdown cleanup

Converting remaining HTML to Markdown in `_posts/`, one tag type per commit — all affected files for that tag in a single commit, not one file per commit. Counts are raw tag occurrences across all posts (surveyed 2026-04-24).

### Todo (in order)
- [x] `<code>` (21) — inline code → `` `text` `` (skip occurrences inside HTML `<td>` cells)
- [x] `<blockquote>` (14) — all are Twitter tweet embeds, not content; keep as HTML
- [x] `<strong>` (6) — all inside SlideShare embed HTML; keep as HTML
- [x] `<em>` (3) → `*text*`
- [x] `<br>` (2) → removed (one split into two paragraphs, one was stray inside a code block)
- [x] `<a>` (225) → `[text](url)` where cleanly convertible
- [x] `<ul>`/`<li>` (27) → Markdown list syntax
- [x] HTML tables (~10 tables in 6 posts) → Markdown pipe tables: `2009/ruby-mail-on-cruby-jruby-and-ironruby.md` (1), `2010/ruby-mail-and-benchmark-rb-on-cruby-jruby-ironruby-and-rubyinstaller.md` (3), `2012/page-object-api-should-be-more-similar-to-watir-api.md` (1), `2010/postfix-logs-bash.md` (2, have `<code>` in cells), `2010/two-years-of-watir-podcast.md` (1), `2007/repeat-feature-of-microsoft-excel.md` (2)
- [x] `<span>` (~15 occurrences in ~7 posts, 2006–2008 era) — Blogger export artifacts (`lang="EN-GB"`, `class="entry-author-name"`, etc.); strip tags, keep content
- [x] `<h4>` (2 occurrences) — both are inside `{% highlight html %}` code blocks in `2007/extend-watir.md` and `2007/find-element-by-xpath.md`; no conversion needed
- [x] Removable `<div>` (2 cases): watermark comment in `2024/podcasts-in-2024.md` removed; `2012/watir-nokogiri.md` divs were already inside `{% highlight html %}` block

### Not converting (keep as HTML)
- `<iframe>` (280) — embedded YouTube/Facebook, no Markdown equivalent
- `<img>` (35) — already handled what's possible; remaining have width/height/class or Wikimedia Commons attribution
- `<script>` (18) — social embed scripts
- `<div>` — SlideShare attribution (3 posts), Facebook SDK (6 posts, 2015), YouTube wrapper (2017)
- `<p>` (47) — remove opportunistically when rewriting surrounding content

## Improvement backlog

Surveyed 2026-04-23. Items marked **broken** are likely already visible to readers.

### Broken
- **Old image references** (~37 posts, mostly 2005–2006 era): malformed image syntax from pre-Jekyll migration. Images are probably not rendering in those posts.
- ~~**Feed** (`/feed.xml`)~~: verified working; fixed double-slash URLs by removing trailing slash from `url` in `_config.yml`.
- **Missing code blocks** (`HIGHLIGHTPLACEHOLDER`): `_posts/2009/2009-12-24-ruby-mail-on-cruby-jruby-and-ironruby.md` and `_posts/2010/2010-01-05-ruby-mail-and-benchmark-rb-on-cruby-jruby-ironruby-and-rubyinstaller.md` contain `HIGHLIGHTPLACEHOLDER2ENDPLACEHOLDER` / `HIGHLIGHTPLACEHOLDER3ENDPLACEHOLDER` strings where code blocks should be. Present since the first commit — original content must be recovered from the live blog or another source.

### High-impact improvements
- **No post descriptions**: 0 of 487 posts have a `description` field in front matter. Affects SEO and social preview cards (Open Graph). Start with the most-visited posts.
- **Orphaned assets**: ~288 image files in `assets/` are never referenced by any post. Could be deleted to reduce repo size (verify before bulk delete).

### Content / editorial
- ~~**`_tags/TODO.md`**~~: deleted — no post used the `TODO` tag.
- **Thin tags**: `chess`, `commons`, `scratch` (handful of posts each). Either write more in those areas or retire the tags.

### Structure
- **No pagination on `blog.md`**: all 487 posts render on one page. Will get slower as the blog grows; consider adding Jekyll pagination.
- **Dark/light mode toggle**: current `jekyll-theme-hacker` has no runtime toggle. Consider migrating to a theme that supports it — **Chirpy** (`jekyll-theme-chirpy`) is the strongest candidate: has a built-in toggle, works as `remote_theme` on GitHub Pages, and handles tags and reading time. Migration is non-trivial (different front matter conventions and layout structure).

### Tooling
- **Markdown linting**: enable `VALIDATE_MARKDOWN` in super-linter (remove the `false` from both `linter.yml` and `Rakefile`). `.markdownlint.json` is already present. Before enabling, first expand the config to disable false-positive rules, then fix remaining real errors one rule per commit (same approach as HTML cleanup).
  - **Step 1 — disable false-positive rules** in `.markdownlint.json`: `MD041` (first-line-heading — posts start with body text, not headings), `MD022`/`MD018`/`MD023` (heading rules — fire on Ruby `#` comments inside `{% highlight %}` blocks, which markdownlint can't distinguish from headings), `MD024` (no-duplicate-heading — same heading in different posts/sections is fine).
  - **Step 2 — fix real errors** (1184 before / 1012 after disabling false positives; surveyed 2026-04-24), one rule per commit:
    - [x] MD060 table-column-style (472, all in one file) — disabled: rule conflicts with empty cells in data tables; no rendered difference
    - [ ] MD010 no-hard-tabs (151 — auto-fixable)
    - [ ] MD036 emphasis-as-heading (118 — bold used as heading substitute; needs manual review)
    - [ ] MD034 bare-urls (64 — wrap in `<url>` or `[text](url)`)
    - [ ] MD030 list-marker-space (62 — auto-fixable)
    - [ ] MD047 single-trailing-newline (30 — auto-fixable)
    - [ ] MD028 no-blanks-blockquote (24 — blank lines inside `>` blockquotes)
    - [ ] MD032 blanks-around-lists (22 — auto-fixable)
    - [ ] MD026 no-trailing-punctuation (19 — trailing `!`/`?` in headings)
    - [ ] MD039 no-space-in-links (13 — auto-fixable)
    - [ ] MD038 no-space-in-code (9 — auto-fixable)
    - [ ] MD011 no-reversed-links (8 — `(text)[url]` → `[text](url)`)
    - [ ] MD045 no-alt-text (5 — add alt text to images)
    - [ ] MD012 no-multiple-blanks (5 — auto-fixable)
    - [ ] MD059 descriptive-link-text (3 — "click here" style links)
    - [ ] MD049 emphasis-style (2 — `*` vs `_` consistency)
    - [ ] MD027 no-multiple-space-blockquote (2 — auto-fixable)
    - [ ] MD009 no-trailing-spaces (1 — auto-fixable)
    - [ ] MD004 ul-style (1 — unordered list marker style)
    - [ ] MD001 heading-increment (1 — heading level skips)
  - **Step 3 — enable** `VALIDATE_MARKDOWN` in `linter.yml` and `Rakefile`.
- **Spellchecking (English + Croatian)**: add cspell as a separate CI step (`streetsidesoftware/cspell-action`) with English (default) and Croatian (`@cspell/dict-hr`) dictionaries. Extract the allowlist from `.vscode/settings.json` into a shared `cspell.config.json` at the repo root so VS Code and CI use the same config. Options to decide before implementing: (a) which files to check (`_posts/` only, or all `.md`); (b) how to handle front matter and Liquid/HTML blocks; (c) whether to also wire it into the `Rakefile` for local runs.
