% Pragya Kaushik - project - Hangman 

% Step 1: choose a random word from a list of words

% read from a text file in the same working directory 
textFile = 'easy_words_hangman.txt';
dataText = fileread(textFile);  % is a character array 
dataWords = splitlines(dataText);  % splits the text array into words - char array to cell array
disp(dataWords);

% build a vector of list of words from a text cell array
words=[]; % empty array
for i=[1:length(dataWords)]   
    % concatenate the word to the vector
    words = [words dataWords(i)];  
end
disp(words);

% choose random index
num_words = length(words);
rand_index = randi([1,num_words]);
disp(rand_index);

% display random word
rand_word = char(words(rand_index));
disp(rand_word);



% SOURCES for the list of words to play hangman 
% earsier level -- https://www.businessballs.com/glossaries-and-terminology/phonetic-alphabet/ 
% harder level -- https://www.hangmanwords.com/words
