
clean:
	rm -f {kuma_api,kuma_web,worker,mdn}/requirements.lock

build: clean
	helm lint kuma && helm package kuma
	helm lint worker && helm dependency build worker && helm package worker
	helm lint kuma_api && helm dependency build kuma_api && \
	    helm package kuma_api
	helm lint kuma_web && helm dependency build kuma_web && \
	    helm package kuma_web
	helm lint kumascript && helm package kumascript
	helm lint mysql && helm package mysql
	helm lint elasticsearch && helm package elasticsearch
	helm lint mdn && helm dependency build mdn && helm package mdn
	@ rm -f kuma-*.tgz kuma_api-*.tgz kuma_web-*.tgz worker-*.tgz
	@ rm -f elasticsearch-*.tgz kumascript-*.tgz mdn-*.tgz mysql-*.tgz
