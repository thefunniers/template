# Copilot Workflow Template Repository

这个仓库是一个用于组织 GitHub Copilot 工作流的最小模板仓库，目标是把三类信息拆开管理：

- agent 路由规则。
- 项目级 guideline。
- 分阶段 prompt 模板。

它本身不是某个具体业务项目，而是一个可复制、可裁剪的工作流骨架。你可以在此基础上替换 guideline、补充 prompt、接入真实源码目录，然后把它作为团队约定的 Copilot 入口。

## Repository Layout

- `AGENTS.md`
  - 仓库级入口文件。
  - 负责将用户请求路由到 `Design`、`Impl`、`Doc` 或直接模式。
- `.github/copilot-instructions.md`
  - 通用工作约束。
  - 规定 agent 在实现前后需要读取哪些文件、如何处理 `doc/`、以及 markdown 书写要求。
- `.github/guidelines/`
  - 项目专属规则集合。
  - 用于描述技术栈、目录结构、构建测试命令、可修改范围和编码约束。
  - 当前包含：
    - `base.md`：一个面向 C++/xmake 静态库项目的具体示例。
    - `template.md`：一个通用占位模板，用于新项目初始化时复制并填空。
- `.github/prompts/`
  - 三种工作模式的模板定义：
    - `design.prompt.md`
    - `impl.prompt.md`
    - `doc.prompt.md`
- `.github/workspace/`
  - 临时工作区，保存设计稿、实现日志和文档研究草稿。
  - 这些文件默认不进版本控制。
- `MANUAL.md`
  - 中文速查手册，面向人类使用者，快速说明各模式的入口和切换方法。

## Workflow Modes

### Direct Mode

用户消息没有特殊前缀时进入。

- 适合直接编码、改配置、补 README、做小范围重构或自由讨论。
- agent 会读取 `AGENTS.md`、`.github/copilot-instructions.md` 和 `.github/guidelines/*.md` 后直接在仓库中工作。

### Design Mode

通过以下前缀进入：

```md
# Design
# Problem
<需求描述>
```

用途：

- 先做任务拆分。
- 形成可执行的规格说明。
- 输出到 `.github/workspace/Copilot_Design.md`。

### Impl Mode

通过以下前缀进入：

```md
# Impl
```

用途：

- 按 `Copilot_Design.md` 中的任务顺序实施。
- 编译、测试并记录修复尝试。
- 输出到 `.github/workspace/Copilot_Impl.md`。

### Doc Mode

通过以下前缀进入：

```md
# Doc
# Topic
<主题>
```

用途：

- 研究源码。
- 起草或更新 `doc/` 下的正式文档。
- 使用 `.github/workspace/Copilot_Doc.md` 作为中间研究稿。

## How To Use This Template

1. 复制本仓库或直接在此基础上初始化你的项目。
2. 根据实际技术栈修改 `.github/guidelines/`。
3. 如果已有成熟流程，按团队习惯调整 `.github/prompts/*.prompt.md`。
4. 把真实源码目录、测试目录和构建脚本放入仓库。
5. 补充 `doc/README.md` 及模块文档，让 `Doc` 模式有可依赖的知识索引。

## Guidelines Strategy

推荐保留两类 guideline：

- 示例 guideline：展示一个真实项目该如何写清楚约束。
- 通用 template guideline：作为新仓库初始化的占位文本。

这样做的好处是：

- agent 在真实项目里可以读到具体规则。
- 模板仓库维护者也能快速复制出新的 guideline 文件。
- 团队成员能一眼区分“示例”和“当前项目生效规则”。

## Minimal Adoption Checklist

- 明确 `AGENTS.md` 的模式路由是否符合团队预期。
- 至少保留一份真实有效的 `.github/guidelines/*.md`。
- 确认 `.github/prompts/*.prompt.md` 的输出文件名和团队流程一致。
- 若启用 `Doc` 模式，先建立 `doc/README.md` 作为索引。
- 在仓库 README 中说明哪些文件是模板、哪些文件会被实际执行。

## Current Status

当前仓库内容更偏向“工作流模板示例”，适合用于：

- 搭一个新的 Copilot 协作规范仓库。
- 给团队沉淀统一的 design / impl / doc 流程。
- 作为其它真实项目的 `.github/` 基础模板来源。