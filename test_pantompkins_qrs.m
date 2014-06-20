loadstr = 'testchannel.txt';

fid = fopen(loadstr);
 
readin = textscan(fid, '%f', 'delimiter', '\n');
fclose(fid);
testdata = readin{1,1};
clear('readin');
testdata = testdata';
fs = 500;

close all;

[qrs_pos,filt_dat,int_dat,thF1,thI1] = pantompkins_qrs(testdata,fs);

figure();
plot(testdata,'-b');
hold on;
if (~isempty(qrs_pos))
plot(qrs_pos,testdata(qrs_pos),'og');
end
plot(filt_dat,'-m');
plot(int_dat,'-k');

plot(qrs_pos,thF1,'-m');
plot(qrs_pos,thI1,'-k');

hold off;