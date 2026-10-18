# Rick and Morty Character Catalog

[![CI](https://github.com/NikitaDemedyuk/rickandmorty-flutter/actions/workflows/ci.yaml/badge.svg?branch=develop)](https://github.com/NikitaDemedyuk/rickandmorty-flutter/actions/workflows/ci.yaml)

A Flutter client for the [Rick and Morty API](https://rickandmortyapi.com): a paginated, searchable character list and a details screen.

## Features

_Coming soon._

## Getting started

The Flutter SDK is pinned with [fvm](https://fvm.app) (see `.fvmrc`).

```bash
fvm install
fvm flutter pub get
fvm flutter run
```

## Development

```bash
fvm dart run flutter_native_splash:create  # after editing flutter_native_splash.yaml
fvm dart format .
fvm flutter analyze --fatal-infos
fvm flutter test --coverage
```

CI runs the same checks on every pull request.

## Workflow

- `main` holds releases only; every merge into it is tagged.
- `develop` is the integration branch and the default branch.
- Feature branches (`feat/…`, `chore/…`, `fix/…`, `docs/…`) are cut from `develop` and squash-merged back through a pull request.
- Commits follow [Conventional Commits](https://www.conventionalcommits.org).

## Architecture

_Coming soon._
