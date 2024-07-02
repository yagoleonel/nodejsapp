
# Setup CI/CD

# 1 Create github actions IAM user 

## 1 - Create user policy with send SSM command rights
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "ssm:SendCommand"
            ],
            "Resource": "*"
        }
    ]
}

## 2 - Create AWS access keys for the user

## 3 - Update github secrets 
    AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY


# 2 Configure EC2 instance

## Configure ec2 user data

Copy and paste from /aws-setup/ec2-user-data.sh in ec2 user-data field (reload the instance if already running)

## Create deploy-app.sh

1 - Log in via SSH to EC2 instance

2 - Create file deploy-app.sh

    `vi /home/ec2-user/deploy-app.sh` (copy/paste content from /home/ec2-user/deploy-app.sh)
    
    `chmod +x deploy-app.sh`

    `./deploy-app.sh`
