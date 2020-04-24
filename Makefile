PROJECT = prometheus_ranch_example
PROJECT_DESCRIPTION = Test setup for ranch prometheus collector
PROJECT_VERSION = 0.1.0
DEPS = ranch prometheus_ranch cowboy

dep_ranch_commit = master
dep_prometheus_ranch = git https://github.com/juhlig/prometheus_ranch.git master
dep_cowboy_commit = 2.7.0

include erlang.mk
