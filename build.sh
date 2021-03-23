#Installation Setup
pip3 install --user --upgrade -q tfx 
pip3 install --user --upgrade -q kfp 

# Download and setup skaffold 
curl -Lo skaffold https://storage.googleapis.com/skaffold/releases/latest/skaffold-linux-amd64 
chmod +x skaffold 

# Update path local bin not included
export PATH=${PATH}:./

# Read GCP project id from env.
export GCP_PROJECT_ID='crafty-chiller-306707'

# KFP endpoint
ENDPOINT='https://8229114e5f732b4-dot-us-central1.pipelines.googleusercontent.com' 

# Docker image name for the pipeline image
CUSTOM_TFX_IMAGE='gcr.io/' + GCP_PROJECT_ID + '/tfx-pipeline'

import os 

# Import sample pipeline 
PIPELINE_NAME="my_pipeline"

tfx pipeline update \
--pipeline-path=~/${PIPELINE_NAME}/kubeflow_runner.py \
--endpoint=${ENDPOINT} 
