# devops-terraform
Instructions:
1. Deploy Terraform Code:

Execute the Terraform code provided to deploy the infrastructure. Ensure you have the necessary credentials and permissions to deploy infrastructure resources on your chosen cloud provider.

2. Modify Bucket and CloudFront Names in buildspec.yml:

Navigate to the buildspec.yml file within the Terraform code directory.
Update the bucket and CloudFront distribution names to match your preferred names or naming conventions.

3. Initiate CodeBuild:

Start the CodeBuild process to trigger the build and deployment of the static website.
Verify that CodeBuild successfully builds and deploys the website artifacts.

4. Verify Deployment:

Once the deployment process is completed, access the CloudFront link provided to verify the deployment of the static website.
Confirm that the website is accessible via the CloudFront link and functions as expected.