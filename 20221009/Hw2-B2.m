kh = 0:0.01:pi;
khexact = kh;
khsoc = sin(kh);
khfoc = ((8.*sin(kh)).-sin(2.*kh))./6;
khfops = (3.*sin(kh))./(2.+cos(kh));

plot(kh,khexact);
hold on

plot(kh,khsoc, '--');
plot(kh,khfoc, ':');
plot(kh,khfops, '-.');
#plot the figure with different kinds of line

set(gca,'FontSize',15);
xlabel("kh",'FontSize',20);
ylabel("k'h",'FontSize',20);
title("Modified wavenumbers",'FontSize',15);
legend('exact wavenumber', '2nd order central difference','4th order central difference','4th order Pade scheme','Location','NorthWest');
