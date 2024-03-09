filename = "hw1AB.dat";
[datax, datay] = textread(filename,"%f %f","headerlines",1);
    #read data from a text file
    #The file filename is read and parsed according to format.
    #"headerlines": The first value number of lines of filename are skipped.
x0 = datax;
y0 = datay;
x = linspace(-1, 1, 5000)
    #從-1至1分割出500個數字
d = size(x0, 1);
    #Return a row vector with the size (number of elements) of each dimension for the object x0.
    #When given a second argument, dim, return the size of the corresponding dimension.\
    # d 代表 x0 的行數
y = zeros(d, 5000);
y = y+1;

for j = 1:d
  for i = 1:d
    if j == i
      continue;
          #skip and continue the loop
    endif
    y(j, :) .*= ((x-x0(i))/(x0(j)-x0(i)));
  endfor
 endfor
for k = 1:1:d
  # k 從1開始，每次增加1，最高不超過d
  subplot(4, 3, k)
  #生成 4*3 格子的圖像，目前使用第 k 個格子
  plot(x, y(k, :))
  #繪圖，x為 x 軸，y為 y 軸
  set(gca,'FontSize',10);
  xlabel("X",'FontSize',15);
  ylabel("Lj(x)",'FontSize',15);
  title(x0(k),'FontSize',15);
  grid on;
end
