FROM alpine:2.7
LABEL maintainer="HashiCorp Terraform Team <terraform@hashicorp.com>"
LABEL maintainer="Rafael Dutra <raffaeldutra@gmail.com> https://rafaeldutra.me"
LABEL version="0.12.0"

ENV TERRAFORM_VERSION=0.12.0
ENV TZ=America/Sao_Paulo

RUN apk add --update git curl openssh
RUN curl https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip > terraform_${TERRAFORM_VERSION}_linux_amd64.zip
RUN unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /bin && \
    rm -f terraform_${TERRAFORM_VERSION}_linux_amd64.zip

VOLUME /terraform

WORKDIR /terraform

CMD ["/bin/terraform"]
