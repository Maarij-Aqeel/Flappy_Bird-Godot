# Flappy Bird Game in Godot

A fun and challenging Flappy Bird-style game developed in Godot using GDScript(Similar to python).

---

## 🛠️ Features

- **Procedural Pipe Generation**: Pipes are dynamically generated with varying heights to keep gameplay engaging.
- **Responsive Controls**: Smooth and precise controls for flapping the bird.
- **Game Over State**: The game stops when the bird collides with a pipe or the ground, ensuring a clear end to the session.
- **Restart Functionality**: Players can easily restart the game after a game over.

---

## 📂 File Structure

```plaintext
flappy-bird-godot/
├── scenes/
│   ├── Main.tscn        # Main scene containing game logic
│   ├── Bird.tscn        # Bird scene
│   ├── Pipe.tscn        # Pipe scene
│   └── Ground.tscn      # Ground scene
├── scripts/
│   ├── Main.gd          # Main script controlling the game
│   ├── Bird.gd          # Bird mechanics and logic
│   ├── Pipe.gd          # Pipe behavior and collisions
│   └── Ground.gd        # Ground scrolling logic
└── assets/
    ├── sprites/         # Sprites for the bird, pipes, and ground
    └── sounds/          # Sound effects for flapping and collision
```
## 🚀 How to Run

1. Clone this repository:
   ```bash
   git clone https://github.com/your-username/flappy-bird-godot.git
