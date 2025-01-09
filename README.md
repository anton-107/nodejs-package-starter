# Node.js project starter

## Features:
- Creates a folder
- Initializes a git repository with an empty initial commit
- Initializes npm
- Installs TypeScript, Prettier, ESLint and Jest
- Creates GitHub Actions flow

## Installation:
- git clone https://github.com/anton-107/nodejs-package-starter.git
- cd ~/.local/bin # or any other folder that is in your PATH
- sudo ln -s [PATH TO LOCAL REPO]/nodejs-package-starter/bootstrap-nodejs-package bootstrap-nodejs-package
- chmod +x bootstrap-nodejs-package

## Usage
- bootstrap-nodejs-package my-new-package

# Testing locally with docker
```bash
# Build a local image
docker build -t bootstrap-nodejs-package -f Dockerfile.test .

# Run it with an interactive shell:
docker run -it --rm -v $(pwd)/test-output:/app/test-output -e TEST_PROJECT_NAME=test1 bootstrap-nodejs-package /bin/bash
```