function [day1toDay2,day2toDay3] = dayComparator(SubjectID, Day1, Day2, Day3)
%dayComparator calculates which subjects have increased isokinetic strength
%between all three days and returns them as cell arrays.
%   The dayComparator function takes input arguments SubjectID, Day1, Day2, and Day3 to
%   produce which subjects increased in isokinetic strength  between Day1
%   and Day2 and Day2 and Day3.  The subjects that increased are placed in
%   the output variables day1toDay2 and day2toDay3.

Diff1 = Day2 - Day1;
Diff2 = Day3 - Day2;

%Create table that displays d, SubjectID, Day1, Day2, Day3
%d is the variable name that is assigned to the value of Day2 - Day1
T3 = table(Diff1, SubjectID, Day1, Day2);
T4 = table(Diff2, SubjectID, Day2, Day3);
%sortrows sorts the entire table based on the values in column d
%values that display a negative value represent a decrease in isokinetic strength from Day1 to
%Day2
%values that display a positive value represent a increase in isokinetic strength from Day1 to
%Day2
D1toD2sort = sortrows(T3);
D2toD3sort = sortrows(T4);

%subIDincrease displays a column of the subjectID that increased from Day1
%to Day2
subIDincrease = D1toD2sort(14:25,2);
%day1toDay2 displays the subjectID that increased from Day1 to Day2 in a
%cell array
day1toDay2 = table2cell(subIDincrease)

%subIDincrease displays a column of the subjectID that increased from Day2
%to Day3
subIDincrease = D2toD3sort(15:25,2);
%day2toDay3 displays the subjectID that increased from Day2 to Day3 in a
%cell array
day2toDay3 = table2cell(subIDincrease)
end

