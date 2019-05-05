<div align="center">
  <img src="https://i.imgur.com/ZH8ftR9.png" height="170">

# Vump

[![Build Status](https://img.shields.io/travis/grissius/vump/master.svg?style=flat-square)](https://travis-ci.org/grissius/vump)
[![Coverage Status](https://img.shields.io/coveralls/github/grissius/vump.svg?style=flat-square)](https://coveralls.io/github/grissius/vump?branch=master)
[![Gem](https://img.shields.io/gem/v/vump.svg?style=flat-square)](https://rubygems.org/gems/vump)
[![Maintainability](https://img.shields.io/codeclimate/maintainability/grissius/vump.svg?style=flat-square)](https://codeclimate.com/github/grissius/vump)
[![License](https://img.shields.io/github/license/grissius/vump.svg?style=flat-square)](https://github.com/grissius/vump/blob/master/LICENSE)
[![vump](https://img.shields.io/static/v1.svg?label=versions&message=well-behaved&color=f39c12&style=flat-square&logo=data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiPz48IURPQ1RZUEUgc3ZnIFBVQkxJQyAiLS8vVzNDLy9EVEQgU1ZHIDEuMS8vRU4iICJodHRwOi8vd3d3LnczLm9yZy9HcmFwaGljcy9TVkcvMS4xL0RURC9zdmcxMS5kdGQiPjxzdmcgdmVyc2lvbj0iMS4xIiBpZD0iTGF5ZXJfMSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayIgeD0iMHB4IiB5PSIwcHgiIHdpZHRoPSI4Ny42ODNweCIgaGVpZ2h0PSIxMDYuMTgzcHgiIHZpZXdCb3g9IjAgMCA4Ny42ODMgMTA2LjE4MyIgZW5hYmxlLWJhY2tncm91bmQ9Im5ldyAwIDAgODcuNjgzIDEwNi4xODMiIHhtbDpzcGFjZT0icHJlc2VydmUiPjxwYXRoIGZpbGw9IiNGRkZGRkYiIGQ9Ik04Ny4xNjcsNzEuNDIxYy0wLjk5Mi0zLjUzNS0zLjEwNy01LjgxOC02Ljg2My02LjM1Yy0zLjcyNy0wLjUyOS02LjYwNywwLjgyNC04LjMyOCw0LjEzN2MtMS4xNDUsMi4yMDEtMS45ODgsNC41Ny0yLjgzMiw2LjkxNGMtMS40ODQsNC4xMTktMy40MzksNy44OTMtNi42MDcsMTEuMDM3Yy0xMC45MzIsMTAuODQ2LTM0Ljk2MSwxMi4wMzctNDYuODA3LDIuMTdjLTEuNDUxLTEuMjA5LTMuMzQtMi4yMzYtMy41NzgtNC40MzljMC45OTItMC45MywxLjk3OS0wLjMwNSwyLjkyNi0wLjI3MWM5LjEzNywwLjMxMywxOC4zNDIsMS41NzIsMjcuMzQ4LTAuODI4YzcuOTA2LTIuMTA3LDEwLjAzMy05LjU4Niw0Ljg3MS0xNS45NTdjLTEuMzItMS42MjktMy40NjMtMi41NzYtNC4xMzUtNC44MjhjMS41ODItMS41MjksMy41MjktMC44NjksNS4yNjYtMS4xMDJjNy4zMTMtMC45NzMsMTMuNzUyLTMuNjU0LDE5LjAyMS05LjAxMmMxMi41NzgtMTIuNzg1LDEyLjAwOC0zOC4zNDMsNi4yMTUtNTAuNDRjLTEuMzItMi43NTMtMi44NTctMi44NDUtNS4wMTgtMS4xNDljLTMuMjkxLDIuNTgyLTYuNDE2LDUuMzYzLTguNzAxLDguODg1Yy0xLjU5LDIuNDUyLTMuNDcxLDMuMTM1LTYuMzI4LDIuNTgyYy02LjQyNi0xLjI0NS0xMi45NDEtMS4yNi0xOS4zNjUtMC4wMjNjLTMuMDMzLDAuNTgzLTUuMTA1LDAuMDI1LTYuNzI1LTIuNzAzYy0xLjg5MS0zLjE4NC00LjYxOS01LjY5Ny03LjQ4NC03Ljk4NmMtMy44ODctMy4xMDMtNS4yMTMtMi44NDItNi43NzksMS43OTdjLTQuNjk3LDEzLjkyMi00Ljg1MiwyNy43ODEsMS4zODksNDEuMzVjMS4wOSwyLjM2OSwyLjIyOSwzLjk4NC0wLjg3OSw2LjE2N0MtNS4yMTQsNjQuNzA0LTQuNDYsODYuNjUzLDE1LjM1OCw5OC42MmMxNC44MDMsOC45MzYsMzAuNjA0LDkuMzM2LDQ2Ljc0NCw0LjQxNGMxMC4xMDctMy4wODIsMTguMjgxLTguODIyLDIzLjAyOS0xOC41OUM4Ny4xMTgsODAuMzYsODguNDczLDc2LjA3Nyw4Ny4xNjcsNzEuNDIxeiBNNTguNDM2LDM2LjU4N2MyLjM0OCwwLDQuMjUsMS45MDMsNC4yNSw0LjI1cy0xLjkwMiw0LjI1LTQuMjUsNC4yNXMtNC4yNS0xLjkwMy00LjI1LTQuMjVTNTYuMDg4LDM2LjU4Nyw1OC40MzYsMzYuNTg3eiBNNDMuMzczLDQ3LjU4N2MyLjAxNiwwLDMuNjQ5LDAuMjczLDMuNjQ5LDEuMTY4YzAsMi4wMTUtMS42MzQsMy42NDktMy42NDksMy42NDlzLTMuNjQ5LTEuNjM0LTMuNjQ5LTMuNjQ5QzM5LjcyMyw0Ny44Niw0MS4zNTcsNDcuNTg3LDQzLjM3Myw0Ny41ODd6IE0yOS4zNzQsMzYuNTg3YzIuMzQ4LDAsNC4yNSwxLjkwMyw0LjI1LDQuMjVzLTEuOTAyLDQuMjUtNC4yNSw0LjI1cy00LjI1LTEuOTAzLTQuMjUtNC4yNVMyNy4wMjYsMzYuNTg3LDI5LjM3NCwzNi41ODd6Ii8+PC9zdmc+)](https://github.com/grissius/vump)


CLI semantic version bumper for every project. With a kitty inside.

</div>

## Demo
:construction: TODO

## Motivation
Do you like when projects use semantic versioning a keep a maintained changelog? I bet you do.
Yet it is not rare that a patch version change breaks your app.
Versions of a random maintained project are a mess.
Most of the time, developers use version, because they are forced to, not because they want to.

Here is why:

1. Some people don't know or understand the benefits, for those there are projects like [semver](https://semver.org/), [keep-a-changelog](https://keepachangelog.com) etc.
2. The others are lazy. It is hard. The routine is boring, menial and frustrating if you make a mistake, since you cannot usually republish with the same version tag. For those, I made [vump](https://github.com/grissius/vump).

### Vump do I do?

I try to understand you project. You decide which semver update best describes the unreleased changes and I will snoop your project, do all the file writes in the current directory and then stage them, commit and tag.

If it sounds simple, it's because it is. You might argue that there are many CLI tools doing just the same (find them bellow), even more. That might be true. But very few have ambition to handle different platforms under one hood, and hang on fast to existing standards!

### Features

 - :package: Modular and generic approach
 - :mortar_board: Opinionated, based on standards
 - :ledger: Changelog management
 - :cop: Synced, controlled version
 - :heavy_check_mark: Solid test coverage
 - :information_source: User documentation
 - :speech_balloon: Helpful output
 - :wrench: Handful of options


## Getting started

```bash
gem install vump
```

:gem: Don't like ruby? There are likely to be prebundled packages for Linux, Windows and Mac in the future.

```bash
cd my-project
vump patch
```

## Usage

```
vump [<major|minor|patch|<semver-string>>] [...options]
```

| Option               | Example value | Explanation                                                         |
|----------------------|---------------|---------------------------------------------------------------------|
| `--silent` , `-s`    | -             | Restrict output                                                     |
| `--version`, `-v`    | -             | Output Vump's version                                               |
| `--help`   , `-h`    | -             | Print this help                                                     |
| `--no-git` ,         | -             | Skip staging, commit and tag                                        |
| `--tag-prefix`, `-t` | `@foo/v`      | Modify version string prefix for git tag (default "v")              |
| `--build`  , `-b`    | `001`         | Set semver's build tag (default none)                               |
| `--pre`              | `alpha.1`     | Set semver's pre release tag (default none)                         |
| `--date`   ,         | `2020-12-20`  | Modify date of committing release. Used by changelog. (default now) |
| `--dry`    , `-d`    | -             | Dry run (no writes or CSV manipulation)                             |
| `--path`   , `-p`    | `/foo/bar`    | Path to the repo (default pwd)                                      |

### Examples

- Bump minor version (`mi` is a prefix that cannot be confused with semver or other bumps)
```ps
vump mi
```
- Bump patch version of project in `~/Projects/foo`. Ommit all git operations.
```ps
vump patch -p=~/Projects/foo --no-git
```
- Set version of the projet on `1.1.1-beta-3` (use semver's [pre-release](https://semver.org/#spec-item-9))
```ps
vump 1.1.1 --pre=beta-3
```


## How to use for your project
Vump finds which modules are relevant for your project, asks them for version and if all relevent modules align, it bumps each of them. There are some modules, you can use no matter the project:

**Changelog** module manipulates with `CHANGELOG.md` file according to [keep-a-changelog](https://keepachangelog.com) standard. Using Vump you get changelog maintanance for free, all you need to do is to track your changes in _Unreleased_ section.

**Version file** is probably the simplest module of all. It keeps just the version string followed by a newline in `VERSION` text file. You can use it along with other modules, or if you have no other place to keep your version.
This module also comes handy, when your metadata are stored in a non-static file (meaning, it is interpreted via any runtime). This is the case for ruby for instance. Vump cannot parse interpret the complexity of ruby runtime. But you can read version from the `VERSION` file in your gemspec.

- **JavaScript / Node.js**
  - :rainbow: **npm** Native module for npm's `package.json` and `package-lock.json`
  - :rainbow: **bower** - Native module (though tracking version in `bower.json` is [deprecated](https://github.com/bower/spec/blob/master/json.md#version))
  - :rainbow: **component** Native module for [`component.json`](https://github.com/componentjs/spec/blob/master/component.json/specifications.md)

- **Ruby**
  - :sunny: **rubygems** - Dynamic specification, you can [use](https://stackoverflow.com/a/23135266) `VERSION` file
- **PHP**
  - :rainbow: **composer** - Native module for [`composer.json`](https://getcomposer.org/doc/04-schema.md)
- **Python**
  - :sunny: **PyPI** - Dynamic specification, you can use `VERSION` file

Are you missing something? Please let me know and I will gladly implement new module!

## Related projects
- [python-versioneer](https://github.com/warner/python-versioneer)
- [version-bump-prompt](https://www.npmjs.com/package/version-bump-prompt)
- [npm-bump](https://www.npmjs.com/package/npm-bump)
- [bump](https://github.com/fabiospampinato/bump)
- [php-bump-version](https://packagist.org/packages/quazardous/php-bump-version)
- [perl-bump-version](https://metacpan.org/pod/release/DBOOK/App-RewriteVersion-0.003/script/perl-bump-version)
- [dotnet-bump](https://github.com/killwort/dotnet-bump)
- [release-it](https://www.npmjs.com/package/release-it)
- [bumped](https://github.com/bumped/bumped)

Are there any other good alternatives? Please let me know and I will update the list!

## License

Licensed under [MIT](./LICENSE)
