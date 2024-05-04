# Hangman-Game-in-Matlab
(First year CS project)

## Overview
This Hangman Game is a simple text-based implementation in MATLAB. The game prompts the user to choose a difficulty level, then randomly selects a word from a predefined list based on the chosen level. The user then guesses letters to uncover the word. Each incorrect guess results in the decrement of a life, and the game continues until the user either guesses the word correctly or runs out of lives.

## Usage
1. Run the MATLAB script.
2. Follow the prompts to choose the difficulty level and guess letters to uncover the word.

## How to Play
1. Upon starting the game, you will be greeted and asked to choose a difficulty level: 'easy' or 'hard'.
2. You will then begin the game with a certain number of lives.
3. Guess letters one by one to uncover the word.
4. For each correct guess, the corresponding blanks will be filled with the correct letter.
5. For each incorrect guess, you will lose a life, and part of the hangman figure will be drawn.
6. The game continues until you either correctly guess the word or run out of lives.

## Features
- Random word selection based on difficulty level.
- Visual representation of the hangman figure as lives are lost.
- Validation for user input to ensure a valid difficulty level is chosen.
- Handling of repeated guesses (both correct and incorrect).

## Files
- `hangmanFinal.m`: Main MATLAB script containing the Hangman game logic.
- `easy_words.txt`: Text file containing easy-level words.
- `hard_words.txt`: Text file containing hard-level words.
