
function [] = hangmanGallowLevel(numLivesLeft)
    % depending on the number of lives left, the hangman gallow levels up.
    % depending on the number inputted as the argument - the corresponding
    % image pops-up. 
    
    if numLivesLeft == 6
        close all;
        img = imread('img_lives6.png');
        imshow(img);
        title('Lives left: 6');  % from matlab documentation
        
    elseif numLivesLeft == 5
        close all;
        img = imread('img_lives5.png');
        imshow(img);
        title('Lives left: 5');
        
    elseif numLivesLeft == 4
        close all;
        img = imread('img_lives4.png');
        imshow(img);
        title('Lives left: 4');
        
    elseif numLivesLeft == 3
        close all;
        img = imread('img_lives3.png');
        imshow(img);
        title('Lives left: 3');
        
    elseif numLivesLeft == 2
        close all;
        img = imread('img_lives2.png');
        imshow(img);
        title('Lives left: 2');
        
    elseif numLivesLeft == 1
        close all;
        img = imread('img_lives1.png');
        imshow(img);    
        title('Lives left: 1');
        
    elseif numLivesLeft == 0
        close all;
        img = imread('img_lives0.png');
        imshow(img);
        title('Lives left: 0');
    end
        
end
