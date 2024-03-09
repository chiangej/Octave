kh = 0:0.1:pi;
khexact = kh;
khcd = -2.*(cos(kh).-1);
khps = -12.*(cos(kh).-1)./(cos(kh)+5);

plot(kh,khexact.^2,kh,khcd,kh,khps);
set(gca,'FontSize',15);
xlabel("kh",'FontSize',20);
ylabel("k'^2h^2",'FontSize',20);
title("Modified wavenumbers",'FontSize',15);
legend('exact wavenumber', 'central difference','Pade scheme','Location','NorthWest');
