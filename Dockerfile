FROM gcr.io/stackdriver-agents/stackdriver-logging-agent:0.6-1.6.0-1

RUN /opt/google-fluentd/embedded/bin/gem install fluent-plugin-loki

