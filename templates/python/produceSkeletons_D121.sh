#!/bin/sh

# Generated for CMSSW_20_0_0_pre1 / Run4D121 (default Phase2 geometry).
# Derived from pepr's produceSkeletons_D110_v2.sh, adapted by:
#   - geometry: ExtendedRun4D110 -> ExtendedRun4D121
#   - era: Phase2C17I13M9 -> Phase2C22I13M9
#   - conditions: auto:phase2_realistic_T33[_13TeV] -> auto:phase2_realistic_T35
#   - removed ticl_v5 procModifier (no longer exists in pre1; TICL is default)
#   - removed redundant RECOticlV5 fragment

action() {

  cmsDriver.py SingleElectronPt10_pythia8_cfi \
    --conditions auto:phase2_realistic_T35 \
    -n 10 \
    --era Phase2C22I13M9 \
    --eventcontent FEVTDEBUG \
    -s GEN,SIM,DIGI:pdigi_valid,L1TrackTrigger,L1,L1P2GT,DIGI2RAW,HLT:@relvalRun4 \
    --datatier GEN-SIM \
    --beamspot NoSmear \
    --geometry ExtendedRun4D121 \
    --procModifier fineCalo \
    --no_exec \
    --python_filename=GSDfineCalo_fragment.py

  cmsDriver.py SingleElectronPt10_pythia8_cfi \
    --conditions auto:phase2_realistic_T35 \
    -n 10 \
    --era Phase2C22I13M9 \
    --eventcontent FEVTDEBUG \
    -s GEN,SIM,DIGI:pdigi_valid,L1TrackTrigger,L1,L1P2GT,DIGI2RAW,HLT:@relvalRun4 \
    --datatier GEN-SIM-DIGI-RAW \
    --beamspot NoSmear \
    --geometry ExtendedRun4D121 \
    --no_exec \
    --python_filename=GSD_fragment.py

  cmsDriver.py step4 \
    --conditions auto:phase2_realistic_T35 \
    -n 10 \
    --era Phase2C22I13M9 \
    --eventcontent FEVTDEBUG \
    --runUnscheduled \
    -s RAW2DIGI,L1Reco,RECO,RECOSIM \
    --datatier GEN-SIM-RECO \
    --geometry ExtendedRun4D121 \
    --no_exec \
    --python_filename=RECO_fragment.py

  cmsDriver.py step4 \
    --conditions auto:phase2_realistic_T35 \
    -n 10 \
    --era Phase2C22I13M9 \
    --eventcontent FEVTDEBUG \
    --runUnscheduled \
    -s RAW2DIGI,L1Reco,RECO,RECOSIM \
    --datatier GEN-SIM-RECO \
    --geometry ExtendedRun4D121 \
    --no_exec \
    --processName=NTUP \
    --python_filename=NTUP_fragment.py

}
action "$@"
