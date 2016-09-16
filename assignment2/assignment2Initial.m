%Assignment 2: Complete the assigned problems from chapters 1, 2, and 3

%Submitted by: David Harrison

%Due date: September 15

%%Chapter 1 Exercises
clc
%1.) Create a variable to store the atomic weight of copper (63.55)

atomicWeightCu = ('63.55');

%2.) Create a variable myage and store your age in it. Subtract two from the value of the
%variable. Add one to the value of the variable. Observe the Workspace Window and
%Command History Window as you do this

myage = 25;
myage = myage - 2;
myage = myage + 1;

%3.) 
%maximum number of characters that you can have in an identifier is: 63
namelengthmax;

%4.) 
%variable for weight in pounds
weightPounds = 200;
%variable for weight in ounces
weightOunces = 3200;
who;
whos;
clear weightOunces;
who;
whos;

%5.) Use intmin and intmax to determine the range of values that can be stored in the
%types uint32 and uint64

%minimum number of integers able to be stored for uint32
intmin('uint32'); 
%maximum number of integer able to be stored for uint32
intmax('uint32'); 
%minimum number of integers able to be stored for uint64
intmin('uint64');
%maximum number of integer able to be stored for uint64
intmax('uint64');

%6.) Store a number with a decimal place in a double variable (the default). Convert the
%variable to the type int32 and store the result in a new variable.

value = 10.10;
newValue = int32(value);

%11.) Create a variable pounds to store a weight in pounds. Convert this to kilograms and
%assign the result to a variable kilos. The conversion factor is 1 kilogram ¼ 2.2
%pounds.

pounds = 200;
kilos = convmass(200, 'lbm', 'kg');


%12.) Create a variable ftemp to store a temperature in degrees Fahrenheit (F). Convert
%this to degrees Celsius (C) and store the result in a variable ctemp. The conversion
%factor is C ¼ (F e 32) * 5/9.
%temperature in Fahrenheit
ftemp = 100;
%temperature in Celsius
ctemp = convtemp(100, 'F', 'C');


%13.) Find another quantity to convert from one system of units to another

legPressisoForce = 3000;
legPressNewtons = convforce(3000, 'lbf', 'N');

%14.) The function sin calculates and returns the sine of an angle in radians, and the
%function sind returns the sine of an angle in degrees. Verify that calling the sind
%function and passing 90 degrees to it results in 1. What argument would you pass
%to sin to obtain the result of 1?

sind(90);
sin(90*pi/180);

%15.) 
%Create variables for the three resistors and store values in each, and then calculate
%the combined resistance.
%resistor 1
R1 = 5;
%resistor 2
R2 = 10;
%%resistor 3
R3 = 15;
%calculation of total resistance 
RT = [(1) / (1/R1) + (1/R2) + (1/R3)];

%22.) In the ASCII character encoding, the letters of the alphabet are, in order: ‘a’ comes
%before ‘b’ and also ‘A’ comes before ‘B’. However, which comes first e
%lower or uppercase letters?

% e uppercase comes before e lowercase

%24.) What would be the result of the following expressions?

'b' >= 'c' -1;
%answer = 1
3 == 2 + 1;
%answer = 1
(3 == 2) + 1;
%answer = 1
xor(5 < 6, 8 > 4);
%answer = 0

%25.) Create two variables x and y and store numbers in them. Write an expression that
%would be true if the value of x is greater than 5 or if the value of y is less than 10,
%but not if both of those are true.

x = 7;
y = 15;
x > 5 | y < 10;

%26.) Use the equality operator to verify that 3*10^5 is equal to 3e5.

3*10^5 == 3e5;

%27.) Use the equality operator to verify the value of log10(10000).

log10(10000) == 4;

%% Chapter 2 Exercises

%1.) 1. Using the colon operator, create the following row vectors
%row vector for 2 3 4 5 6 7 
rv1 = 2:7;
%row vector for 1.1000 1.3000 1.5000 1.7000
rv2 = 1.1:.2:1.7;
%row vector for 8 6 4 2
rv3 = 8:-2:2;

%2.) Give the MATLAB expression that would create a vector (in a variable called vec)
%of 50 elements that range, equally spaced, from 0 to 2pi

vec = linspace(0, 2*pi, 50);

%3.) Write an expression using linspace that will result in the same as 2: 0.2: 3.

lsVec = linspace (2, 3, 6);

%4.) Using the colon operator and also the linspace function, create the following row
%vectors:
%row vector and linspace function for -5 -4 -3 -2 -1
RV4 = -5:-1;
Lspace4 = linspace(-5, -1, 5);
%row vector and linspace function for 5 7 9
RV5 = 5:2:9;
Lspace5 = linspace(5, 9, 3);
%row vector and linspace function for 8 6 4
RV6 = 8:-2:4;
Lspace6 = linspace(8, 4, 3);

