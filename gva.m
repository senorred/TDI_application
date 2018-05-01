load('gva.mat','state','n_killed','n_injured','date1')
state= state(279:end);
date1=date1(279:end);
n_injured= n_injured(279:end);
n_killed= n_killed(279:end);% start from January 2014
inciTotal= length(state);

time= datetime(date1,'InputFormat','yyyy-MM-dd');
loc= unique(state);

Not= inciTotal/51;
mu= inciTotal/325700000;


Not_mass= length(find(n_killed>=4))/51;
Not_3= length(find(n_killed>=3))/51;
Not_2= length(find(n_killed>=2))/51;
Not_1= length(find(n_killed>=1))/51;
mumass= length(find(n_killed>=1))/325700000;

for i= 1:length(loc)
    ind(:,i)= strcmp(state,loc{i});
    count(i)= sum(ind(:,i)==1);
    A= n_killed(ind(:,i));
    rmass(i)= length(find(A>=4));
    r3(i)= length(find(A>=3));
    r2(i)= length(find(A>=2));
    r1(i)= length(find(A>=1));
    r0(i)= length(A);
    killTot(i)= sum(A);
    injTot(i)= sum(n_injured(ind(:,i)));
    casTot(i)= injTot(i)+killTot(i);
end

% figure
% hold on
% for i=1:length(loc)
%     kill= n_killed(ind(:,i));
%     inj= n_injured(ind(:,i));
%     cas= kill+inj;
%     datei= time(ind(:,i));
%     plot(datei,cas);
% end
% hold off

indTN= ind(:,44);
killTN= n_killed(indTN);
injTN= n_injured(indTN);
casTN= injTN+killTN;
dateTN= time(indTN);

figure
hold on
for i=1:length(loc)
    kill= n_killed(ind(:,i));
    inj= n_injured(ind(:,i));
    cas= kill+inj;
    %date= time(ind(:,i));
    plot(xcorr(cas));
end
hold off


figure
% hold on
plot(dateTN, casTN)
% plot(dateVT, casVT)
% plot(dateNV, casNV)