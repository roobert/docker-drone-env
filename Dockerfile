FROM roobert/erb-hiera:0.5.0-rc2

ENV TERRAFORM_VERSION="0.11.7"

ADD https://github.com/kvz/json2hcl/releases/download/v0.0.6/json2hcl_v0.0.6_linux_amd64 /bin/json2hcl
RUN chmod +x /bin/json2hcl
RUN apk --no-cache --update add wget ca-certificates unzip m4 git bash curl
RUN wget -q -O /terraform.zip "https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip" && \
    unzip /terraform.zip -d /bin && \
    apk del --purge wget unzip && \
    rm -rf /var/cache/apk/* /terraform.zip
RUN gem install octokit
