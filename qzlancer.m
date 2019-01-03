%六连杆机构计算
%2019/1/2
clear all

%-----------------------------初始化
L1 = 20.5; AB=L1;
L2 = 105.6; BC=L2;
L2_ = 65; CE=L2_;
L3 = 67.5; CD=L3;
L4 = 87.5; AD=L4;
L5 = 24.4; EF=L5;
L6 = 15; FG=L6;
G = [153.5,41.7];
dT = 0.01;
i = 1;
%-----------------------------根据几何关系求解角度之间的关系
%数值方法处理
theta1_1 = 0:dT:3.14;
theta1_2 = 3.15:dT:6.28;
theta1 = [theta1_1,theta1_2];
BD = sqrt(L1^2+L4^2-2*L1*L4*cos(theta1));
ADB = acos((L4^2+BD.^2-L1^2)./(2*L4*BD));
BDC = acos((L3^2+BD.^2-L2^2)./(2*L3*BD));
ABD = acos((L1^2+BD.^2-L4^2)./(2*L1*BD));
CBD = acos((L2^2+BD.^2-L3^2)./(2*L2*BD));

theta2_1 = ABD(1:315)+CBD(1:315)-(pi-theta1_1);
theta2_2 = CBD(316:629)-ABD(316:629)+(theta1_2-pi);
theta2 = [theta2_1,theta2_2];

theta3_1 = pi-ADB(1:315)-BDC(1:315);
theta3_2 = pi + ADB(316:629)-BDC(316:629);
theta3 = [theta3_1,theta3_2];
% Xe = L1*cos(theta1_1)+L2*cos(theta2)+L2_*cos(pi/3-theta2);
% Ye = L1*sin(theta1_1)+L2*sin(theta2)-L2_*sin(pi/3-theta2);
% GE = sqrt((Xe-G(1)).^2+(Ye-G(2)).^2);
% GEY = atan((G(2)-Ye)./(G(1)-Xe));
% for j=1:315
%     if GEY(j) < 0
%         GEY(j) = pi+GEY(j);
%     end
% end
% FGE = acos((GE.^2+L6^2-L5^2)./(2*GE*L6));
% FEG = acos((GE.^2-L6^2+L5^2)./(2*GE*L5));
% theta5 = GEY-FEG;
% theta6 = FGE+GEY-pi;
%---------------------------------绘图
figure(1);
plot(theta1,theta2);
figure(2);
plot(theta1,theta3);
% figure(3)
% plot(theta1_1,GEY);
% figure(4)
% plot(theta1_1,theta5);
% figure(5)
% plot(theta1_1,theta6);