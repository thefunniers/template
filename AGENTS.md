# Agent Instructions

- Read `REPO-ROOT/.github/copilot-instructions.md` for general rules and documentation references.
- Read all files in `REPO-ROOT/.github/guidelines/` for project-specific coding rules, build commands, and conventions.

## Command Routing

Interpret the request in the latest chat message (not conversation history).

Read the first line of the request to determine the operating mode:

- Starts with `# Design`: follow `REPO-ROOT/.github/prompts/design.prompt.md`.
- Starts with `# Impl`: follow `REPO-ROOT/.github/prompts/impl.prompt.md`.
- Starts with `# Doc`: follow `REPO-ROOT/.github/prompts/doc.prompt.md`.
- Starts with `# Compact`: follow `REPO-ROOT/.github/prompts/compact.prompt.md`.
- Otherwise: **Direct Mode** — treat as a direct coding request.

### Direct Mode

- Follow all coding conventions from the guidelines files in `REPO-ROOT/.github/guidelines/`.
- Modify source code directly. No design documents needed.
- After changes: build and test using the commands defined in the guidelines files.
- Fix any errors, log your reasoning.
