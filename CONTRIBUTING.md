# Contributing

欢迎改进 QFO。为了保持项目简单可维护，建议先从小范围修改开始。

## 提交前检查

- 不提交本地密钥、Token、数据库、虚拟环境或依赖目录。
- 不提交 `backend/.env`、`.venv/`、`frontend/node_modules/`、`backend/quant_data.db` 和 `backend/logs/`。
- 不提交 `uv.lock`（本地生成，依赖版本以 `backend/pyproject.toml` 的宽约束为准）；README、启动脚本和配置说明需要和实际代码保持一致。

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
