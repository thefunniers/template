# Impl

- Read all files in `REPO-ROOT/.github/guidelines/` for project-specific rules.
- Workspace files are in `REPO-ROOT/.github/workspace/`.

## Goal and Constraints

- Your goal is to implement the changes specified in `REPO-ROOT/.github/workspace/Copilot_Design.md`.
- You MUST modify actual source code files.
- You MUST compile and test.
- Document all work in `REPO-ROOT/.github/workspace/Copilot_Impl.md`.
- Before writing to any source file, re-read it to respect parallel editing.

## Copilot_Impl.md Structure

- `# !!!IMPL!!!`: This file always begins with this title.
- `# UPDATES`:
  - `## UPDATE`: There could be multiple occurrences. Each one has an exact copy of the update description I gave you.
  - `## User Update Spotted`: Differences between planned changes and actual source code (user edits).
- `# EXECUTION LOG`:
  - `## TASK No.X: Title [DONE]`
    - `### Changes Made`: List of files and what changed.
    - `### Build Result`: Pass/fail + errors fixed.
    - `### Test Result`: Pass/fail + failures fixed.
- `# FIXING ATTEMPTS`:
  - `## Fixing attempt No.X`: Why it failed, what was changed, why the fix should work.

## Step 1. Identify the Problem

- Find `# Impl` or `# Update` in the LATEST chat message.
  - Ignore any of these titles in the chat history.

### Start Implementation (only when "# Impl" appears in the LATEST chat message)

Ignore this section if there is no "# Impl" in the LATEST chat message.

- Read `Copilot_Design.md` thoroughly.
- Read `doc/README.md`. If any linked document is relevant to the tasks, read it.
- Override `Copilot_Impl.md` with `# !!!IMPL!!!` and empty sections (`# UPDATES`, `# EXECUTION LOG`, `# FIXING ATTEMPTS`).
- Start executing tasks in order.

### Update during Implementation (only when "# Update" appears in the LATEST chat message)

Ignore this section if there is no "# Update" in the LATEST chat message.

- Append my update as `## UPDATE` under `# UPDATES` in `Copilot_Impl.md`.
- Follow my instruction to adjust implementation.
- Update `Copilot_Impl.md` to keep it consistent with actual code changes.

### If nothing: you were accidentally stopped. Continue your work. Read `Copilot_Impl.md` to find where you left off (look for tasks without `[DONE]`).

## Step 2. Execute Tasks

For each task in `Copilot_Design.md`, in order:

### 2.1 Apply Code Changes

- Read the `# SPECIFICATION` in `Copilot_Design.md` for this task.
- Apply changes to the actual source files.
- Follow existing code style — check the target file and its neighbors.
  - Indentation and line breaks must match the surrounding code.
  - Coding style must follow the project's formatter conventions.
- After applying changes for a task, log it in `# EXECUTION LOG` under `## TASK No.X: Title`.

### 2.2 Update Build Config (if needed)

- If new files were added outside the existing source globs, update the build configuration as described in the guidelines files.

### 2.3 Compile

- Run the build command defined in the guidelines files.
- If compilation fails:
  - Carefully identify: is the issue in the callee side or the caller side? Check out similar code before making a decision.
  - Fix the error.
  - For every attempt of fixing the source code, log in `# FIXING ATTEMPTS`:
    - `## Fixing attempt No.X`
    - Explain why the original change did not work.
    - Explain what you changed.
    - Explain why you think it fixes the issue.
  - Recompile. Repeat until clean build.
- Log build result in `### Build Result` under the current task.

### 2.4 Test

- Run the test command defined in the guidelines files.
- If tests fail:
  - Dig into related source code carefully. Make your assumption about the root cause.
  - DO NOT delete any test case.
  - If an assertion fails, add temporary logging to trace values.
  - Fix the source code (not the test expectations, unless the test expectation was wrong per the design).
  - Log each fixing attempt in `# FIXING ATTEMPTS`.
  - Remove temporary logging after the fix.
  - Recompile and retest. Repeat until all tests pass.
- Log test result in `### Test Result` under the current task.

### 2.5 Mark Task Complete

- After the task compiles and tests pass, append `[DONE]` after the task title in `# EXECUTION LOG`.
- This allows you to find where you are if you are interrupted.

### 2.6 Respect User Edits

- If you spot any difference between what you planned and the actual source code:
  - It means I edited it. I have my reason. DO NOT revert my changes.
  - Note the difference in `# UPDATES` as `## User Update Spotted`.
  - Adapt your remaining work around my changes.

## Step 3. Verify Coding Style

- After all tasks are done, go over each changed file and ensure:
  - Indentation is correct and consistent with the surrounding code.
  - Coding style especially line breaks follows the same conventions as the surrounding code.
  - Empty lines do not contain trailing spaces or tabs.

## Step 3.5. Note Documentation Impact

- If the changes you made introduce new public APIs, change module behavior, or affect design documented in `doc/`:
  - Append a `# DOC IMPACT` section at the end of `Copilot_Impl.md` (before `# !!!VERIFIED!!!`).
  - List what should be added/changed in `doc/` and why.
  - Do NOT modify `doc/` files during Impl mode.

## Step 4. Mark the Completion

- After all tasks are done, all tests pass, and code compiles cleanly:
  - Ensure there is a `# !!!VERIFIED!!!` mark at the end of `Copilot_Impl.md` to indicate everything is verified.
