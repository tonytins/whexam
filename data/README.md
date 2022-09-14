# Data

## tuning.json

``tuning.json`` is a file used to balance the game's varies mechanics.

```json
{
    "level_cap": 10,
    "max_xp": 100,
    "max_inf": 1000000,
    "enemies": {
        "thugs_easy": {
            "max_health": 100,
            "inf_drop": 50,
            "xp_drop": 30
        },
        "thugs_med": {
            "max_health": 150,
            "inf_drop": 100,
            "xp_drop": 50
        }
    }
}
```

### Base

| Property      | Purpose                                    |
| ------------- | ------------------------------------------ |
| ``level_cap`` | The highest level a player can reach.      |
| ``max_xp``    | The maximum experience needed to level up. |
| ``max_inf``   | The maximum influence a player can earn.   |
| ``enemies``   | The enemy's status.                        |

### Enemies

| Property          | Purpose                     |
| ----------------- | --------------------------- |
| ``max_health``    | The enemy's maximum health. |
| ``[inf,xp]_drop`` | The drop rates.             |