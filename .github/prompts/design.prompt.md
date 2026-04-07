# Design

- Read all files in `REPO-ROOT/.github/guidelines/` for project-specific rules.
- Workspace files are in `REPO-ROOT/.github/workspace/`.

## Goal and Constraints

- Your goal is to produce a detailed design and implementation plan for **one task** in `REPO-ROOT/.github/workspace/Copilot_Design.md`.
- The task comes from `REPO-ROOT/.github/workspace/Copilot_Scrum.md`.
- You are **NOT** allowed to modify any source code.
- You are only allowed to update `Copilot_Design.md` and mark the task as taken in `Copilot_Scrum.md`.
- The phrasing of the request may look like asking for code change, but your actual work is to write the design document.
- The design is both an analysis of "what to do" AND a specification of "how the code should look" — so that the Impl phase can be executed mechanically.

## Copilot_Design.md Structure

- `# !!!DESIGN!!!`: This file always begins with this title.
- `# TASK DESCRIPTION`: The task taken from `Copilot_Scrum.md`, including its number, title, and full description.
- `# UPDATES`: For multiple `## UPDATE` sections. It should always exist even if there is no update.
  - `## UPDATE`: There could be multiple occurrences. Each one has an exact copy of the update description I gave you.
- `# INSIGHTS AND REASONING`: Your analysis of the codebase, design decisions, and the reasoning behind them.
- `# SPECIFICATION`:
  - `## File: path/to/file`: Interface/class declarations with actual signatures.
  - `## File: path/to/impl`: Implementation details, key logic, code sketches.
  - `## File: path/to/test`: Test case outlines with scenarios and expected behavior.
- `# BUILD & TEST PLAN`: Build and test commands (refer to the guidelines files).

## Step 1. Identify the Task

- Find `# Task` or `# Update` or `# Spec` in the LATEST chat message.
  - Ignore any of these titles in the chat history.
  - If there is nothing: it means you are accidentally stopped. Please continue your work.

### Take a Task (only when "# Task" appears in the LATEST chat message)

Ignore this section if there is no "# Task" in the LATEST chat message.

- Read `Copilot_Scrum.md` thoroughly.
- Identify which task to work on:
  - If the message says `next` (or nothing after `# Task`): find the first incomplete task (marked with `[ ]`) in `Copilot_Scrum.md`.
  - If the message says `No.X`: find TASK No.X in `Copilot_Scrum.md`.
- Mark the task as being taken by changing `[ ]` to `[x]` in the bullet list of `Copilot_Scrum.md`.
- Override `Copilot_Design.md` with only one title `# !!!DESIGN!!!`.
  - At the moment, `Copilot_Design.md` may contain old content from previous tasks. Always clean it up.
- Copy the full task description (the `## TASK No.X` heading and everything under it, up to the next `## TASK` or the end of `# TASKS`) under `# TASK DESCRIPTION`.
- Add an empty `# UPDATES` section after `# TASK DESCRIPTION`.
- **Write `Copilot_Design.md` to disk now** before proceeding to Step 2.

### Update current Document (only when "# Update" appears in the LATEST chat message)

Ignore this section if there is no "# Update" in the LATEST chat message.
I am going to propose some change to `Copilot_Design.md`.

- Copy precisely my update description in `# Update` from the LATEST chat message to the `# UPDATES` section, with a new sub-section `## UPDATE`.
- The new `## UPDATE` should be appended to the end of the existing `# UPDATES` section (before `# INSIGHTS AND REASONING`).
- Re-evaluate `# SPECIFICATION` to reflect the update.
- Follow my update to change the design document.

### Update Specification only (only when "# Spec" appears in the LATEST chat message)

Ignore this section if there is no "# Spec" in the LATEST chat message.
I want to refine only the specification.

- Read my feedback, update only the `# SPECIFICATION` section.
- Do not change `# INSIGHTS AND REASONING`.

## Step 2. Analyze and Understand

- Read `doc/README.md` first. If any linked document is relevant to the task, read it thoroughly.
- Read through the relevant source and test files carefully (refer to the guidelines files for directory structure).
- Read through existing test patterns to understand testing style.
- One small decision may have wide impact to the rest of the codebase. Think thoroughly.

### Tips about Designing

- Leverage existing code in the project as API to complete new features. The project should be modular.
- If you think any existing API should offer enough functionality, but it is currently missing something:
  - Point it out in `# INSIGHTS AND REASONING`.
  - DO NOT make assumptions that you can't prove from source code.
- If you have multiple proposals:
  - List all of them with pros and cons.
  - You should decide which is the best one.
- Prefer existing types and utilities in the project before creating new ones.
- Prefer algorithms with lower time and space complexity.

## Step 3. Write Insights and Reasoning

- Under `# INSIGHTS AND REASONING`, describe:
  - Your analysis of the current codebase relevant to the task.
  - The high-level approach to solving the task.
  - What files are affected and why.
  - Any design decisions and the reasoning behind them.
  - Evidence from source code or `doc/`.
- **Write `Copilot_Design.md` to disk now** before proceeding to Step 4.

## Step 4. Write the Specification

- Under `# SPECIFICATION`, write out the actual interface and implementation decisions.
- For each affected file, describe:
  - **Headers**: class/struct/function declarations with actual signatures.
  - **Implementations**: key logic, algorithms, data flow — with code sketches where the design choice matters.
  - **Tests**: list of test cases with scenario descriptions and expected results.
- This specification is the single source of truth for the Impl phase. Be precise.
- The specification must contain actual code that can be applied to the source files. This is what separates Design from Scrum — Design produces executable-level detail.
- Keep code consistent with existing patterns (check similar files).
- **Write `Copilot_Design.md` to disk now** before proceeding to Step 5.

## Step 5. Fill BUILD & TEST PLAN

- List build and test commands needed (refer to the guidelines files for exact commands).
- Note if new files need build configuration changes.

## Step 6. Mark the Completion

- Ensure there is a `# !!!FINISHED!!!` mark at the end of `Copilot_Design.md` to indicate the document reaches the end.
