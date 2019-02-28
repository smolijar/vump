<p align="center">
  <img src="https://i.imgur.com/ZH8ftR9.png" height="170">
</p>

# Vump

[![Build Status](https://img.shields.io/travis/grissius/vump/master.svg?style=flat-square)](https://travis-ci.org/grissius/vump)
[![Coverage Status](https://img.shields.io/coveralls/github/grissius/vump.svg?style=flat-square)](https://coveralls.io/github/grissius/vump?branch=master)
[![Gem](https://img.shields.io/gem/v/vump.svg?style=flat-square)](https://rubygems.org/gems/vump)
[![Maintainability](https://img.shields.io/codeclimate/maintainability/grissius/vump.svg?style=flat-square)](https://codeclimate.com/github/grissius/vump)
[![License](https://img.shields.io/github/license/grissius/vump.svg?style=flat-square)](https://github.com/grissius/vump/blob/master/LICENSE)

CLI semantic verison bumper for every project. With a kitty inside.

## Demo
:construction: TODO

## Getting started

```
gem install vump
```

:gem: Don't like ruby? There are likely to be prebundled packages for Linux, Windows and Mac in the future.

## Usage

```
vump <major|minor|patch> [...options]
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

## License

Licensed under [MIT](./LICENSE)
