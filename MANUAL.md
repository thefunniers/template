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
        ├─  # Design + # Update  ─��→  改任务+规格
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

Agent 会读 `Copilot_Impl.md`，找到没有 `[DONE]` 的任务继续执行。

---

## Doc Mode（文档模式）

### 一键初始化文档库

```
# Doc
# Setup
```

读取整个代码库，自动生成 `doc/README.md` + 各模块文档。仅需执行一次。

### 研究一个主题

```
# Doc
# Topic
<主题描述>
```

研究源码，将发现写入 `Copilot_Doc.md` 的 INSIGHT 段。

### 追问

```
# Doc
# Ask
<你的问题>
```

基于当前研究内容进行 Q&A，补充 INSIGHT。

### 起草文档

```
# Doc
# Write
```

基于研究内容起草文档。审阅后说 **"commit"** 即可落盘到 `doc/` 并更新索引。

---

## 关键文件

| 文件 | 说明 |
|---|---|
| `AGENTS.md` | 所有 AI agent 的统一入口（路由） |
| `.github/copilot-instructions.md` | 通用规则手册 |
| `.github/guidelines/*.md` | 项目专属编码规范、构建命令 |
| `.github/prompts/design.prompt.md` | Design 模式的完整流程 |
| `.github/prompts/impl.prompt.md` | Impl 模式的完整流程 |
| `.github/prompts/doc.prompt.md` | Doc 模式的完整流程 |
| `.github/workspace/Copilot_Design.md` | 设计文档（gitignored） |
| `.github/workspace/Copilot_Impl.md` | 实现日志（gitignored） |
| `.github/workspace/Copilot_Doc.md` | 文档研究草稿（gitignored） |