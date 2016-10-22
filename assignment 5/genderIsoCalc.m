function [maleIsoIndMeans,femaleIsoIndMeans,maleGroupIsoMean,femaleGroupIsoMean] = genderIsoCalc(Gender,Day1,Day2,Day3)
%genderIsoCalc calculates male and female individual and group means and
%returns four output arguments.
%   The genderIsoCalc function takes input arguments Gender, Day1, Day2,
%   Day3.  The function returns indivdual male and female (maleIsoIndMeans
%   and femaleIsoIndMeans) isokinetic strength means as a matrix.  The
%   remaining output arguments are maleGroupIsoMean and femaleGroupIsoMean
%   and returns a single value for each. 

%create table of Gender, Day1, Day2, and Day3
isokdata6803 = table(Gender, Day1, Day2, Day3);

%create a new table variable that sorts the isokdata6803 table by females and males
tableIsok = sortrows(isokdata6803);

%T1 sorts all the data from the females into their own table 
T1 = tableIsok(1:12,:);
%calculates the mean value from Day1 Day2 Day3 for each female
femaleIsoIndMeans = mean(T1{:,2:end},2)
%calculates the mean for the entire group of females
femaleGroupIsoMean = sum(femaleIsoIndMeans)/12
%T2 sorts all the data from the males into their own table
T2 = tableIsok(13:25,:);
%calculates the mean value from Day1 Day2 Day3 for each male
maleIsoIndMeans = mean(T2{:,2:end},2)
%calculates the mean for the entire group of males
maleGroupIsoMean = sum(maleIsoIndMeans)/13

end

