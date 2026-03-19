# Project Guidelines: <org-or-user>/<project-name>

> Template only. Replace all placeholders before using this repository for a real project.

## Project Overview

- Target platform: `<platform-and-arch>`.
- Primary language and standard/version: `<language-and-version>`.
- Project type: `<library|service|cli|app|tooling>`.
- Build system / package manager: `<cmake|xmake|cargo|npm|poetry|...>`.
- Formatting / linting baseline: `<formatter-or-style-guide>`.

## Repository Structure

- `<src-dir>/` — main source code.
- `<include-dir>/` — public headers or exported interfaces, if applicable.
- `<test-dir>/` — automated tests.
- `<bench-dir>/` — benchmarks, if applicable.
- `<doc-dir>/` — long-form project documentation, if applicable.
- `<build-config-files>` — build or dependency configuration.
- `<third-party-dir>/` — vendored third-party code. **DO NOT modify** unless the task explicitly requires it.

## Build Commands

- Configure / bootstrap: `<project setup command>`.
- Build default target: `<build command>`.
- Build all targets: `<full build command>`.
- Run tests: `<test command>`.
- Run benchmarks: `<benchmark command or N/A>`.
- Lint / format check: `<lint-or-format command>`.
- Clean: `<clean command>`.

## Dependencies

- Runtime dependencies: `<list main runtime dependencies>`.
- Build-time dependencies: `<list build tooling dependencies>`.
- Test-only dependencies: `<list test dependencies>`.
- Prefer existing dependencies over introducing new ones unless there is a clear gap.

## Writing Code

- Language standard / version: `<details>`.
- Follow the existing naming, file layout, and error-handling conventions.
- Match the surrounding style before introducing a new pattern.
- Prefer small, focused changes that solve the root cause.
- Add tests for new behavior unless there is a documented reason to skip.
- If new files are added outside existing source globs, update the build configuration.

## Validation Expectations

- Always run the narrowest relevant build/test command first.
- For larger changes, also run the full project validation command set.
- If some validation cannot run in the current environment, record the reason clearly.

## Modifiable and Read-Only Areas

- You CAN modify: `<list directories/files safe to edit>`.
- Modify with caution: `<generated files, migrations, configs, lockfiles, etc.>`.
- DO NOT modify: `<vendored code, generated snapshots, secrets, external mirrors, etc.>`.

## Project-Specific Notes

- `<note about architecture, performance, ABI/API compatibility, deployment, security, or review expectations>`.
- `<note about documentation workflow, release constraints, or compatibility matrix>`.