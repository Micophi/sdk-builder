FROM micophi/sdk-builder-base:latest


RUN sdk install java 8.0.192-zulu
RUN sdk install gradle 5.0

USER root
RUN curl -L https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip -o sdk-tools-linux.zip
RUN unzip -o -q sdk-tools-linux.zip -d /opt/sdk-tools-linux
RUN chown -R user:user /opt/sdk-tools-linux


ENV ANDROID_HOME=/opt/sdk-tools-linux
ENV PATH="$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools"


USER user
RUN yes | sdkmanager --licenses
RUN sdkmanager --update
RUN sdkmanager --install "platforms;android-28" "build-tools;28.0.3" "extras;google;m2repository" "extras;android;m2repository"
RUN sdkmanager --install "platform-tools"
