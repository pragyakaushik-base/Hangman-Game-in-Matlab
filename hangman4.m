% Pragya Kaushik - project - hangman 

% Step 4: Check whether inputted letter guess is correct or not. If yes,
% letter should replace the respective blank. If no, add the letter to a
% vector of hit-and-miss guesses. And then, display a brief result of the
% inputted leter.

% greet the user and ask user for difficulty level
name = input("\n\nHi there! Welcome to the Hangman Game! \n\nHow may I address you? \n", "s");
fprintf("\n%s, please choose your difficulty level for the game.\n", name);
level = input("Enter 'easy' or 'hard': ", "s");
level = lower(level); % lowercase all the letters
% in case the input for level is longer or smaller than the expected length
while length(level) ~= 4
    fprintf("Please enter a valid level.\n");
    level = lower(input("Please enter 'easy' or 'hard': ", "s"));
end

% confirm the level to the user - show that the input was received by the program
fprintf("\nAlright! %s, you have chosen the %s level. Good luck!\n", name, level);

% read the words from a file and store them in an array
allWords = readWords(level); % changed the parameter of the function to game_level from textFile

% choose random word
num_words = length(allWords);
rand_index = randi([1,num_words]);
rand_word = char(lower(allWords(rand_index)));

current_word_stage = [];

% give the user some hints
fprintf("Without any further ado, let's start.\n");
fprintf("\nGuess the word for the following blanks: ");
% looping through to display a blank per letter in the word 
for i = 1:length(rand_word)
    fprintf("_ ");
    current_word_stage = [current_word_stage '_'];
end
fprintf("\n");

disp(rand_word); % displayed for testing purposes only

% ask user for a letter input 
guess = lower(input("Guess a letter: ", "s"));  
letter = guess(1); % in case, the user inputs many letters at a time

% find letter in word
positions = strfind(rand_word, letter);

% vector for wrong guesses
wrongGuesses = [];

if (length(positions) > 0)
    
    % Hence the letter guessed is correct
    % Now, for the positions at which the guessed letter exists, replace the
    % blanks with the letter
    for i = 1:length(positions)
        letterIndex = positions(i);
        current_word_stage(letterIndex) = letter;
    end
    
    fprintf("You entered '%s'. It's a correct guess: ", letter);

    % to print current_word_stage
    for i = 1:length(current_word_stage)
        fprintf("%s ", current_word_stage(i));
    end
    fprintf("\n");
    
else
    
    % add/concatenate the letter to the list for wrong guesses
    wrongGuesses = [wrongGuesses letter];
    fprintf("You entered '%s'. It's a wrong guess: ", letter);

    % to print current_word_stage
    for i = 1:length(current_word_stage)
        fprintf("%s ", current_word_stage(i));
    end
    fprintf("\n");   
end

