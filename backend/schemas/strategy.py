from datetime import datetime
from typing import Any

from pydantic import BaseModel


class StrategyBase(BaseModel):
    name: str
    description: str | None = None
    strategy_type: str
    parameters: dict[str, Any]


class StrategyCreate(StrategyBase):
    pass


class StrategyResponse(StrategyBase):
    id: int
    owner_id: int | None
    created_at: datetime
    updated_at: datetime

    class Config:
        from_attributes = True
