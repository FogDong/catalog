# Tooling

This directory contains the source code of tooling needed for kubeflow-pipeline:

- Dockerfile: builds the image containing tools for the example and to upload the pipeline
- split-yaml.go: the program that splits multi-yaml file into one yaml per file.
- load-image.sh: pull docker image to local and load it into kind cluster