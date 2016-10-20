%% Life Game
% N : マス目の解像度(サイズが2のベクトル)
% maxstep : 計算するstep数
% threshold : 初期値生成のしきい値
% seed : 初期値生成の乱数シード

function mylifegame(N, maxstep, threshold, seed)
%% 初期化
close
rng(seed);

%% 表示時のカラーマップ設定
cmap = [0 0 0;0 1 0]; % 生存は緑，死亡は黒

%% 計算領域の初期化
Grid = zeros(N(1), N(2), maxstep); % 計算領域のメモリ確保とゼロクリア
Grid(:,:,1) = double(randn(N(1), N(2))>threshold); % 乱数により初期の生存・死亡を設定

%% 誕生・生存判定のための設定
F = [1 1 1;1 0 1;1 1 1];

%% 初期状態の表示
imagesc(Grid(:,:,1));
colormap(cmap);
title(['i = 1'], 'FontSize', 20);
drawnow;

%% メインループ
for i = 2:maxstep
    pause(0.05);
    
    % 周囲の生存者数を計算
    NumberOfSurvive = imfilter(Grid(:,:,i-1), F, 'circular');
    % 生存判定
    Survive = (Grid(:,:,i-1)&((NumberOfSurvive==2)|(NumberOfSurvive==3)));
    % 誕生判定
    Birth = (~Grid(:,:,i-1)&(NumberOfSurvive==3));
    % 生存・誕生・死亡の計算
    Grid(:,:,i) = double(Survive | Birth);
    %表示
    imagesc(Grid(:,:,i));
    title(['i = ' num2str(i)], 'FontSize', 20);
    drawnow;
end

end

