%% 初期化
clear
close

%% パラメータ設定
N = [64 64]; % 解像度の指定
maxstep = 100; % 最大ステップ数を指定
threshold = 0.5; % 乱数による初期条件設定時のしきい値
seed = 123; % 乱数のシード

%% 実行
mylifegame(N, maxstep, threshold, seed);