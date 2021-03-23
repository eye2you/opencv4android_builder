FROM ubuntu:groovy
WORKDIR /root

RUN apt-get update && \
    apt-get install -y --no-install-recommends openjdk-11-jdk-headless cmake ninja-build git wget unzip python3 && \
    rm -rf /var/lib/apt/lists/*
RUN wget -nv https://dl.google.com/android/repository/commandlinetools-linux-6858069_latest.zip && \
    unzip -q commandlinetools-linux-6858069_latest.zip && \
    yes | cmdline-tools/bin/sdkmanager --sdk_root=/opt/android_sdk/ "platform-tools" "platforms;android-30" "build-tools;30.0.3" && \
    wget -nv https://dl.google.com/android/repository/android-ndk-r21e-linux-x86_64.zip && \
    unzip -q android-ndk-r21e-linux-x86_64.zip -d /opt/ && \
    git clone --branch 4.5.1 https://github.com/opencv/opencv && \
    git clone --branch 4.5.1 https://github.com/opencv/opencv_contrib && \
    rm *.zip

ENV ANDROID_NDK=/opt/android-ndk-r21e/ 
ENV ANDROID_SDK=/opt/android_sdk/
ENV ANDROID_HOME=/opt/android_sdk/
ENV ANDROID_NDK_HOME=/opt/android-ndk-r21e/
ENV ANDROID_PLATFORM=30

WORKDIR /root/build
COPY build_all.sh build_opencv_slim.sh /root/build/

SHELL ["/bin/bash", "-c"]
CMD ["/root/build/build_all.sh", "build_opencv_slim.sh"]




