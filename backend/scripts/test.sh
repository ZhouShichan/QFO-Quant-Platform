#!/usr/bin/env bash
# 覆盖率测试入口：pytest + 终端覆盖率报告 + htmlcov/ 网页报告
# 用法：cd backend && uv run bash scripts/test.sh
set -e
set -x

coverage run -m pytest tests/
coverage report
coverage html --title "${@-coverage}"
