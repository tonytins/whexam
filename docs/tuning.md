# tuning.json

``tuning.json`` is a complex file used to balance the game's varies mechanics, such as drop rates, caps and other limits.

```json
{
    "limits": {
        "level_cap": 10,
        "max_inf": 100000
    },
    "levels": {
        "1": {
            "required_xp": 0,
            "bonus_inf": 0
        }
    },
    "enemies": {
        "gang_easy": {
            "inf_drop": 100,
            "xp_drop": 50
        }
    }
}
```

## Limits

| Property      | Purpose                                  |
| ------------- | ---------------------------------------- |
| ``level_cap`` | The highest level a player can reach.    |
| ``max_inf``   | The maximum influence a player can earn. |

## Levels

| Property      | Purpose                                  |
| ------------- | ---------------------------------------- |
| ``base_xp``   | The XP required to level up.             |
| ``bonus_inf`` | The maximum influence a player can earn. |

## Enemies

| Property          | Purpose                     |
| ----------------- | --------------------------- |
| ``max_health``    | The enemy's maximum health. |
| ``[inf,xp]_drop`` | The drop rates.             |
