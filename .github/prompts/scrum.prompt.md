# Scrum

- Read all files in `REPO-ROOT/.github/guidelines/` for project-specific rules.
- Workspace files are in `REPO-ROOT/.github/workspace/`.

## Goal and Constraints

- Your goal is to break a problem into small, well-ordered tasks and write them to `REPO-ROOT/.github/workspace/Copilot_Scrum.md`.
- You are **NOT** allowed to modify any source code.
- You are only allowed to update `Copilot_Scrum.md`.
- The phrasing of the request may look like asking for code change, but your actual work is to write the task breakdown document.
- "Task" in the request always means a task under the `# TASKS` section in the document.

## Copilot_Scrum.md Structure

- `# !!!SCRUM!!!`: This file always begins with this title.
- `# PROBLEM DESCRIPTION`: An exact copy of the problem description I gave you.
- `# UPDATES`: For multiple `## UPDATE` sections. It should always exist even if there is no update.
  - `## UPDATE`: There could be multiple occurrences. Each one has an exact copy of the update description I gave you.
- `# TASKS`:
  - A bullet list of all tasks, each in the format `- [ ] TASK No.X: The Task Title`.
  - `## TASK No.X: The Task Title`: A task.
    - A comprehensive description about the goal of this task.
    - `### what to be done`: A clear definition of what needs to be changed or implemented.
    - `### affected files`: List of files to create or modify.
    - `### test plan`: What tests to add/modify, or rationale for skipping.
    - `### rationale`: Why this task, why this order, evidence from source code.
- `# DOC IMPACT`: What documentation needs to be created or updated after all tasks are done.

## Step 1. Identify the Problem

- The problem I would like to solve is in the chat messages sent with this request.
- Find `# Problem` or `# Update` in the LATEST chat message.
  - Ignore any of these titles in the chat history.
  - If there is nothing: it means you are accidentally stopped. Please continue your work.

### Create new Document (only when "# Problem" appears in the LATEST chat message)

Ignore this section if there is no "# Problem" in the LATEST chat message.
I am starting a fresh new request.

- Override `Copilot_Scrum.md` with only one title `# !!!SCRUM!!!`.
  - At the moment, `Copilot_Scrum.md` may contain old content from previous requests. Always clean it up.
- After overriding, copy precisely my problem description in `# Problem` from the LATEST chat message under `# PROBLEM DESCRIPTION`.
- Add an empty `# UPDATES` section after `# PROBLEM DESCRIPTION`.

### Update current Document (only when "# Update" appears in the LATEST chat message)

Ignore this section if there is no "# Update" in the LATEST chat message.
I am going to propose some change to `Copilot_Scrum.md`.

- Copy precisely my update description in `# Update` from the LATEST chat message to the `# UPDATES` section, with a new sub-section `## UPDATE`.
- The new `## UPDATE` should be appended to the end of the existing `# UPDATES` section (before `# TASKS`).
- When the number of tasks needs to change (insert/remove/split/merge):
  - Adjust task numbers throughout the document.
  - Replace affected tasks with new content. DO NOT touch unaffected tasks.
- Follow my update to change the document.

## Step 2. Analyze and Understand

- Read `doc/README.md` first. If any linked document is relevant to the problem, read it thoroughly.
- Read through the relevant source and test files carefully (refer to the guidelines files for directory structure).
- Read through existing test patterns to understand testing style.
- One small decision may have wide impact to the rest of the codebase. Think thoroughly.
- Your goal is to break the problem into small, well-ordered tasks.

### Quality Requirements for Tasks

- Each task should be:
  - Small enough to only represent a single idea or feature change.
  - Able to deliver a complete piece of functionality.
  - **Not mixing functionality and test cases in the same task.**
    - Writing new test cases should be in separate tasks.
    - If test cases are better to be categorized and grouped, create each task for each group.
    - For refactoring work, existing test cases might have already covered most scenarios. Carefully review them and only add new test cases if necessary.
    - If you think any current test case must be updated or improved, explain why.
  - For a test planning task:
    - Focus on unit tests only. Do not include end-to-end or manual tests.
    - Consider how to ensure testability, how many existing components are affected, and whether existing test cases already cover them.
  - Well ordered. At the end of each task, the project should be able to compile and existing tests should pass.
- During making the document:
  - Read through the code base carefully.
  - Think thoroughly.

### Tips about Designing

- Leverage existing code in the project as API to complete new features. The project should be modular.
- If you think any existing API should offer enough functionality, but it is currently missing something:
  - Point it out. A separate task to update it is recommended.
  - DO NOT make assumptions that you can't prove from source code.
- If you have multiple proposals for a task:
  - List all of them with pros and cons.
  - You should decide which is the best one.
- Prefer existing types and utilities in the project before creating new ones.
- Prefer algorithms with lower time and space complexity.

## Step 3. Write the Tasks

- Break the problem into tasks under `# TASKS`.
- In each task, describe it with a high-level and comprehensive description.
  - A task must be at least updating some code; it must not be just learning or analyzing.
  - Reading, thinking and planning is your immediate work to complete the document.
- Following the description, there should be:
  - `### what to be done`: A clear definition of what needs to be changed or implemented. Keep it high-level — mention what should be done to update certain files, classes, or modules, but do not include actual code.
  - `### affected files`: Which files to create or modify.
  - `### test plan`: How this will be tested.
  - `### rationale`: Why this task exists, why in this order, any supporting evidence from source code or `doc/`.

## Step 4. Identify Doc Impact

- If the tasks will introduce new concepts, new modules, or change existing module behavior:
  - Add a `# DOC IMPACT` section describing what should be created or updated in `doc/`.
- This is informational — actual doc changes happen in Doc mode after all tasks are done.

## Step 5. Mark the Completion

- Ensure there is a `# !!!FINISHED!!!` mark at the end of `Copilot_Scrum.md` to indicate the document reaches the end.
