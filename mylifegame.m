%% Life Game
% N : �}�X�ڂ̉𑜓x(�T�C�Y��2�̃x�N�g��)
% maxstep : �v�Z����step��
% threshold : �����l�����̂������l
% seed : �����l�����̗����V�[�h

function mylifegame(N, maxstep, threshold, seed)
%% ������
close
rng(seed);

%% �\�����̃J���[�}�b�v�ݒ�
cmap = [0 0 0;0 1 0]; % �����͗΁C���S�͍�

%% �v�Z�̈�̏�����
Grid = zeros(N(1), N(2), maxstep); % �v�Z�̈�̃������m�ۂƃ[���N���A
Grid(:,:,1) = double(randn(N(1), N(2))>threshold); % �����ɂ�菉���̐����E���S��ݒ�

%% �a���E��������̂��߂̐ݒ�
F = [1 1 1;1 0 1;1 1 1];

%% ������Ԃ̕\��
imagesc(Grid(:,:,1));
colormap(cmap);
title(['i = 1'], 'FontSize', 20);
drawnow;

%% ���C�����[�v
for i = 2:maxstep
    pause(0.05);
    
    % ���͂̐����Ґ����v�Z
    NumberOfSurvive = imfilter(Grid(:,:,i-1), F, 'circular');
    % ��������
    Survive = (Grid(:,:,i-1)&((NumberOfSurvive==2)|(NumberOfSurvive==3)));
    % �a������
    Birth = (~Grid(:,:,i-1)&(NumberOfSurvive==3));
    % �����E�a���E���S�̌v�Z
    Grid(:,:,i) = double(Survive | Birth);
    %�\��
    imagesc(Grid(:,:,i));
    title(['i = ' num2str(i)], 'FontSize', 20);
    drawnow;
end

end

