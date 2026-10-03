#!/usr/bin/env sh
# 一键自动修复 + 格式化（参照 full-stack-fastapi-template 的 format 脚本）
# 用法：cd backend && uv run bash scripts/format.sh
set -e
set -x

ruff check . --fix
ruff format .
