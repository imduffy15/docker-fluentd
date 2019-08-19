FROM gcr.io/google-containers/fluentd-elasticsearch:v2.4.0

RUN apt-get update; apt-get upgrade -y

RUN gem install fluent-plugin-loki

