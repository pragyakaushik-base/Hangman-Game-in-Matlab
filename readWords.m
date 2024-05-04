function [words] = readWords(game_level)

    if game_level == "easy"
        textFile = 'easy_words_hangman.txt';
    elseif game_level == "hard"
        textFile = 'hard_words_hangman.txt';
    end
    % read from a text file in the same working directory 
    dataText = fileread(textFile);  % is a character array 
    dataWords = splitlines(dataText);  % splits the text array into words - char array to cell array

    % build a vector of list of words from a text cell array
    words=[]; % empty array
    for i=[1:length(dataWords)]   
        % concatenate the word to the vector
        words = [words dataWords(i)];  
    end

end