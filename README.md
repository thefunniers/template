# Copilot Workflow Template Repository

这个仓库是一个用于组织 GitHub Copilot 工作流的最小模板仓库，目标是把三类信息拆开管理：

- agent 路由规则。
- 项目级 guideline。
- 分阶段 prompt 模板。

它本身不是某个具体业务项目，而是一个可复制、可裁剪的工作流骨架。你可以在此基础上替换 guideline、补充 prompt、接入真实源码目录，然后把它作为团队约定的 Copilot 入口。

## 工作流模型

采用**单任务多阶段**模型，每个阶段是一次独立的 agent 请求，阶段之间的全部状态保存在文件里：

```
Scrum（一次） → [Design → Impl] × N 个任务 → Doc（一次）
```

## Repository Layout

- `AGENTS.md`
  - 仓库级入口文件。
  - 负责将用户请求路由到 `Scrum`、`Design`、`Impl`、`Doc`、`Compact` 或直接模式。
- `.github/copilot-instructions.md`
  - 通用工作约束。
  - 规定 agent 在实现前后需要读取哪些文件、如何处理 `doc/`、以及 markdown 书写要求。
- `.github/guidelines/`
  - 项目专属规则集合。
  - 用于描述技术栈、目录结构、构建测试命令、可修改范围和编码约束。
  - 当前包含：
    - `template.md`：一个通用占位模板，用于新项目初始化时复制并填空。
- `.github/prompts/`
  - 五种工作模式的模板定义：
    - `scrum.prompt.md`
    - `design.prompt.md`
    - `impl.prompt.md`
    - `doc.prompt.md`
    - `compact.prompt.md`
- `.github/workspace/`
  - 临时工作区，保存 Scrum 文档、设计稿、实现日志和文档研究草稿。
  - 这些文件默认不进版本控制。
- `.github/scripts/`
  - `copilotBackup.ps1`：备份脚本，支持三种模式：`-TaskOnly`（单任务备份）、`-DocOnly`（中途文档同步备份）和完整备份。
- `.github/backup/`
  - 备份存档目录，按时间戳分文件夹。
- `MANUAL.md`
  - 中文速查手册，面向人类使用者，快速说明各模式的入口和切换方法。

## Workflow Modes

### Scrum Mode

通过以下前缀进入：

```md
# Scrum
# Problem
<需求描述>
```

用途：

- 分析需求，拆分为小粒度、有序的任务列表。
- 输出到 `.github/workspace/Copilot_Scrum.md`。
- 此文档在整个 Scrum 周期内持久存在，跨多次 Design-Impl 周期。

### Design Mode

通过以下前缀进入：

```md
# Design
# Task
next
```

用途：

- 从 `Copilot_Scrum.md` 中取走一个任务。
- 进行详细设计分析，产出实现级别的规格说明。
- 输出到 `.github/workspace/Copilot_Design.md`。

### Impl Mode

通过以下前缀进入：

```md
# Impl
```

用途：

- 按 `Copilot_Design.md` 中的单个任务规格执行编码。
- 编译、测试并记录修复尝试。
- 完成后自动标记 Scrum 任务为完成，并备份 Design+Impl。
- 输出到 `.github/workspace/Copilot_Impl.md`。

### Doc Mode

通过以下前缀进入：

```md
# Doc
# Sync
```

用途：

- 同步文档变更到 `doc/`。支持中途同步（Scrum 未完成时仅备份 Doc）和完整同步（所有任务完成后备份全部 workspace）。
- 支持 `# Learn` 子命令从已完成任务中提取经验教训。
- 使用 `.github/workspace/Copilot_Doc.md` 作为中间研究稿。

### Direct Mode

用户消息没有特殊前缀时进入。

- 适合直接编码、改配置、补 README、做小范围重构或自由讨论。

### Compact Mode

```md
# Compact
```

- 生成结构化交接文档 `Copilot_Handoff.md`，用于知识迁移。

## How To Use This Template

1. 复制本仓库或直接在此基础上初始化你的项目。
2. 根据实际技术栈修改 `.github/guidelines/`。
3. 如果已有成熟流程，按团队习惯调整 `.github/prompts/*.prompt.md`。
4. 把真实源码目录、测试目录和构建脚本放入仓库。
5. 补充 `doc/README.md` 及模块文档，让 `Doc` 模式有可依赖的知识索引。

## Minimal Adoption Checklist

- 明确 `AGENTS.md` 的模式路由是否符合团队预期。
- 至少保留一份真实有效的 `.github/guidelines/*.md`。
- 确认 `.github/prompts/*.prompt.md` 的输出文件名和团队流程一致。
- 若启用 `Doc` 模式，先建立 `doc/README.md` 作为索引。
- 在仓库 README 中说明哪些文件是模板、哪些文件会被实际执行。
