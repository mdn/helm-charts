
{{- define "kuma_database_url" -}}
mysql://{{.Values.mysql.mysqlUser}}:{{.Values.mysql.mysqlPassword}}@{{ printf "%s-%s" .Release.Name "mysql" | trunc 63 }}:3306/{{.Values.mysql.mysqlDatabase}}
{{- end -}}

{{- define "kuma_broker_url" -}}
redis://{{.Values.redis.redisPassword}}@{{ printf "%s-%s"  .Release.Name "redis" | trunc 63 }}:6379/0
{{- end -}}

{{- define "kuma_kumascript_url_template" -}}
http://{{ printf "%s-%s" .Release.Name "kumascript" | trunc 63 }}{{if (ne .Values.kumascript.service.externalPort 80.0)}}:{{.Values.kumascript.service.externalPort}}{{end}}/docs/{path}
{{- end -}}

{{- define "kuma_site_url" -}}
http://{{ printf "%s-%s" .Release.Name .Values.kuma_web.kuma.name | trunc 63 }}{{if (ne .Values.kuma_web.kuma.service.externalPort 80.0)}}:{{.Values.kuma_web.kuma.service.externalPort}}{{end}}
{{- end -}}
