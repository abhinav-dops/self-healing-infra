import boto3
import os
import json

ec2 = boto3.client("ec2")

def lambda_handler(event, context):
    print("Event:", json.dumps(event))

    instance_id = os.environ.get("INSTANCE_ID")

    if not instance_id:
        raise Exception("INSTANCE_ID environment variable not set")

    ec2.reboot_instances(InstanceIds=[instance_id])

    return {
        "status": "reboot triggered",
        "instance_id": instance_id
    }
