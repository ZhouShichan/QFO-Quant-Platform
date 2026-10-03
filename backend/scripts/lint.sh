#!/usr/bin/env sh
# 只检查不修改：ruff lint + 格式一致性检查
# mypy 待代码完成类型注解后加入（见 pyproject.toml 注释段）
# 用法：cd backend && uv run bash scripts/lint.sh
set -e
set -x

ruff check .
ruff format . --check
