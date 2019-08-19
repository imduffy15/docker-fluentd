FROM gcr.io/google-containers/fluentd-elasticsearch:v2.4.0

RUN gem install fluent-plugin-loki

