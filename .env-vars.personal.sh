ANDROID_HOME=/usr/local/opt/android-sdk
EDITOR="vi"
DOCKER_MACHINE_NAME=dev1
DOCKER_IP=$(dm url $DOCKER_MACHINE_NAME | egrep -o "(\d+\.)+\d+")

#docker machine session setup
eval "$(docker-machine env $DOCKER_MACHINE_NAME)"

