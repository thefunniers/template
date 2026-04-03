# General Instruction

- `REPO-ROOT` refers to the root directory of this repository.
- Read all files in `REPO-ROOT/.github/guidelines/` for project-specific coding rules, build commands, and conventions.
- Before writing to a source file, read it again and make sure you respect my parallel editing.
- If any `*.prompt.md` file is referenced, take immediate action following the instructions in that file.

## Project Documentation

Project knowledge documents are in `REPO-ROOT/doc/`. The index is `REPO-ROOT/doc/README.md`.

- **Before Scrum, Design or Impl**: read `doc/README.md` to find any relevant documentation. If a linked document exists for the module you are working on, read it.
- **After Impl completes**: check if any document in `doc/` needs updating. If so, note it at the end of `Copilot_Impl.md` under `# DOC IMPACT` (what to add/change and why). Do NOT modify `doc/` during Impl — documentation updates are done in Doc mode.

## Workspace Files

Temporary design and implementation documents are in `REPO-ROOT/.github/workspace/`:
- `Copilot_Scrum.md`: task breakdown for the current problem. Persists across multiple Design-Impl cycles.
- `Copilot_Design.md`: design document and specification for the current task. Overwritten per task.
- `Copilot_Impl.md`: implementation log, compile/test results, and fixing attempts. Overwritten per task.
- `Copilot_Doc.md`: documentation research scratch pad.

These files are gitignored and never committed.

### Important Rules for Writing Markdown Files

- It is totally fine to have multiple top level `# Topic`.
- When mentioning a C++ name in markdown file:
  - If it is defined in the standard C++ library or third-party library, use the full name.
  - If it is defined in the source code, use the full name if there is ambiguity, and then mention the file containing its definition.
- Code references must be wrapped in backtick quotes.
