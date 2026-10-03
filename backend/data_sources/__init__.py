"""
数据源模块
支持 Tushare, Baostock, AkShare
"""

from .akshare_source import AkShareSource
from .baostock_source import BaostockSource
from .base import DataSourceBase

# Tushare 需要 Token，单独处理
try:
    from .tushare_source import TushareSource
except ImportError:
    TushareSource = None

__all__ = ["DataSourceBase", "AkShareSource", "BaostockSource", "TushareSource"]
