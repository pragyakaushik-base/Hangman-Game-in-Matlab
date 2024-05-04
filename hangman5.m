% Pragya Kaushik - project - hangman 

% Step 5: Keep count of lives. If guess is correct, the number of lives
% doesn't change. If guess is wrong, the number of lives decreases by one.
% If guess is repeated, the number of lives don't change. Show all of this
% in output when required. 


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
numLives = 7;

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

if length(strfind(wrongGuesses, letter)) > 0
    
    % guess is repeated
    fprintf("You have already guessed '%s' before. You don't loose any lives. Lives left: %d.\n", letter, numLives);
    fprintf("Currently, the word looks like: ");
    % to print current_word_stage
    for i = 1:length(current_word_stage)
        fprintf("%s ", current_word_stage(i));
    end
    fprintf("\n");
    
elseif (length(positions) > 0)
    
    % Hence the letter guessed is correct
    % Now, for the positions at which the guessed letter exists, replace the
    % blanks with the letter
    for i = 1:length(positions)
        letterIndex = positions(i);
        current_word_stage(letterIndex) = letter;
    end
    
    fprintf("You have guessed '%s', it's a correct guess. You don't loose any life. Lives left: %d.", letter, numLives);
    fprintf("\n");
    fprintf("Currently, the word looks like: ");
    
    % to print current_word_stage
    for i = 1:length(current_word_stage)
        fprintf("%s ", current_word_stage(i));
    end
    fprintf("\n");
    
else
    
    numLives = numLives - 1;
    % add/concatenate the letter to the list for wrong guesses
    wrongGuesses = [wrongGuesses letter];
    fprintf("You have guessed '%s', it's not in the word. You loose a life. Lives left: %d.", letter, numLives);
    fprintf("\n");
    fprintf("Currently, the word looks like: ");
    
    % to print current_word_stage
    for i = 1:length(current_word_stage)
        fprintf("%s ", current_word_stage(i));
    end
    fprintf("\n");
    
end






% PRINT OUT ASCII ART END OF EACH GUESS - KEEP ASCII ART AND WORDS in a
% different file and use relative path.
% present the word with accomplished hints 

% a limited number of lives but when same guess made again or letter
% already in hint, don't deduct life.


% make FUNCTIONS