# Hangman

Created as part of The Odin Project curriculum.

View on [Repl.it](https://repl.it/@andrewjh271/hangman)

### Functionality

Basic hangman game. The user has the option at the beginning to start a new game or to load a saved game. The user can also save a game in progress.

### Thoughts

This was my first project using file I/O and serialization. I was glad the assignment mentioned that it is possible to serialize entire classes — at first I was making a Hash of all the instance variables and serializing that (that seems to amount to about the same thing). I ended up using YAML to serialize, for no reason in particular, though it does seem like YAML is very much a part of the Ruby and Rails world. The program seems to function well, though I'm not sure that I am using proper techniques and syntax. I took some of Rubocop's suggestions, but far from all.

-Andrew Hayhurst