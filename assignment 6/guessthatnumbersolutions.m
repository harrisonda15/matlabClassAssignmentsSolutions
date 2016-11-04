function guessThatNumber()  % *** WARNING: CONTAINS INTENTIONAL BUGS! ***
%---------------------------------------------------------------
%       USAGE: guessThatNumber()
%
%        NAME:  David Harrison
%
%         DUE: November 3
%
%
% DESCRIPTION: This program is supposed to allow the user to play
%              the Number Guessing Game, however, it contains bugs.
%              Your job is to find, correct, and mark the errors with
%              comments describing the bug, how you found it, 
%              and how you corrected it. Correct the bugs and submit this
%              corrected file on github.
%
%      INPUTS: None
%
%     OUTPUTS: None
%
%---------------------------------------------------------------

beginner = 1;               % beginner level #
moderate = 2;               % moderate level #
advanced = 3;               % advanced level #
beginnerHighest = 10;       % highest possible number for beginner
moderateHighest = 100;      % highest possible number for moderate
advancedHighest = 1000;    % highest possible number for advanced

% clear screen and display game introduction

clc()
fprintf(['Guess That Number Game (buggy)\n\n', ...
'This program plays the game of Guess That Number in which you have to guess\n', ...
'a secret number.  After each guess you will be told whether your \n', ...
'guess is too high, too low, or correct.\n\n'])

% Get level of play (1-3) from user

fprintf('Please select one of the three levels of play:\n')
fprintf('   1) Beginner (range is 1 to %d)\n', beginnerHighest)
fprintf('   2) Moderate (range is 1 to %d)\n', moderateHighest)
fprintf('   3) Advanced (range is 1 to %d)\n', advancedHighest)

level = input('Enter level (1-3): '); 
%Bug 5 the error keeps the user in an infinite loop because the
%statement is always true.  To make the statement false we must change...
%the || conditional statements to && conditional statements
while level ~= beginner && level ~= moderate && level ~= advanced       
fprintf('Sorry, that is not a valid level selection.\n')
level = input('Please re-enter a level of play (1-3): ');
end

% set highest secret number based on level selected
%Bug1 in this if statement level was assigned to the
%variable beginner instead of setting it equal to beginner
%The error stated that value next to the equal sign is invalid

if level == beginner                     

highest = beginnerHighest;

elseif level == moderate

highest = moderateHighest;

else
% %Bug3 The letter h in highest needed to be capitalized...
%to reflect Highest
highest = advancedHighest;         
end

% randomly select secret number between 1 and highest for level of play
%Bug6 any number that I input is being returned as the winning number...
%I changed the secretNumber equation to pick a random interger between 1
%and the highest value possibly for that difficulty level
secretNumber = randi([1, highest]);     

% initialize number of guesses and User_guess
%Bug4 after scanning the script the initial number of tries should be set... 
%to zero and not 1
numOfTries = 0;
userGuess = 0;

% repeatedly get user's guess until the user guesses correctly

while userGuess ~= secretNumber

% get a valid guess (an integer from 1-Highest) from the user

fprintf('\nEnter a guess (1-%d): ', highest);
userGuess = input('');
%Bug7 delete the equal sign next to the greater than symbol
while userGuess < 1 || userGuess > highest

fprintf('Sorry, that is not a valid guess.\nRe-enter a guess (1-%d): ', highest);

userGuess = input('');

end % of guess validation loop

% add 1 to the number of guesses the user has made

numOfTries = numOfTries + 1;

% report whether the user's guess was high, low, or correct
%Bug8 for the userGuess to be too low it must be less than the secretNumber
%Change the greater than symbol to less than <
if userGuess < secretNumber
fprintf('Sorry, %d is too low.\n', userGuess);
elseif userGuess > secretNumber 
fprintf('Sorry, %d is too high.\n', userGuess);
%Bug10 in order to guess the number on the first try the userGuess must
%also equal the secretNumber.  Add the && shortcut and set the userGuess ==
%to the secretNumber
elseif numOfTries == 1 && userGuess ==secretNumber
fprintf('\nLucky You!  You got it on your first try!\n\n');
else
%Bug9 The errors says that the user got the secretNumber but does not display...
%the number of tries it took. "numOfTries" must be added following
%secretNumber
fprintf('\nCongratulations!  You got %d in %d tries.\n\n', ...
secretNumber, numOfTries);


fprintf('Game Over. Thanks for playing the Guess That Number game.\n\n');

end  % of guessing while loop
end %Bug2 the error stated atleast one end statement was missing and this ...
%end statement terminates the entire function 

% end of game