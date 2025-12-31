import json
import boto3

ec2 = boto3.client("ec2")

def lambda_handler(event, context):
    print("Event:", json.dumps(event))

    instance_id = event.get("InstanceId")

    if not instance_id:
        instance_id = context.invoked_function_arn.split(":")[-1]  # fallback not used

    instance_id = event.get("instance_id") or event.get("INSTANCE_ID")

    if not instance_id:
        raise Exception("INSTANCE_ID not provided")

    ec2.reboot_instances(InstanceIds=[instance_id])
    return {"status": "reboot triggered", "instance_id": instance_id}
