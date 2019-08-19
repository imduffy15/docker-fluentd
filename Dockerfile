FROM grafana/fluent-plugin-grafana-loki:master

RUN gem install fluent-plugin-detect-exceptions
RUN gem install fluent-plugin-kubernetes_metadata_filter
RUN gem install fluent-plugin-concat
RUN gem install fluent-plugin-route
RUN gem install fluent-plugin-grok-parser
RUN gem install fluent-plugin-rewrite-tag-filter

