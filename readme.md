# Jenkins Pipeline for Amazon EKS Cluster

This Jenkins pipeline automates the deployment process for an Amazon Elastic Kubernetes Service (Amazon EKS) cluster and related tasks. It leverages Jenkins, Terraform, AWS CLI, Docker, Maven, and SonarQube for a complete deployment workflow.

## Pipeline Overview

This Jenkins pipeline consists of the following key stages:

1. **Git Checkout**: Checks out the Git repository containing your infrastructure code for EKS and modules.

2. **Unit Test Maven**: Executes unit tests using Maven (Java-based projects).

3. **Integration Test Maven**: Executes integration tests using Maven.

4. **Static Code Analysis: Sonarqube**: Performs static code analysis using SonarQube.

5. **Quality Gate Status Check: Sonarqube**: Checks the status of the Quality Gate in SonarQube.

6. **Maven Build**: Builds the project using Maven.

7. **Docker Image Build: ECR**: Builds a Docker image and stores it in Amazon Elastic Container Registry (ECR).

8. **Push to ECR**: Pushes the Docker image to the ECR repository.

9. **Docker Image Cleanup: ECR**: Cleans up old Docker images in the ECR repository.

10. **Connect to AWS**: Configures AWS credentials and region for AWS CLI.

11. **Create EKS Cluster: Terraform**: Uses Terraform to create the Amazon EKS cluster and associated resources.

12. **Connect to EKS**: Configures `kubectl` to connect to the Amazon EKS cluster.

13. **Deployment on EKS Cluster**: Deploys your application to the EKS cluster.

## Pipeline Parameters

- **action**: Choose either "create" or "delete" to create or destroy the EKS cluster.
- **aws_account_id**: AWS Account ID.
- **Region**: Region of the ECR and EKS.
- **ECR_REPO_NAME**: Name of the Amazon ECR repository.
- **cluster**: Name of the Amazon EKS Cluster.

## Environment Variables

- **ACCESS_KEY**: AWS Access Key ID.
- **SECRET_KEY**: AWS Secret Access Key.
- **AWS_DEFAULT_REGION**: Default AWS region.
- **ECR_REPO_URI**: URI of the ECR repository.

## Pipeline Usage

- Configure Jenkins credentials for AWS access (AWS_ACCESS_KEY_ID and AWS_SECRET_KEY_ID).
- Create a Jenkins job and use this pipeline script.
- Trigger the job and provide the necessary parameters.

## Dependencies

- Jenkins: Jenkins is used as the CI/CD automation server.
- Terraform: Terraform is used for infrastructure provisioning.
- AWS CLI: AWS Command Line Interface is used for AWS operations.
- Docker: Docker is used for containerization.
- Maven: Maven is used for building Java-based projects.
- SonarQube: SonarQube is used for static code analysis.

## Maintenance and Operations

- Regularly review and update the pipeline for code changes and improvements.
- Monitor the pipeline execution and handle any failures or issues.
- Ensure AWS credentials remain secure and up-to-date.

## Additional Notes

- Customize the pipeline stages, dependencies, and parameters as needed for your specific project.
- Adjust the AWS region and ECR repository name to match your environment.
- Ensure that you have the necessary IAM permissions for AWS and EKS cluster management.
