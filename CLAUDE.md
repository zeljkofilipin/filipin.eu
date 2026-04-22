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

Run the linter locally (requires Docker — runs `github/super-linter` against the repo; matches the GitHub Actions workflow in `.github/workflows/linter.yml`):

```
rake
```

Super-linter in this repo disables these validators: `GITLEAKS`, `HTML`, `JSCPD`, `MARKDOWN`, `NATURAL_LANGUAGE`. A `.markdownlint.json` is present (relaxes `line-length`, `no-inline-html`, `single-h1`), but since `VALIDATE_MARKDOWN` is off nothing currently runs against it.

## Content structure

- `_posts/<year>/YYYY-MM-DD-slug.md` — blog posts. Posts are bucketed into per-year subdirectories (Jekyll recurses into `_posts`). Front matter needs `tags` (space-separated) and `title`; the `post` layout is applied automatically via the `defaults` block in `_config.yml`.
- `_tags/<tag>.md` — one file per tag. Each has front matter `name: <tag>` and optional body content rendered on the tag page. The `tag` layout (`_layouts/tag.html`) lists all posts whose front matter `tags` include `page.name`. Adding a new tag to a post requires creating a matching `_tags/<tag>.md` for the tag page to exist — enforced by `script/check-tags`, wired into the `Lint Code Base` workflow.
- `index.md`, `blog.md`, `tags.md`, `license.md` — top-level pages. `blog.md` is the post index; `tags.md` lists all tags with post counts.
- `_layouts/tag.html` — the only custom layout; everything else inherits `default` from the remote theme.
- `assets/` — images and other static files referenced by posts.
- `permalink: /:title` in `_config.yml` means post URLs are `/<slug-from-title>` not date-based. Changing a post's title will change its URL and break inbound links.

## Spelling

`.vscode/settings.json` carries a large `cSpell.words` allowlist of names and domain terms (people, places, tools). When adding posts that mention new proper nouns, add them there to keep the VS Code spellchecker quiet.

## Working style

Keep changes small — each change should be scoped so it can stand on its own as a single commit.
