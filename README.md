# Chill Land Game

A simple 2D scrolling shooter game created with Godot Engine.

## Features

- **Character Control**: Use arrow keys to move, spacebar to shoot
- **Parallax Background**: Three layers of scrolling background with decorative elements
- **Power-ups**: Collect +2 and *3 items to increase bullet count
- **Enemies**: Shoot enemies to earn points
- **Score System**: Track your score as you play

## Project Structure

```
d:/chill-land/
├── Main.tscn          # Main game scene
├── Main.gd            # Main game logic
├── project.godot      # Project configuration
├── Scripts/           # Game scripts
│   ├── Bullet.gd      # Bullet behavior
│   ├── Enemy.gd       # Enemy behavior
│   ├── Item.gd        # Base item class
│   ├── ItemAdd.gd     # +2 bullet item
│   ├── ItemMultiply.gd # *3 bullet item
│   ├── Main.gd        # Main game logic
│   └── Player.gd      # Player control
└── Scenes/            # Game scenes
    ├── Bullet.tscn    # Bullet scene
    ├── Enemy.tscn     # Enemy scene
    ├── Item.tscn      # Base item scene
    ├── ItemAdd.tscn   # +2 bullet item scene
    ├── ItemMultiply.tscn # *3 bullet item scene
    └── Player.tscn    # Player scene
```

## How to Play

1. **Movement**: Use arrow keys to move your character
2. **Shooting**: Press spacebar to shoot bullets
3. **Collect Power-ups**: Grab green (+2) and yellow (*3) items to increase your bullet count
4. **Destroy Enemies**: Shoot red enemies to earn points
5. **Score Points**: Each enemy destroyed gives 50 points, each item collected gives 10 points

## Technical Details

- **Godot Version**: 4.2
- **Rendering Mode**: GL Compatibility
- **Language**: GDScript

## Known Issues

- None reported

## Changelog

### v1.0.0
- Initial release
- Basic gameplay mechanics
- Parallax scrolling background
- Item collection system
- Enemy spawning and shooting mechanics
- Score tracking