%6.) Using the colon operator and the transpose operator, create a column vector that
%has the values -1 to 1 in steps of 0.5.
%exampleTranspose is a column vector 
exampleTranspose = -1:.5:1;
exampleTranspose';

%7.) Write an expression that refers to only the odd-numbered elements in a vector,
%regardless of the length of the vector. Test your expression on vectors that have
%both an odd and an even number of elements
rowVector7 = [1 3 5 4 6 8 2 10];
odd = rowVector7(mod(rowVector7,2)~=0);



%8.) 
%Find an efficient way to generate the following matrix
%mat is a variable for the generated matrix 
mat = [7:10; 12:-2:6];
mat(1,3);
mat(2,:);
mat(1:2, 1:2);

%9.)

%Generate a 2 x 4 matrix variable mat. Verify that the number of elements is the
%product of the number of rows and columns

mat = [2:5; 6:9];
numel(mat);

%10.) 

%Generate a 2 x 4 matrix variable mat. Replace the first row with 1:4. Replace the
%third column (you decide with which values).

mat = randi(10, 2, 4);
mat(1,:) = 1:4;
mat(:,3) = 9:10;

%12.) 
%Variable rows is a random integer with a range of 1 to 5
rows = randi([1, 5]);
%Variable cols is a random integer with a range of 1 to 5
cols = randi([1, 5]);
%This creates a matrix of zeros with dimensions given by rows and cols
zeros(rows, cols);

%23.) vec23 means vector for problem #23
%Find the sum 3 + 5 + 7 + 9 + 11
vec23 = 3:2:11;
sum(vec23);

%26.) 
%Create a vector for the numerator
numerators = [3:2:9];
%Create a vector for the denominator 
denominators = [1:4];
%Divide the totals and then add them together 
numerators ./ denominators;
sum(ans);

%30.)
%Create a vector of five random integers, each in the inclusive range from -10 to 10.
vector30 = randi([-10,10], 1, 5);
%subtract 3 from each element
vector30 - 3;
%count how many are positive
sign(ans);
%get the absolute value of each element
abs(vector30);
%find the maximum
max(vector30);

%31.) mat31 means matrix for problem #31
%Create a 3 x 5 matrix. Perform each of the following:
mat31 = randi(100,3,5);
%Find the maximum value in each column
max(mat31);
%Find the maximum value in each row
max(mat31,[],2);
%Find the maximum value in the entire matrix
max(max(mat31));

%%Chapter 3 Exercises

%1.) calculate the volume of a hollow sphere.  rI is the variable the inner
%radius will be assigned to and rO is the variable the outer radius will be
%assigned to.  sphereVolume is variable for the volume of the hollow
%sphere. 

rI = 5;
rO = 10 ;
sphereVolume = ((4*pi)/3 * (rO^3 -rI^3));

%4.) The input function can be used to enter a vector, Experiment with this and find out how the user can enter a matrix

matrix4 = [1 2 3; 4 5 6];
fprintf('%d\n' , matrix4);


%6.) 

%without specifying any field width: when this is printed it prints the
%number that is given as the input value with the original dimensions
fprintf('12345.6789\n');
%in a field width of 10 with 4 decimal places:  this prints the same number
%because '12345.6789' has already has a field width of 10 and 4 decimal
%places
fprintf('%10.4f\n', 12345.6789);
%in a field width of 10 with 2 decimal places:  This prints the value
%'12345.68' which has two less decimal places
fprintf('%10.2f\n', 12345.6789);
%in a field width of 6 with 4 decimal places: This prints '12345.6789' I
%think because the field width is less than what is originally specified
%but the four decimal places is correct 
fprintf('%6.4f\n', 12345.6789);
%in a field width of 2 with 4 decimal places: similar to the previous
%problem, the specified field width is less than the originally specified
%number and prints '12345.6789'
fprintf('%2.4f\n', 12345.6789);

%8.)

fprintf('flowrate\n');
input('Enter the flow in m^3/s (enter value):');
fprintf('A flow rate of 15.200 meters per sec\n');
fprintf('is equivalent to %7.3f feet per sec\n', 15.200 / 0.028);


%13.) 

X = input('Enter the value for velocity in the x direction:\n(enter 2.34) ');
Y = input('Enter the value for velocity in the y direction:\n(enter 4.244) ');
Z = input('Enter the value for velocity in the z direction:\n(enter 5.323) ');
%Calculating magnitude for the unit vector first
magnitude = (X^2) + (Y^2) + (Z^2);
%The magnitude variable becomes the denominator when calculating the unit
%vector

unitVector = (X^2)/magnitude + (Y^2)/magnitude + (Z^2)/magnitude;






























