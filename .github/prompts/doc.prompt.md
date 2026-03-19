# Doc

- Read all files in `REPO-ROOT/.github/guidelines/` for project-specific rules.
- Project documentation lives in `REPO-ROOT/doc/`. The index is `REPO-ROOT/doc/README.md`.

## Goal and Constraints

- Your goal is to research the source code and produce/update documentation in `REPO-ROOT/doc/`.
- You are **NOT** allowed to modify any source code.
- You are only allowed to create/modify files in `doc/`.
- The documents are for **both human developers and Copilot agent**. Write clearly and concisely.

## Doc Workspace

- Use `REPO-ROOT/.github/workspace/Copilot_Doc.md` as your scratch pad during research.
- This file is gitignored. The final result goes into `doc/`.

## Copilot_Doc.md Structure (scratch pad)

- `# !!!DOC RESEARCH!!!`: Always begins with this title.
- `# TOPIC`: Exact copy of my topic request.
- `# INSIGHT`: Your research findings from the source code.
- `# QUESTIONS`: For Q&A rounds.
  - `## QUESTION`: Exact copy of my question.
  - `### ANSWER`: Your answer after research.
- `# DOCUMENT`: The draft document ready to be placed into `doc/`.

## Identify the Action

Find `# Setup` or `# Topic` or `# Ask` or `# Write` in the LATEST chat message.
Ignore any of these in chat history.
If nothing: you were stopped — continue from `Copilot_Doc.md`.

### Initialize Documentation (only when "# Setup" appears in the LATEST chat message)

Ignore this section if there is no "# Setup" in the LATEST chat message.
This is a one-time bootstrap that creates `doc/` from scratch by reading the entire codebase.

#### Step S1. Read the entire codebase

- Read the guidelines files to understand the project structure, source directories, test directories, and build system.
- Read every header file in the source directories to understand:
  - What classes, structs, functions, and enums are defined.
  - What the public API surface is.
  - How modules depend on each other (via `#include`).
- Read every implementation file in the source directories to understand:
  - Key algorithms and internal logic.
  - Non-obvious design decisions (e.g. thread safety, ownership semantics, error handling patterns).
- Read the test directories to understand what is tested and how.

#### Step S2. Identify modules

- Group the source files into logical modules. A module is a cohesive set of files that serve one purpose.
- For each module, determine:
  - The public API (what a user of this library would call).
  - Key design decisions (why it is built this way).
  - Dependencies on other modules within the project.
  - Dependencies on third-party libraries.
  - Any gotchas, pitfalls, or non-obvious behavior.

#### Step S3. Create doc/README.md

- Create `doc/README.md` as the knowledge base index.
- Structure:
  - `# Project Knowledge Base` — title and brief description of the project.
  - `## How to Use This Documentation` — brief note that these docs are maintained by both human and Copilot agent.
  - `## Module Index` — for each module:
    - Module name as `###` heading.
    - One-line summary of purpose.
    - List of source files in the module.
    - Key public APIs (class/function names in backticks).
    - If a separate doc file is created: link to `doc/<module>.md`.
    - If not yet documented in detail: mark as `_(no detailed doc yet)_`.

#### Step S4. Create per-module documents

- For each module that has enough complexity to warrant its own document, create `doc/<module>.md`.
- A module warrants its own document if ANY of these apply:
  - It has more than one source file.
  - Its public API has non-obvious usage patterns.
  - It has important design decisions that are not self-evident from reading the header.
- Each document should follow this structure:
  - `# <Module Name>` — title.
  - `## Overview` — what this module does, in 2-3 sentences.
  - `## Public API` — list of public classes/functions with brief descriptions. Mention the header file.
  - `## Design Notes` — key design decisions, architecture, data flow.
  - `## Dependencies` — what this module depends on (both internal modules and third-party).
  - `## Usage Examples` — if the API has non-obvious usage, show brief examples (as code blocks).
  - `## Gotchas` — pitfalls, thread-safety notes, known limitations.
- Writing rules:
  - Use concrete C++ names in backticks.
  - Reference source files by their relative path from repo root.
  - Multiple heading levels with bullet points preferred.
  - No code translation — focus on design intent, contracts, and "why".
  - Keep it compact but complete.

#### Step S5. Update doc/README.md links

- After creating all per-module documents, go back and update `doc/README.md` to link each one.

#### Step S6. Mark completion

- Ensure there is a `# !!!FINISHED!!!` mark at the end of `doc/README.md`.

### Research a Topic (only when "# Topic" appears in the LATEST chat message)

Ignore this section if there is no "# Topic" in the LATEST chat message.

- Override `Copilot_Doc.md` with `# !!!DOC RESEARCH!!!`.
- Copy my topic under `# TOPIC`.
- Research the source code thoroughly. Fill `# INSIGHT` with:
  - Entry points, core logic, branching cases, data flow.
  - Architecture and design patterns.
  - Evidence from source code (mention function/class names, file names).
- Keep it compact:
  - No code snippets in the insight — use function/class names.
  - No line numbers (code changes frequently).
  - Focus on **why** and **how**, not code translation.
- Add empty `# QUESTIONS` and `# DOCUMENT` sections.

### Answer a Question (only when "# Ask" appears in the LATEST chat message)

Ignore this section if there is no "# Ask" in the LATEST chat message.

- Copy my question as `## QUESTION` under `# QUESTIONS`.
- Fill `### ANSWER` with your research.
- Update `# INSIGHT` if anything was wrong.

### Write the Document (only when "# Write" appears in the LATEST chat message)

Ignore this section if there is no "# Write" in the LATEST chat message.

- Based on everything in `Copilot_Doc.md`, draft the document under `# DOCUMENT`.
- Quality rules:
  - Mention concrete names (classes, functions, files) — not vague abstractions.
  - Use bullet points and multi-level markdown headings.
  - Include all findings from `# INSIGHT` and `# QUESTIONS`. Reorganize, don't just copy.
- After drafting, I will review. When I say "commit":
  - Create/update the target file in `doc/`.
  - Update `doc/README.md` to link the new document under the appropriate section.
  - Keep `Copilot_Doc.md` unchanged (it's the scratch pad).

## Writing Rules for doc/ Files

- Title: `# <Topic Name>`.
- Use concrete C++ names wrapped in backticks.
- Reference source files by their relative path from repo root.
- Multiple heading levels with bullet points are preferred.
- Keep documents focused — one topic per file.
