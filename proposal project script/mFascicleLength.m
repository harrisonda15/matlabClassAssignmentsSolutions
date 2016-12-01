%KINE 6803 Matlab project proposal 
%Created by: David Harrison
%Due date:  December 1st 
%This code loads a dicom image file into MATLAB and runs a series of
%functions against the original image to output an updatd image that gives
%the length of a muscle fascicle.

clc

%% Load Image

%First step-Load dicom image file and show image to the user
bfDistal = dicomread('I0000016');
fprintf('Directions for user on how to properly crop the image\n');
fprintf('1. Visually locate where the muscle fascicles are located within the image\n');
fprintf('2. Place the cursor in the upper left corner of the muscle fascicles\n');
fprintf('3. Excluding everything but the image of the muscle, draw a small rectangle that includes atleast 1 muscle fascicle\n');
fprintf('4. Once rectangle is drawn, make sure muscle fascicles are centered inside rectangle, right click and select crop image\n');
pause(10);
newbfDistal = imcrop(bfDistal); %%add in directions for the user to crop the image

%convert the image to a 2D grayscale image
I = rgb2gray(newbfDistal);

%% Hough transform

BW = edge(I,'Canny');
[H,T,R] = hough(BW);
HTGraph = figure('Name','Hough Transform and Peak added','NumberTitle','off');
imshow(H,[],'XData',T,'YData',R,'InitialMagnification','fit');
title('Hough transform of BF Distal');
xlabel('\theta'), ylabel('\rho');
axis on, axis normal, hold on;

%% Hough Peaks

%Find peaks in the Hough transform of the image
P = houghpeaks(H,1);
x = T(P(:,2)); y = R(P(:,1));
title('Hough Peaks')
plot(x,y,'s','color','white');

%% Hough Lines

%%Find lines within the image
lines = houghlines(BW,T,R,P,'FillGap',80,'MinLength',40);

%Figure for the Original image and updated image to show a side by side
%comparison of before and after image processing has taken place
Comparison = figure('Name','Image Comparison','NumberTitle','off');
subplot(1,2,1);
imshow(I); hold on
title('Updated Image');
%This tells the user that the value assigned to fascicleLen is outputed
%with the units of pixels.
fprintf('Measured in Pixels');

%% User Function #1
%I attempted to make this into a function but obviously struggled. The
%function was supposed to locate beginning and end points of lines from the
%hough lines function. Using the documentation I found another way to
%locate the beginning and end points, but it is not in function format.  

fascicleLen = 0;
for k = 1:length(lines)
    xy = [lines(k).point1; lines(k).point2];
    plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');
    
    %plot beginning and end points of a line
    plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
    plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');

%% User Function #2
%I tried a primary function for this and I kept getting the same error message.  
%The message said "Functions cannot be indexed using {} or . indexing.
%I googled the error message and searched thorugh the documentation
%and could not find a soultion, so I just put it in the script using an
%anonymous function. 
    
%Find endpoints of the longest line
    len = @(lines,k,point1,point2)norm(lines(k).point1 - lines(k).point2);
    len = norm(lines(k).point1 - lines(k).point2);
    if ( len > fascicleLen);
        fascicleLen = len           %This outputs the fascicle length in pixel units
        xy_long = xy;
    end     %end of the if statement
end         %end of for loop

plot(xy_long(:,1),xy_long(:,2),'LineWidth',2,'Color','cyan');
hold off 
subplot(1,2,2);
imshow(bfDistal);
title('Original Image');

%% Export
%The print function converts the original matlab figures to .png file
%format so they can be viewed outside of matlab
print('Comparison','-dpng')
print('HTGraph','-dpng')

