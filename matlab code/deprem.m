clear
clc
comport=serial('COM11','BaudRate', 9600);
fopen(comport);

fileID=fopen('sismodata.txt','wt');



fprintf(fileID,'%s\t %s\t %s\t %s\t \n','x-axis','y-axis','z-axis','timer');
i=0;
while( i<100)
i=i+1;%read 2 lines of data
x(i)=fscanf(comport,'%d');
y(i)=fscanf(comport,'%d');
z(i)=fscanf(comport,'%d');
subplot(3,1,1)
plot(x,'linewidth',3)
title('X-Axis')
ylabel('AMPLITUDE')
xlabel('TIME')
drawnow;
grid on;
hold on;
subplot(3,1,2)
plot(y,'linewidth',3)
title('Y-Axis')
ylabel('AMPLITUDE')
xlabel('TIME')
drawnow;
grid on;
hold on;
subplot(3,1,3)
plot(z,'linewidth',3)
title('Z-Axis')
ylabel('AMPLITUDE')
xlabel('TIME')
drawnow;
grid on;
hold on;
fprintf(fileID,'%d\t %d\t %d\t %d\t \n',x(i),y(i),z(i),i);

end
fclose(comport);
delete(comport);
fclose(fileID);



