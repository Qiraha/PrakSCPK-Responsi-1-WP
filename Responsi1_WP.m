%penyelesaian kasus menggunakan metode WP
clc;clear; 
file='Data_WP.xlsx';
x = xlsread(file,'Data_WP','A:D'); %membaca file Data_WP.xlsx
k = [1,0,1,0]; %pengaturan atribut dimana 1 merupakan keuntungan dan 0 adalah biaya
w = [3,5,4,1]; %mengeset nilai bobot tiap kriteria 

%tahapan pertama, perbaikan bobot
[m n]=size (x); %
w=w./sum(w); 

%tahapan kedua, melakukan perhitungan vektor(S) per baris (alternatif)
for j=1:n,
    if k(j)==0, w(j)=-1*w(j);
    end;
end;
for i=1:m,
    S(i)=prod(x(i,:).^w);
end;

%tahapan ketiga, proses perangkingan
V= S/sum(S);
Y=reshape(1:50,50,1).';
final=[Y;V].';
result=sortrows(final,2, 'descend')
