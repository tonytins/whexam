# Data

## tuning.json

``tuning.json`` is a file used to balance the game's varies mechanics.

**Example**

```json
{
    "level_cap": 100,
    "max_ep": 100,
    "max_inf": 1000000,
    "enemy_rates": {
        "lvl1-2": {
            "inf": 100,
            "xp": 30
        }
    }
}
```

| Property        | Purpose                                                     |
| --------------- | ----------------------------------------------------------- |
| ``level_cap``   | The highest level a player can reach.                       |
| ``max_xp``      | The maximum experience needed to level up.                  |
| ``max_inf``     | The maximum influence a player can earn.                    |
| ``enemy_rates`` | The influence and experience enemies give for every defeat. |
