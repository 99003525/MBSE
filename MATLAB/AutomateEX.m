clear all;
clc;
text = fileread('LTTS.html');
Lines = strsplit(text,newline);
k=1;
d=1;
for i=1:length(Lines)
    if contains(Lines{i},"<img")
        newStr = extractBetween(Lines{i},"<img",">");
        for j=1:length(newStr)
            ValueStorage{k}=newStr{j};
            k=k+1;
        end
    end
end     
fprintf("number of images s in this website is %d",k)
ValueStorage=vertcat("img Tag Value",ValueStorage');
ValueStorage_XLS= cellstr(ValueStorage);
xlswrite("img.xlsx",ValueStorage_XLS);

for i=1:length(Lines)
    if contains(Lines{i},"<a")
        newStr1 = extractBetween(Lines{i},"<a",">");
        for j=1:length(newStr1)
            ValueStorage1{d}=newStr1{j};
            d=d+1;
        end
    end
end     
fprintf("and number of hyperlink in this website is %d",d)
ValueStorage1=vertcat("html Tag Value",ValueStorage1');
ValueStorage_XLS1= cellstr(ValueStorage1);
xlswrite("html.xlsx",ValueStorage_XLS1);



