# operator-sdk
Kubernetis Operator SDK Docker container build

For docker compatibility the base image built in 2 stages:
1. Operator SDK CLI operator-sdk is built
2. It is injected into operator-sdk-base image
Script build.sh is provided.
After an image is built it can be tagged and pushed to an available repositiry so it can be reused later.

Image operator-sdk-base is to be used to build actual operator images with their payload. 

