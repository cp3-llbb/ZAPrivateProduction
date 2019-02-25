from WMCore.Configuration import Configuration
config = Configuration()

config.section_('General')
config.General.transferLogs = True
config.General.transferOutputs = True
config.General.workArea = 'MINIAOD'
config.General.requestName = 'template'

config.section_('JobType')
config.JobType.pluginName = 'Analysis'
config.JobType.allowUndistributedCMSSW = True
config.JobType.psetName = 'template_MINIAOD_cfg.py'

config.section_('Data')
config.Data.inputDBS = 'phys03'
config.Data.inputDataset = 'DATASET'
config.Data.publication = True
config.Data.unitsPerJob = 1
config.Data.splitting = 'FileBased'
config.Data.outputDatasetTag = 'MINIAOD_TAG'
config.Data.outLFNDirBase = '/store/user/asaggio/'

config.section_('Site')
config.Site.storageSite = 'T2_BE_UCL'

config.section_('User')

config.section_('Debug')

