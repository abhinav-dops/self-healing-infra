# Self-Healing Cloud Infrastructure (AWS + Docker + Terraform)

A cloud-native system that detects failures and automatically recovers using Dockerized apps, AWS EC2, CloudWatch alarms, and automation workflows.

---

## 🚀 Current Progress (Week 1)
- Built a minimal Flask app (`/` + `/health`)
- Dockerized the app and tested locally
- Set up AWS CLI + IAM user
- Launched EC2 and installed Docker
- Deployed container manually + verified public access
- Docker image pushed to Docker Hub for consistent deployment

---

## 🔧 Quick Commands

```bash
# Local build & run
docker build -t self-healing-app .
docker run -p 8080:8080 self-healing-app

# Push to Docker Hub
docker tag self-healing-app <dockerhub-username>/self-healing-app
docker push <dockerhub-username>/self-healing-app

# EC2 deploy (from Docker Hub)
docker pull <dockerhub-username>/self-healing-app
docker run -d -p 80:8080 <dockerhub-username>/self-healing-app

# Logs (EC2)
docker logs -f selfhealing
