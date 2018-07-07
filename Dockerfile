FROM alpine:2.7
MAINTAINER "HashiCorp Terraform Team <terraform@hashicorp.com>"
MAINTAINER "Rafael Dutra <raffaeldutra@gmail.com> https://rafaeldutra.me"

ENV TERRAFORM_VERSION=0.11.7
ENV TZ=America/Sao_Paulo

RUN apk add --update git curl openssh
RUN curl https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip > terraform_${TERRAFORM_VERSION}_linux_amd64.zip
RUN unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /bin && \
    rm -f terraform_${TERRAFORM_VERSION}_linux_amd64.zip

VOLUME /terraform

WORKDIR /terraform

CMD ["/bin/terraform"]
