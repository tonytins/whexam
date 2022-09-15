# Data

## tuning.json

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

## persist.json

Persist is used for saving player 