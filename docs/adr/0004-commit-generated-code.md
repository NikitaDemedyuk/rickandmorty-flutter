# 4. Commit generated code

- **Status:** Accepted
- **Date:** 2026-10-18

## Context

The app uses code generation for `freezed` and `json_serializable` (`*.freezed.dart`, `*.g.dart`) and for gen-l10n (`lib/l10n/gen/`). If the output is not committed, every clone, review and CI run has to run `build_runner` first. Reviewers also can't see in the diff how a model change affects the generated code.

## Decision

- Generated files are committed.
- CI regenerates them (`flutter gen-l10n`, `dart run build_runner build`) and fails if `git status` shows any change under `lib/`. That means a committed file is either fresh or the build is red.
- The same holds for the platform app icons and native splash files (`android/app/src/main/res`, `ios/Runner/Assets.xcassets`, `ios/Runner/Base.lproj`): CI regenerates them with `dart run tool/generate_app_icons.dart` and `dart run flutter_native_splash:create`. Edit their sources (`assets/icon/`, `flutter_native_splash.yaml`), never the platform files.

## Consequences

- `git clone && fvm flutter pub get && fvm flutter run` works with no generation step.
- Diffs include generated code. It is noisy, but it shows exactly what changed. Reviewers can collapse those files.
- Contributors must regenerate after editing an annotated class or the ARB file. CI catches it if they forget.
