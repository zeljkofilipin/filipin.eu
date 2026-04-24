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
- `_layouts/tag.html` — the only custom layout; everything else inherits `default` from the remote theme.
- `assets/` — images and other static files referenced by posts. Organized by year and post: `assets/<year>/<post-slug>/<file>` when a post has multiple assets, or `assets/<year>/<post-slug>.<ext>` when it has exactly one. Assets shared across posts within the same year live at `assets/<year>/` root; cross-year shared assets live under the earliest year that references them. Site-wide assets (homepage logo, author photo) stay at `assets/` root.
- `permalink: /:title` in `_config.yml` means post URLs are `/<slug-from-title>` not date-based. Changing a post's title will change its URL and break inbound links.

## Spelling

`.vscode/settings.json` carries a large `cSpell.words` allowlist of names and domain terms (people, places, tools). When adding posts that mention new proper nouns, add them there to keep the VS Code spellchecker quiet.

## Working style

- Keep changes small — each change should be scoped so it can stand on its own as a single commit.
- No Ruby or Node on the host. Run linters and ad-hoc scripts via `docker run --rm -v "$PWD:/w" -w /w ruby:3.3 …` or the equivalent `node:20` image. Super-linter runs via the pinned image in the `Rakefile`.
- One change per turn — apply the edit, hand it back for the user to commit, then wait before the next change. **Never make git commits yourself, under any circumstances.**
- This repo is used on several machines. Anything worth remembering across sessions belongs in **this file** (CLAUDE.md), not in per-machine Claude memory — memory is local to one installation and will be invisible on the other machines.

## Verifying mass rewrites

For any change that rewrites refs across many posts (asset reorgs, slug renames, layout swaps), build the site before and after and diff the output — the diff must contain **only** the intended change. A find-and-replace can silently hit text it shouldn't (e.g. a `/assets/` in prose or a code block); the build diff is the ground-truth check, much stronger than browser spot-checks. Do this per commit, not batched.

Procedure: build into `/tmp/filipin-old` using the Docker command above, apply the change, build into `/tmp/filipin-new`, then `diff -rq /tmp/filipin-old /tmp/filipin-new`.

Jekyll output contains timestamp lines (`article:published_time`, schema.org JSON-LD `dateModified`/`datePublished`) that reflect build time, so tag pages (`_site/tags/*.html`) and `feed.xml` always differ between two builds — ~38 spurious diffs per build. Filter them with `sed -E 's/20[0-9]{2}-[0-9]{2}-[0-9]{2}T[0-9]{2}:[0-9]{2}:[0-9]{2}[+-][0-9]{2}:[0-9]{2}/TS/g'` on both sides before comparing. After filtering, the only differing files should be the posts you touched, and every differing line should contain the token you intended to change.

## Improvement backlog

Surveyed 2026-04-23. Items marked **broken** are likely already visible to readers.

### Broken
- **Old image references** (~37 posts, mostly 2005–2006 era): malformed image syntax from pre-Jekyll migration. Images are probably not rendering in those posts.
- **Feed** (`/feed.xml`): verify that `jekyll-feed` is actually generating the feed. The gem is in the Gemfile but the agent could not confirm a `feed.xml` is being produced.

### High-impact improvements
- **No post descriptions**: 0 of 487 posts have a `description` field in front matter. Affects SEO and social preview cards (Open Graph). Start with the most-visited posts.
- **Orphaned assets**: ~288 image files in `assets/` are never referenced by any post. Could be deleted to reduce repo size (verify before bulk delete).

### Content / editorial
- **Thin tags**: `blog` (2 posts), `chess`, `commons`, `scratch` (3 posts each), `linux`, `software` (4 posts each). Either write more in those areas or retire the tags.
- **`_tags/TODO.md` / `tags: TODO`**: 86 posts are tagged `TODO` as a placeholder (tags were never decided). `_tags/TODO.md` exists to keep the tag-check script happy. These posts need real tags assigned.

### Structure
- **No pagination on `blog.md`**: all 487 posts render on one page. Will get slower as the blog grows; consider adding Jekyll pagination.
