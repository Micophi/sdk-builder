FROM micophi/sdk-builder-base:latest

RUN sdk install java 8.0.192-zulu
RUN sdk install maven 3.3.9