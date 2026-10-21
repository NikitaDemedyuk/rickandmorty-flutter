# Changelog

All notable changes to this project are documented here.
The format follows [Keep a Changelog](https://keepachangelog.com/en/1.1.0/), and the project uses [Semantic Versioning](https://semver.org).

## [Unreleased]

## [1.1.0] - 2026-10-21

### Added

- A dark theme that follows the system appearance ([#20](https://github.com/NikitaDemedyuk/rickandmorty-flutter/pull/20)).
- Screen reader labels for the status chip ("Status: Alive"), the details facts ("Species: Human") and the loaders; screen readers skip the portraits. Character rows and the details screen, errors included, fit a small phone at 2x text size ([#24](https://github.com/NikitaDemedyuk/rickandmorty-flutter/pull/24)).
- A demo GIF in the READMEs ([#19](https://github.com/NikitaDemedyuk/rickandmorty-flutter/pull/19)).

## [1.0.1] - 2026-10-20

### Fixed

- Release Android builds can reach the network: the `INTERNET` permission is declared in the main manifest, not only in debug and profile ([#18](https://github.com/NikitaDemedyuk/rickandmorty-flutter/pull/18)).

## [1.0.0] - 2026-10-18

### Added

- Characters list with infinite scroll, pull-to-refresh, and debounced search by name ([#4](https://github.com/NikitaDemedyuk/rickandmorty-flutter/pull/4)).
- Character details screen with a `Hero` portrait. It fetches by id, so deep links work ([#6](https://github.com/NikitaDemedyuk/rickandmorty-flutter/pull/6)).
- Distinct error messages for offline, server and not-found errors, rate limiting (HTTP 429, [#5](https://github.com/NikitaDemedyuk/rickandmorty-flutter/pull/5)), and timeouts ([#9](https://github.com/NikitaDemedyuk/rickandmorty-flutter/pull/9)).
- App core: Material 3 theme, go_router, English localizations, Dio networking, and the get_it composition root ([#2](https://github.com/NikitaDemedyuk/rickandmorty-flutter/pull/2)). Status colors live in a `StatusColors` theme extension ([#7](https://github.com/NikitaDemedyuk/rickandmorty-flutter/pull/7)).
- Characters data layer: DTOs, remote data source, and repository ([#3](https://github.com/NikitaDemedyuk/rickandmorty-flutter/pull/3)).
- Tooling: very_good_analysis, CI (generated code, format, analyze, tests, coverage), and PR and issue templates ([#1](https://github.com/NikitaDemedyuk/rickandmorty-flutter/pull/1)).
- "Rick and Morty" as the app name on the Android and iOS launchers ([#10](https://github.com/NikitaDemedyuk/rickandmorty-flutter/pull/10)).
- An original portal app icon, adaptive on Android and with dark and tinted variants on iOS ([#12](https://github.com/NikitaDemedyuk/rickandmorty-flutter/pull/12)).
- A native splash screen showing the portal icon on the app's dark background ([#13](https://github.com/NikitaDemedyuk/rickandmorty-flutter/pull/13)).
- README in English and Russian, with an architecture overview ([#11](https://github.com/NikitaDemedyuk/rickandmorty-flutter/pull/11)).
- Release workflow: a version tag publishes a GitHub Release with the APK ([#14](https://github.com/NikitaDemedyuk/rickandmorty-flutter/pull/14)).

[Unreleased]: https://github.com/NikitaDemedyuk/rickandmorty-flutter/compare/v1.1.0...develop
[1.1.0]: https://github.com/NikitaDemedyuk/rickandmorty-flutter/compare/v1.0.1...v1.1.0
[1.0.1]: https://github.com/NikitaDemedyuk/rickandmorty-flutter/compare/v1.0.0...v1.0.1
[1.0.0]: https://github.com/NikitaDemedyuk/rickandmorty-flutter/releases/tag/v1.0.0
