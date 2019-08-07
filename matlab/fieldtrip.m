% ensure that the fieldtrip toolbox is on the path
addpath /home/common/matlab/fieldtrip-20111231
fieldtripdefs

% read the data from disk (NFS)
cd /home/common/matlab/fieldtrip/data/ftp/tutorial/timefrequencyanalysis/
load dataFIC

cfg = [];
cfg.output = 'pow';
cfg.channel = 'MEG';
cfg.method = 'mtmconvol';
cfg.foi = 1:2:30;
cfg.t_ftimwin = 5./cfg.foi;
cfg.tapsmofrq = 0.4 *cfg.foi;
cfg.toi = -0.5:0.05:1.5;
cfg.pad = 'maxperlen';
cfg.feedback = 'no';

% with tic you start the timer, with toc you measure the elapsed time
for j=1:5,
    tic
    TFRmult = ft_freqanalysis(cfg, dataFIC);
    toc
end

exit
