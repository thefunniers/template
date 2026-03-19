# Copilot 指令速查手册

## 模式总览

| 模式 | 入口 | 用途 |
|---|---|---|
| Design | `# Design` | 设计阶段：分析需求、拆任务、写规格 |
| Impl | `# Impl` | 实现阶段：按设计文档逐任务编码、编译、测试 |
| Doc | `# Doc` | 文档阶段：研究源码、撰写/更新 `doc/` |
| Direct | 不加任何 `#` 前缀 | 直接编码，或自由讨论 |

---

## 工作流示意

```
# Design + # Problem     ──→  设计文档初稿
        │
        ├─  自由讨论（不加前缀）
        │
        ├─  # Design + # Update  ──→  改任务+规格
        │
        ├─  # Design + # Spec    ──→  只改规格
        │
        │   （反复迭代直到满意）
        ▼
# Impl                   ──→  逐任务实现+编译+测试
        │
        ├─  # Impl + # Update    ──→  实现中调整
        │
        ▼
完成（检查 Copilot_Impl.md 末尾是否有 DOC IMPACT）
        │
        ▼
# Doc + # Topic / # Ask / # Write  ──→  更新文档
```

---

## Design Mode（设计模式）

### 新建设计文档

```
# Design
# Problem
<需求描述>
```

从零创建 `Copilot_Design.md`，包含 TASKS + SPECIFICATION。

### 更新任务和规格

```
# Design
# Update
<你的修改意见>
```

调整任务拆分（增删改合并），联动更新 SPECIFICATION。

### 只更新规格

```
# Design
# Spec
<接口/实现细节的调整>
```

只修改 SPECIFICATION 段，不动 TASKS。

### 讨论设计（不修改文档）

直接发消息，**不加** `# Design` 前缀：

```
看一下 Copilot_Design.md 里 Task 3 的设计，
用 std::variant 还是继承体系更合适？
```

---

## Impl Mode（实现模式）

### 开始实现

```
# Impl
```

按 `Copilot_Design.md` 中的任务顺序逐个执行，每完成一个任务都会编译+测试。

### 实现中调整

```
# Impl
# Update
<临时调整指令>
```

在实现过程中插入修改意见，agent 会适配剩余任务。

### 被中断后继续

直接发送：

```
# Impl
```

.github/copilot-instructions.md with contents: # General Instruction

- `REPO-ROOT` refers to the root directory of this repository.
- Read all files in `REPO-ROOT/.github/guidelines/` for project-specific coding rules, build commands, and conventions.
- Before writing to a source file, read it again and make sure you respect my parallel editing.
- If any `*.prompt.md` file is referenced, take immediate action following the instructions in that file.

## Project Documentation

Project knowledge documents are in `REPO-ROOT/doc/`. The index is `REPO-ROOT/doc/README.md`.

- **Before Design or Impl**: read `doc/README.md` to find any relevant documentation. If a linked document exists for the module you are working on, read it.
- **After Impl completes**: check if any document in `doc/` needs updating. If so, note it at the end of `Copilot_Impl.md` under `# DOC IMPACT` (what to add/change and why). Do NOT modify `doc/` during Impl — documentation updates are done in Doc mode.

## Workspace Files

Temporary design and implementation documents are in `REPO-ROOT/.github/workspace/`:
- `Copilot_Design.md`: design document and specification for the current task.
- `Copilot_Impl.md`: implementation log, compile/test results, and fixing attempts.
- `Copilot_Doc.md`: documentation research scratch pad.

These files are gitignored and never committed.

### Important Rules for Writing Markdown Files

- It is totally fine to have multiple top level `# Topic`.
- When mentioning a C++ name in markdown file:
  - If it is defined in the standard C++ library or third-party library, use the full name.
  - If it is defined in the source code, use the full name if there is ambiguity, and then mention the file containing its definition.
- Code references must be wrapped in backtick quotes.
