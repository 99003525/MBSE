x_read = xlsread('sample.csv','J2:J55');
timems = xlsread('sample.csv','AD2:AD55');
gyro_x = [x_read,timems];

data = gyro_x;

stepdata = table;

stepdata.GYROSCOPEXrads = data(:,1);
stepdata.TimeSinceStartInMs = data(:,2);

clearvars gyro_x x_read timems R;

stepdata=table;
stepdata1=table;
stepdata.gyroscope=data(:,1);
stepdata.time=data(:,2);
values=numel(data(:,1));

cnt=0;
cnt1=0;
for i=1:values
    j=j+1;
    if(stepdata.gyroscope(i,1)>0)
        cnt=cnt+1;
        stem(stepdata.gyroscope(i,1));
        disp("The phone has been moved");
    else
        cnt1=cnt1+1;
        disp("The phone is put down ");
    end
    disp("The number of times the phone got moved by a number N : ");
    disp(cnt);

end
%subplot(3,4,12);
plot(stepdata.time,stepdata.gyroscope);
title("Gyroscope Data");
xlabel("Time (ms)");
ylabel("Radians per sec")