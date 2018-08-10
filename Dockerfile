FROM roobert/erb-hiera:v0.5.0.pre.rc7

# various dependencies
RUN apk --no-cache --update add wget ca-certificates unzip m4 git bash curl python which

# json2hcl
ADD https://github.com/kvz/json2hcl/releases/download/v0.0.6/json2hcl_v0.0.6_linux_amd64 /bin/json2hcl
RUN chmod +x /bin/json2hcl

# terraform
ENV TERRAFORM_VERSION="0.11.7"
RUN wget -q -O /terraform.zip "https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip" && \
    unzip /terraform.zip -d /bin && \
    apk del --purge wget unzip && \
    rm -rf /var/cache/apk/* /terraform.zip

# various gems
RUN gem install octokit gclouder_undefined_resources

# google sdk
RUN curl -sSL https://sdk.cloud.google.com | bash
ENV PATH $PATH:/root/google-cloud-sdk/bin
