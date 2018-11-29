clear all;
close all;


filename=['CNTL_highZ_noflow_SST27_d01_tk_km.nc']
tk=read_var(filename,'X');


[nx ny nz nt]=size(tk);

tkmean=squeeze(mean(mean(tk,1),2));

for t=1:nt
deltatk(t,:)=tkmean(:,t)-tkmean(:,1);
endeltatk(t,:)=squeeze(tk(1,1,:,t)-tk(1,1,:,1));
for z=1:nz 
TT(t,z)=(t-1)*3;
ZZ(t,z)=z*250/1000;
end
end




figure(1)
cmap=textread('ViBlGrWhYeOrRe.rgb')/255;
colormap(cmap);
contourf(TT,ZZ,deltatk,-1:0.1:1,'edgecolor','none');
caxis([-1 1]);colorbar;
axis([0 192 0 22]);
grid on;
xlabel('simulation time [h]','FontSize',25);
ylabel('Height [km]','FontSize',25);
set(gca,'YTick',0:3:22,'FontSize',22);
set(gca,'XTick',0:24:210,'FontSize',22);
fils=['deltaT_time.png'];
saveas(gca,fils,'png')
close;



figure(2)
cmap=textread('ViBlGrWhYeOrRe.rgb')/255;
colormap(cmap);
contourf(TT,ZZ,endeltatk,-1:0.1:1,'edgecolor','none');
caxis([-1 1]);colorbar;
axis([0 192 0 22]);
grid on;
xlabel('simulation time [h]','FontSize',25);
ylabel('Height [km]','FontSize',25);
set(gca,'YTick',0:3:22,'FontSize',22);
set(gca,'XTick',0:24:210,'FontSize',22);
fils=['Env_deltaT_time.png'];
saveas(gca,fils,'png')
close;




