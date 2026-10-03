# Contributing

欢迎改进 QFO。为了保持项目简单可维护，建议先从小范围修改开始。

## 提交前检查

- 不提交本地密钥、Token、数据库、虚拟环境或依赖目录。
- 不提交 `backend/.env`、`.venv/`、`frontend/node_modules/`、`backend/quant_data.db` 和 `backend/logs/`。
- 不提交 `uv.lock`（本地生成，依赖版本以 `backend/pyproject.toml` 的宽约束为准）；README、启动脚本和配置说明需要和实际代码保持一致。

## pre-commit

提交钩子由 [pre-commit](https://pre-commit.com) 管理，首次使用需安装（之后每次 `git commit` 自动触发）：

```bash
cd backend
uv sync
uv run pre-commit install
```

钩子内容（配置见根目录 `.pre-commit-config.yaml`）：

- 通用文件卫生：行尾空白、文件末尾换行、YAML/TOML 语法、冲突标记、误提交大文件、残留 `breakpoint()`。
- 后端 ruff 检查与格式化：复用 `backend/pyproject.toml` 中的 lint 配置，自动修复部分问题并统一格式。

说明：

- 钩子只检查本次提交涉及的文件，历史代码不会被批量改动；被改动的文件会由 ruff format 统一格式化，属预期行为。
- 紧急提交可临时跳过钩子：`git commit --no-verify`。
- 手动全量检查：`uv run --project backend pre-commit run --all-files`。

## 本地测试

前端测试：

```bash
cd frontend
npm test
```

后端测试（推荐）：

```bash
cd backend
uv run pytest
```

后端测试（无 uv 时）：

```powershell
cd backend
$tests = Get-ChildItem tests -Filter "test_*.py" | ForEach-Object { $_.FullName }
..\.venv\Scripts\python.exe -m pytest $tests
```

`backend/tests/quick_connection_test.py` 会连接外部数据源，不作为普通本地测试必跑项。
