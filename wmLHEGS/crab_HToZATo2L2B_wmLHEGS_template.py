from WMCore.Configuration import Configuration
config = Configuration()

config.section_('General')
config.General.transferLogs = True
config.General.transferOutputs = True
config.General.workArea = 'wmLHEGS_TAG'
config.General.requestName = 'HToZATo2L2B_template'

config.section_('JobType')
config.JobType.pluginName = 'PrivateMC'
config.JobType.allowUndistributedCMSSW = True
config.JobType.psetName = 'HToZATo2L2B_wmLHEGS_template_cfg.py'
config.JobType.scriptExe = 'download_gridpack_then_cmsRun.sh'
config.JobType.scriptArgs = ['MASS_POINT=template']
config.JobType.inputFiles = ['HToZATo2L2B_wmLHEGS_template_cfg.py']

config.section_('Data')
#config.Data.inputDBS = 'global'
#config.Data.inputDataset = '/ZZTo2L2Nu_13TeV_powheg_pythia8/RunIISummer16MiniAODv2-PUMoriond17_80X_mcRun2_asymptotic_2016_TrancheIV_v6-v1/MINIAODSIM'
config.Data.publication = True
config.Data.unitsPerJob = NEVENTS
config.Data.totalUnits = 110000 # 110k, overproducing to account for failed jobs, just in case
config.Data.splitting = 'EventBased'
config.Data.outputPrimaryDataset = 'HToZATo2L2B_template'
config.Data.outputDatasetTag = 'wmLHEGS_TAG'
config.Data.outLFNDirBase = '/store/user/asaggio/'

config.section_('Site')
config.Site.storageSite = 'T2_BE_UCL'

config.section_('User')

config.section_('Debug')

