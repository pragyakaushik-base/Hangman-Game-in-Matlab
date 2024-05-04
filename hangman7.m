% Pragya Kaushik - project - hangman 

% Step 7: display stick figure images when user loses one life. 

% greet the user and ask user for difficulty level
name = input("\nHi there! Welcome to the Hangman Game! \n\nHow may I address you? \n", "s");
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
allWords = readWords(level); 

% choose random word
num_words = length(allWords);
rand_index = randi([1,num_words]);
rand_word = char(lower(allWords(rand_index)));

numLives = 7;  % set max num of lives
current_word_stage = rand_word;  % initialisation

% set the current_word_stage -- with all blanks
for i = 1:length(rand_word)
    current_word_stage(i) = '_';
end

fprintf("Without any further ado, let's start.\n");

wrongGuesses = [];  % vector for wrong guesses
correctGuesses = [];  % vector for wrong guesses
gameIsOn = 1;  % gameIsOn is True 
userWins = 0;

% while loop will continue till zero lives are left.

while (gameIsOn)
    
    fprintf("\nGuess the word for the following blanks: ");
    % looping through to display a blank per letter in the word 
    for i = 1:length(current_word_stage)
        fprintf("%s ", current_word_stage(i));
    end
    fprintf("\n");

    % disp(rand_word); % displayed for testing purposes only

    % ask user for a letter input 
    guess = lower(input("Guess a letter: ", "s"));  
    letter = guess(1); % in case, the user inputs many letters at a time

    % find letter in word
    positions = strfind(rand_word, letter);
    
    fprintf("\n");
    
    % Possible cases accounted for through the if/elseif/else statement
    
    if length(strfind(wrongGuesses, letter)) > 0

        % wrong guess is repeated
        fprintf("You have already guessed '%s' before. You don't lose any lives. Lives left: %d.\n", letter, numLives);
        
        fprintf("\n")
        
    elseif length(strfind(correctGuesses, letter)) > 0
        
        % correct guess is repeated
        fprintf("You have already guessed '%s' before. It is in the word. You don't lose any lives. Lives left: %d.\n", letter, numLives);
        
        fprintf("\n")

    elseif (length(positions) > 0)

        % Letter guessed is correct
        
        % Now, for the positions at which the guessed letter exists, replace the
        % blanks with the letter
        
        for i = 1:length(positions)
            
            letterIndex = positions(i);
            current_word_stage(letterIndex) = letter;  % new version of the word
            
            correctGuesses = [correctGuesses letter]; % add/concatenate the letter to the list for correct guesses
        end

        fprintf("You have guessed '%s', it's a correct guess. You don't lose any life. Lives left: %d.", letter, numLives);
        fprintf("\n");
        
    else
        
        % Letter guessed is wrong.
        numLives = numLives - 1;
        
        % add/concatenate the letter to the list for wrong guesses
        wrongGuesses = [wrongGuesses letter];
        
        fprintf("You have guessed '%s', it's not in the word. You lose a life. Lives left: %d.", letter, numLives);
        fprintf("\n");
        
        hangmanGallowLevel(numLives);  % would siplay a stick figure image when user loses a life. 

    end
    
    if length(correctGuesses) == length(rand_word)  % exception to stop while loop 
        % user wins
        userWins = 1;
        gameIsOn = 0; % gameIsOn turned to False
    end
    
    % to stop while loop when no lives left
    if numLives == 0       
        gameIsOn = 0; % gameIsOn turned to False
    end
    
end

% display the final outcome of the game
if userWins == 1
    fprintf("\n\nHip hip hooray! You win! \nYou are correct, the word is '%s'.\n", rand_word);
else
    fprintf("\n\nWhomp whomp... you lose. \nThe word was '%s'.\n", rand_word);
end

