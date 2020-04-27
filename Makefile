PROJECT = prometheus_ranch_example
PROJECT_DESCRIPTION = Test setup for ranch prometheus collector
PROJECT_VERSION = 0.1.0
DEPS = ranch prometheus_ranch cowboy prometheus_cowboy

dep_ranch_commit = master
dep_cowboy_commit = 2.7.0
dep_prometheus_ranch = git https://github.com/juhlig/prometheus_ranch.git master
dep_prometheus_cowboy = git https://github.com/deadtrickster/prometheus-cowboy v0.1.8

include erlang.mk
