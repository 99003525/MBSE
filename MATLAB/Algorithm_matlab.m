data_read = xlsread('sample.csv','J2:J55');
time_t = xlsread('sample.csv','AD2:AD55');
gyro_x = [data_read,time_t];

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

count=0;
for i=1:values
    j=j+1;
    if(stepdata.gyroscope(i,1)>0)
        count=count+1;
        stem(stepdata.gyroscope(i,1));
        disp("The phone has been moved");
    else
        disp("The phone is put down ");
    end
    disp("The number of times the phone got moved by a number N : ");
    disp(count);

end
plot(stepdata.time,stepdata.gyroscope);
title("Gyroscope Data : USE OF PHONE OVER TIME");
xlabel("Time (ms)");
ylabel("Radians per sec")