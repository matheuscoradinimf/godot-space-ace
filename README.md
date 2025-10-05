# SpaceAce - 2D Space Shooter Game

A 2D space shooter game developed in Godot 4.4+ following the **Jumpstart to 2D Game Development: Godot 4.4+ for Beginners** course from Udemy.

## Demo
https://github.com/user-attachments/assets/f40d99b3-8753-47a3-9b07-bfd7550d2b02



## 🚀 About the Game

SpaceAce is a classic space shooter where you control a spaceship and must survive waves of enemies, collect power-ups, and achieve the highest score possible.

## ✨ Features

- **Smooth Controls** - Fluid ship movement with animations
- **Shooting System** - Different types of projectiles and missiles
- **Varied Enemies** - Different types of enemy ships with unique behaviors
- **Wave System** - Progressive enemy waves with increasing difficulty
- **Power-ups** - Collect items to enhance your ship
- **Scoring System** - Persistent high score
- **Visual Effects** - Explosions and particles
- **Pause System** - Pause/Resume functionality

## 🎮 Controls

- **WASD** or **Arrow Keys** - Move the ship
- **Space** - Shoot
- **P** - Pause/Unpause
- **ESC** - Exit game

## 🛠️ Technologies Used

- **Godot Engine 4.4+**
- **GDScript** - Main programming language
- **Signal System** - Node communication
- **Group System** - Object organization
- **Scene System** - Modular game structure

## 📁 Project Structure

```
SpaceAceStarter/
├── assets/                 # Game assets
│   ├── backgrounds/       # Backgrounds and stars
│   ├── fonts/            # Game fonts
│   ├── lasers/           # Projectile sprites
│   ├── misc/             # Effects and particles
│   ├── ships/            # Ship sprites
│   ├── sounds/           # Sound effects
│   └── ui/               # User interface
├── Classes/              # Utility classes
├── Globals/              # Singletons and managers
├── Resources/            # Data resources
└── Scenes/               # Game scenes
    ├── Enemies/          # Enemies and behaviors
    ├── Player/           # Player and controls
    ├── Projectile/       # Projectile system
    └── UI/               # User interface
```

## 🎯 Game System

### Enemies
- **EnemyBase** - Base class for all enemies
- **EnemyShip** - Basic enemy ship with shooting system
- **Saucer** - Special ship with homing missiles
- **Bomber** - Bomber ship with area attacks

### Power-ups
- **Health** - Restores ship health
- **Shield** - Temporary shield
- **Weapon Upgrade** - Improves weapon system

### Wave System
- Progressive enemy waves
- Increasing difficulty
- Controlled spawning of different enemy types
