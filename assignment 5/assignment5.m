%Created by:  David Harrison 
%Matlab KINE 6803
%Due date - 10/20/16
%Description:  Analyze some isometric strength data
clc

%Create a function to import data from the file 'isok_data_6803.csv' and
%name it 'importfile'
%This function imports each column as a separate vector and the column
%headers are the vector names
[SubjectID,Age,Gender,Weight,Day1,Day2,Day3] = importfile('isok_data_6803.csv')

%Create a function to return individual mean isometric strength values
%across all 3 days for male and female and return the single mean value for
%male and female groups
genderIsoCalc(Gender,Day1,Day2,Day3);

%creates a function that shows which subjects have increased from Day1 to
%Day2 and from Day2 to Day3
%the function will display those subjcts that have increased in a cell
%array
dayComparator(SubjectID, Day1, Day2, Day3);

%Normalize isokinetic strength data to bodyweight
normDay1 = Day1./Weight;
normDay2 = Day2./Weight;
normDay3 = Day3./Weight;


normDay1mean = mean(normDay1)
normDay2mean = mean(normDay2)
normDay3mean = mean(normDay3)

%exporting data into excel sheets
xlswrite('iso_results.xlsx',femaleIsoIndMeans,'femaleIsoIndMeans')
xlswrite('iso_results.xlsx',maleIsoIndMeans,'maleIsoIndMeans')
xlswrite('iso_results.xlsx',femaleGroupIsoMean,'femaleGroupIsoMean')
xlswrite('iso_results.xlsx',maleGroupIsoMean,'maleGroupIsoMean')
xlswrite('iso_results.xlsx',day1toDay2,'day1toDay2')
xlswrite('iso_results.xlsx',day2toDay3,'day2toDay3')
xlswrite('iso_results.xlsx',normDay1mean,'normDay1mean')
xlswrite('iso_results.xlsx',normDay2mean,'normDay2mean')
xlswrite('iso_results.xlsx',normDay3mean,'normDay3mean')