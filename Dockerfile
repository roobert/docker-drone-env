FROM roobert/erb-hiera:0.5.0-rc0

ADD https://github.com/kvz/json2hcl/releases/download/v0.0.6/json2hcl_v0.0.6_linux_amd64 /bin/json2hcl

RUN chmod +x /bin/json2hcl

RUN apk update && apk add git bash terraform
