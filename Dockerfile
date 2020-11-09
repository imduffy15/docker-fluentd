FROM fluent/fluentd:v1.11.5-debian

USER root

RUN apt-get update \
 && buildDeps=" \
      make gcc g++ libc-dev \
      wget bzip2 gnupg dirmngr \
    " \
 && apt-get install -y --no-install-recommends $buildDeps \
 && gem install fluent-plugin-kubernetes_metadata_filter \
 && gem install fluent-plugin-concat \
 && gem install fluent-plugin-route \
 && gem install fluent-plugin-grok-parser \
 && gem install fluent-plugin-prometheus \
 && gem install fluent-plugin-rewrite-tag-filter \
 && gem install fluent-plugin-google-cloud \
 && gem install fluent-plugin-record-reformer \
 && gem install fluent-plugin-multi-format-parser \
 && gem install fluent-plugin-systemd \
 && gem install fluent-plugin-detect-exceptions \
 && gem install fluent-plugin-gcs \
 && apt-get purge -y --auto-remove \
                  -o APT::AutoRemove::RecommendsImportant=false \
                  --allow-remove-essential \
                  $buildDeps \
 && rm -rf /var/lib/apt/lists/* \
 && rm -rf /tmp/* /var/tmp/* /usr/lib/ruby/gems/*/cache/*.gem \
 && mkdir -p /var/log/fluentd-buffers \
 && chown fluent:fluent -R /var/log/fluentd-buffers

COPY fluentd.conf /fluentd/etc/fluent.conf
