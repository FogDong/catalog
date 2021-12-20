FROM acr.kubevela.net/oamdev/kubeflow-tool

COPY mnist_tf_volume.py mnist_tf_volume.py
RUN dsl-compile --py mnist_tf_volume.py --output mnist_tf_volume.tar.gz
