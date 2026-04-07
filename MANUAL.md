# Copilot 指令速查手册

## 模式总览

| 模式 | 入口 | 用途 |
|---|---|---|
| Scrum | `# Scrum` | 规划阶段：分析需求、拆分任务列表 |
| Design | `# Design` | 设计阶段：取一个任务，详细设计 + 实现规格 |
| Impl | `# Impl` | 实现阶段：按设计文档执行单个任务的编码、编译、测试 |
| Doc | `# Doc` | 文档阶段：研究源码、撰写/更新 `doc/`、提取经验教训 |
| Compact | `# Compact` | 项目交接：生成结构化交接文档 `Copilot_Handoff.md` |
| Direct | 不加任何 `#` 前缀 | 直接编码，或自由讨论 |

---

## 工作流示意

```
# Scrum + # Problem       ──→  Copilot_Scrum.md（任务分解）
        │
        ├─  # Scrum + # Update  ──→  调整任务列表
        │
        ▼
┌─ # Design + # Task      ──→  Copilot_Design.md（单任务设计+规格）
│       │
│       ├─  # Design + # Update  ──→  调整设计
│       ├─  # Design + # Spec    ──→  只改规格
│       │
│       ▼
│  # Impl                 ──→  Copilot_Impl.md（执行+编译+测试）
│       │
│       ├─  # Impl + # Update    ──→  实现中调整
│       │
│       ▼
│  自动备份 -TaskOnly      ──→  .github/backup/<timestamp>/
│       │                       （清理 Design+Impl，保留 Scrum）
└───────┘ 取下一个任务，重复 Design→Impl
        │
        │  （可在任意时刻同步文档）
        ▼
# Doc + # Sync             ──→  落盘到 doc/
        │
        ├─  任务未全部完成  ─→  备份 -DocOnly（仅清理 Doc，保留 Scrum）
        │                       →  继续 Design→Impl 剩余任务
        │
        └─  所有任务完成    ─→  完整备份（清理全部 workspace）
                                →  进入下一轮 Scrum

# Doc + # Learn            ──→  提取经验教训
        │
        ▼
自动备份（条件判断）        ──→  .github/backup/<timestamp>/
                                （所有任务完成→完整备份；否则→仅备份 Doc）
```

---

## Scrum Mode（规划模式）

### 新建任务分解

```
# Scrum
# Problem
<需求描述>
```

从零创建 `Copilot_Scrum.md`，包含 TASKS 列表。

### 更新任务列表

```
# Scrum
# Update
<你的修改意见>
```

调整任务拆分（增删改合并）。

---

## Design Mode（设计模式）

### 取下一个任务

```
# Design
# Task
next
```

从 `Copilot_Scrum.md` 取第一个未完成的任务，创建 `Copilot_Design.md`。

### 取指定任务

```
# Design
# Task
No.3
```

### 更新设计

```
# Design
# Update
<你的修改意见>
```

### 只更新规格

```
# Design
# Spec
<接口/实现细节的调整>
```

---

## Impl Mode（实现模式）

### 开始实现

```
# Impl
```

按 `Copilot_Design.md` 中的单个任务执行编码、编译、测试。

### 实现中调整

```
# Impl
# Update
<临时调整指令>
```

### 被中断后继续

直接发送：

```
# Impl
```

Agent 会读 `Copilot_Impl.md`，从中断处继续。

### 完成后自动行为

- 在 `Copilot_Scrum.md` 中标记任务为完成 `[v]`。
- 运行 `copilotBackup.ps1 -TaskOnly` 备份 Design+Impl。
- Workspace 恢复就绪，可开始下一个任务的 Design。

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

### 追问

```
# Doc
# Ask
<你的问题>
```

### 起草文档

```
# Doc
# Write
```

基于研究内容起草文档。审阅后说 **"commit"** 即可落盘到 `doc/`。

### 同步文档

```
# Doc
# Sync
```

读取所有备份文件中的 DOC IMPACT，研究变更，起草更新。说 **“commit”** 落盘。

备份行为取决于任务完成状态：

- **所有任务已完成**：运行 `copilotBackup.ps1`（完整备份），清空全部 workspace，进入下一轮 Scrum。
- **任务未全部完成**：运行 `copilotBackup.ps1 -DocOnly`，仅备份清理 Doc，保留 Scrum，可继续剩余任务。

### 提取经验教训

```
# Doc
# Learn
```

分析所有已完成任务的备份，提取编码教训、用户偏好、流程改进建议。审阅后说 **"commit"** 写入 `doc/`。

---

## Compact Mode（项目交接模式）

```
# Compact
```

生成结构化交接文档 `Copilot_Handoff.md`，用于知识迁移。

---

## 讨论（不修改文档）

直接发消息，**不加** `#` 前缀：

```
看一下 Copilot_Design.md 里的规格，
用 std::variant 还是继承体系更合适？
```

---

## 关键文件

| 文件 | 说明 |
|---|---|
| `AGENTS.md` | 所有 AI agent 的统一入口（路由） |
| `.github/copilot-instructions.md` | 通用规则手册 |
| `.github/guidelines/*.md` | 项目专属编码规范、构建命令 |
| `.github/prompts/scrum.prompt.md` | Scrum 模式的完整流程 |
| `.github/prompts/design.prompt.md` | Design 模式的完整流程 |
| `.github/prompts/impl.prompt.md` | Impl 模式的完整流程 |
| `.github/prompts/doc.prompt.md` | Doc 模式的完整流程 |
| `.github/prompts/compact.prompt.md` | Compact 模式的完整流程 |
| `.github/workspace/Copilot_Scrum.md` | 任务分解文档（跨 Design-Impl 周期持久） |
| `.github/workspace/Copilot_Design.md` | 单任务设计文档（每任务覆写） |
| `.github/workspace/Copilot_Impl.md` | 单任务实现日志（每任务覆写） |
| `.github/workspace/Copilot_Doc.md` | 文档研究草稿 |
| `.github/workspace/Copilot_Handoff.md` | 上下文压缩交接文档 |
| `.github/scripts/copilotBackup.ps1` | 备份脚本，支持 `-TaskOnly`、`-DocOnly` 和完整模式 |
| `.github/backup/` | 备份存档目录（按时间戳分文件夹） |

---

## 任务状态标记

在 `Copilot_Scrum.md` 的任务列表中：

| 标记 | 含义 |
|---|---|
| `[ ]` | 未开始 |
| `[x]` | Design 已取走，正在进行 |
| `[v]` | Impl 已完成并验证 |