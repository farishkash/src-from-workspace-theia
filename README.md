1. Create an `args.sh` file with the following contents:

    ```sh
    #!/usr/bin/env bin

    ghuser=<your_ca_github_username>
    pat=<a_ca_github_personal_access_token_with_permission_to_clone_private_repos>
    ```

1. Update the repo variable in `build.sh` to point to the content image repo.

1. Run the build with:

    ```sh
    ./build.sh
    ```

1. The build script outputs the tag and commands to push a workspace image tag to ECR

    1. You will need to login to ECR using docker login (ensure you have refreshed AWS credentials with Leapp before running):

    ```sh
    aws ecr get-login-password --profile cloudacademy | docker login --username AWS --password-stdin 421805900968.dkr.ecr.us-east-2.amazonaws.com
    ```
