% Pragya Kaushik - project - hangman 

% Step 2: refactor appropriately and show blanks of the word to user

% refactor code - make and call the function readWords
allWords = readWords('easy_words_hangman.txt'); 
% testing of the function has been done in it's driver script

% choose random word
num_words = length(allWords);
rand_index = randi([1,num_words]);
rand_word = char(allWords(rand_index));
disp(rand_word); % displayed for testing purposes only

% looping through to display a blank per letter in the word 
for i = 1:length(rand_word)
    fprintf("_ ");
end
fprintf("\n");
