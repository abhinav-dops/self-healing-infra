# Self-Healing EC2 Infrastructure (AWS + Terraform)

## Overview

This project demonstrates a **self-healing cloud infrastructure** on AWS where an EC2 instance is automatically monitored and recovered from failure conditions without manual intervention.

The system detects high CPU usage or EC2 system health failures using Amazon CloudWatch, triggers automated remediation via AWS Lambda, and restores the instance by rebooting it. The application running inside Docker is automatically recovered after reboot.

This project focuses on **infrastructure resilience**, **event-driven automation**, and **real-world DevOps practices**.

---

## Architecture

**Flow:**

1. EC2 instance runs a Dockerized web application  
2. CloudWatch monitors:
   - CPU utilization
   - EC2 system health status  
3. When a threshold is breached:
   - CloudWatch Alarm enters `ALARM` state  
4. EventBridge captures the alarm state change  
5. EventBridge invokes an AWS Lambda function  
6. Lambda reboots the affected EC2 instance  
7. Docker container restarts automatically  
8. System returns to healthy state  

---

## Technologies Used

- **AWS EC2** – Compute instance  
- **AWS CloudWatch** – Metrics, alarms, and logs  
- **AWS EventBridge** – Event-driven automation  
- **AWS Lambda** – Automated remediation  
- **Terraform** – Infrastructure as Code  
- **Docker** – Application containerization  
- **Amazon Linux 2023**

---

## Features

- Automatic detection of high CPU usage  
- Automatic detection of EC2 system health failures  
- Event-driven remediation using Lambda  
- Fully automated EC2 reboot  
- Docker application auto-recovery after reboot  
- CloudWatch logging for observability  
- Reproducible infrastructure using Terraform modules  

---

## Project Structure

```text
self-healing-infra/
├── infra/
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   ├── terraform.tfvars
│   ├── modules/
│   │   └── ec2/
│   │       ├── main.tf
│   │       ├── cloudwatch.tf
│   │       ├── eventbridge.tf
│   │       ├── lambda.tf
│   │       ├── lambda_iam.tf
│   │       └── lambda/
│   │           ├── reboot_ec2.py
│   │           └── function.zip
│   └── user-data/
│       └── install_docker.sh
├── Dockerfile
└── README.md
```
---

## How It Works

- CloudWatch alarms continuously monitor EC2 metrics.
- When an alarm enters the `ALARM` state, EventBridge listens for the state change event.
- EventBridge triggers a Lambda function.
- Lambda reads the EC2 instance ID from environment variables and initiates a reboot.
- After reboot, Docker automatically restarts the application container.
- CloudWatch alarms return to `OK` once the system stabilizes.

---

## Deployment
```test
- terraform init
- terraform apply
```
---

##Testing the Self-Healing Mechanism

1. SSH into the EC2 instance
2. Generate CPU load:
  -yes > /dev/null &

3. Observe:
 -CloudWatch alarm transitions to ALARM
 -EC2 reboots automatically
 -SSH session disconnects
 -Lambda logs appear in CloudWatch
 -Application becomes available again after reboot
 -Alarms return to OK

---

##Key Learnings

- Implementing event-driven remediation using AWS services
- Designing fault-tolerant infrastructure
- Understanding the difference between infrastructure recovery and application recovery
- Debugging real AWS event chains (CloudWatch → EventBridge → Lambda → EC2)
- Using Terraform modules for clean and scalable infrastructure

---

##Cleanup
```test
- terraform destroy
```




