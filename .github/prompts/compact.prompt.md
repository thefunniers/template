# Compact

- Read all files in `REPO-ROOT/.github/guidelines/` for project-specific rules.
- Workspace files are in `REPO-ROOT/.github/workspace/`.

## Goal and Constraints

- Your goal is to produce a handoff document at `REPO-ROOT/.github/workspace/Copilot_Handoff.md`.
- You are **NOT** allowed to modify any source code or `doc/` files.
- The handoff document must be **self-contained** — a new agent reading only this document should be able to understand the project's workflow, conventions, and accumulated knowledge without access to the original repository.
- The document serves one purpose:
  1. **Knowledge transfer** — allow a new agent starting a different project to benefit from the patterns, decisions, and lessons learned here.

## Copilot_Handoff.md Structure

- `# !!!COMPACT!!!`: This file always begins with this title.
- `# Project Snapshot`: Summary of current project state, key decisions, and notable work done.
- `# Repository Profile`: What this repo is, its tech stack, directory layout, build/test commands.
- `# Workflow Knowledge`: How the Design → Impl → Doc lifecycle works, what each workspace file is for.
- `# Coding Conventions & Guidelines`: Rules from `.github/guidelines/`, naming, style, testing patterns.
- `# Architecture & Design Decisions`: Key architectural decisions, module structure, API patterns.
- `# Pitfalls & Lessons Learned`: Gotchas, failed approaches, non-obvious behaviors.
- `# Portable Recommendations`: Advice usable in a different repository with similar patterns.
- `# !!!HANDOFF!!!`: Completion marker at the end.

## Step 1. Read All Available Context

Gather knowledge from the following sources in parallel:

- `REPO-ROOT/.github/workspace/Copilot_Design.md` — current design document (if it exists).
- `REPO-ROOT/.github/workspace/Copilot_Impl.md` — implementation log (if it exists).
- `REPO-ROOT/.github/workspace/Copilot_Doc.md` — documentation research scratch pad (if it exists).
- `REPO-ROOT/doc/README.md` — project knowledge base index (if it exists); follow links to read relevant module docs.
- `REPO-ROOT/.github/guidelines/` — all project-specific guidelines files.
- `REPO-ROOT/.github/copilot-instructions.md` — general agent instructions.
- `REPO-ROOT/AGENTS.md` — command routing rules.
- Key source files and test files relevant to the current session work.

## Step 2. Write the Handoff Document

Override `Copilot_Handoff.md` with `# !!!COMPACT!!!` and fill in each section below.

### Section 1 — Project Snapshot

Summarize the current state of the project so that a new agent starting on a related or successor project can quickly understand what was built and why:

- **What Was Built**: A concise description of what the project does and what was accomplished.
- **Key Decisions**: The most important design/implementation choices made, and why.
- **Notable Patterns**: Any particularly useful patterns, techniques, or conventions discovered during this project.
- **Known Issues**: Any unresolved problems, open questions, or known limitations worth noting for the next project.

### Section 2 — Repository Profile

Describe the repository so a new agent can orient itself:

- **Purpose**: What this project does and who it is for (1–3 sentences).
- **Tech Stack**: Languages, frameworks, build system, test framework, key libraries.
- **Directory Layout**: Top-level directories and their roles. Highlight `src/`, `test/`, `doc/`, `.github/`, and any project-specific directories.
- **Build & Test Commands**: Exact commands from the guidelines files. Include how to run a single test, a test suite, and a full build.
- **Workflow Modes**: Design / Impl / Doc / Direct / Compact — what each does and when to use it.
- **Key Files**: List the most important files with a one-line description of each.

### Section 3 — Workflow Knowledge

Explain the Design → Impl → Doc lifecycle precisely:

- **Design Mode** (`# Design`): How `Copilot_Design.md` is structured (TASKS + SPECIFICATION), the three sub-commands (`# Problem`, `# Update`, `# Spec`), and what the document must contain before Impl begins.
- **Impl Mode** (`# Impl`): How `Copilot_Impl.md` is structured (EXECUTION LOG, FIXING ATTEMPTS), how tasks are executed one by one with compile+test after each, and how to resume after interruption.
- **Doc Mode** (`# Doc`): The five sub-commands (`# Setup`, `# Topic`, `# Ask`, `# Write`, `# Sync`), how `Copilot_Doc.md` is used as a scratch pad, and the `# Sync` → commit → backup flow.
- **Compact Mode** (`# Compact`): Used during project handoff — when passing knowledge from a completed project to an agent starting a new one; the output is `Copilot_Handoff.md`.
- **Direct Mode**: No prefix — used for quick changes, discussions, or questions outside the formal workflow.
- **DOC IMPACT**: How Design and Impl modes flag documentation needs, and how `# Doc # Sync` picks them up.
- **Backup**: How `copilotBackup.ps1` archives the workspace after a completed cycle.

### Section 4 — Coding Conventions & Guidelines

Summarize the project-specific rules from `.github/guidelines/`:

- **Source Structure**: Which directories contain source vs. test vs. generated files.
- **Naming Conventions**: Files, classes, functions, variables, constants — follow the project's style.
- **Code Style**: Indentation, line breaks, brace placement, include order, or any formatter in use.
- **Testing Patterns**: Test framework, file naming, fixture patterns, assertion style. Quote any specific rules.
- **Build Configuration**: How new files get picked up by the build; any CMake/Make/Bazel/etc. rules to know.
- **Error Handling**: How errors are reported and propagated in this codebase.
- **Any Other Rules**: Anything else in the guidelines that a new agent must know.

### Section 5 — Architecture & Design Decisions

Capture the architectural knowledge accumulated during the session:

- **Module Structure**: How the codebase is divided into modules; the dependency graph (which module depends on what).
- **Key APIs**: The most important public interfaces — class names, function signatures, usage patterns.
- **Data Flow**: How data moves through the system for the main use cases.
- **Design Patterns**: Patterns in heavy use (e.g. RAII, strategy, observer, factory). Why they were chosen.
- **Dependencies**: Key third-party libraries and what role they play.
- **Session-Specific Decisions**: Any architectural choices made specifically during this session (reference `Copilot_Design.md` and `Copilot_Impl.md`).

### Section 6 — Pitfalls & Lessons Learned

Record non-obvious issues discovered during the session:

- **Gotchas**: Things that look one way but work another way in this codebase.
- **Failed Approaches**: Approaches tried and abandoned, with a brief explanation of why they did not work.
- **Build/Test Quirks**: Non-obvious behavior of the build system or test runner.
- **API Misuse Patterns**: Common ways to misuse the project's own APIs.
- **External Library Quirks**: Surprising behavior from third-party libraries.
- **Anything Else**: Any lesson learned that is not obvious from reading the code.

### Section 7 — Portable Recommendations

Distill advice that helps a new agent working on a *different* repository with similar patterns or tech stack:

- **Workflow Adoption**: How to adapt the Design → Impl → Doc cycle to a new project.
- **Guidelines Setup**: What to put in `.github/guidelines/template.md` for a project of this type.
- **Testing Strategy**: Recommended testing approach for projects with a similar structure.
- **Documentation Strategy**: How to bootstrap `doc/` and keep it up to date.
- **Common Pitfalls to Avoid**: General pitfalls for this tech stack or project type, informed by this session.
- **Process Improvements**: Any workflow improvements that would have saved time in this session.

## Step 3. Mark the Completion

- Ensure the document ends with `# !!!HANDOFF!!!`.
- The document should be readable as a standalone artifact — avoid references like "see above" or "as mentioned"; be explicit in each section.
