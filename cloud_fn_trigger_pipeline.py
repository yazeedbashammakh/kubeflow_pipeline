import kfp 
from datetime import datetime

def hello_gcs(event, context):
    """Triggered by a change to a Cloud Storage bucket.
    Args:
         event (dict): Event payload.
         context (google.cloud.functions.Context): Metadata for the event.
    """ 
    file = event 
    print(f"Processing file: {file['name']}.") 
    print('event:') 
    print(event) 
    print('context') 
    print(context) 
    if file['name'] == 'tfx-template/data/data.csv': 
      ENDPOINT='https://8229114e5f732b4-dot-us-central1.pipelines.googleusercontent.com' 
      client = kfp.Client(host=ENDPOINT,namespace='default') 
      job_name='my-pipeline-' + datetime.now().strftime('%Y%m%d%H%M%S') 
      client.run_pipeline(experiment_id='eef24c2e-9ec8-488e-8d5e-9317d70eb617',pipeline_id='133355ad-e626-4a9f-9d3e-68db99653a9b',job_name=job_name)

