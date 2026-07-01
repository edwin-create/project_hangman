# Ruby Hangman

A command-line implementation of the classic Hangman game built using Ruby. This project focuses on Object-Oriented Design (OOD), file I/O operations, and data serialization.

## Features

* **File Serialization:** Save your current game state at the beginning of any turn and resume playing exactly where you left off.
* **Dynamic Word Selection:** Pulls random secret words from an external dictionary file, filtering for optimal length (between 5 and 12 characters).
* **Robust Input Validation:** Handles cases such as duplicate guesses, numbers, and invalid characters gracefully.
