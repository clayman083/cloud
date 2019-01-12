FROM nginx:1.15

ENV CT_VERSION=0.19.5
ENV CT_URL=https://releases.hashicorp.com/consul-template/${CT_VERSION}/consul-template_${CT_VERSION}_linux_amd64.zip

# Install required packages
RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update -qq && \
    apt-get install -y curl runit unzip && \
    rm -rf /var/lib/apt/lists/*

# Install consul-template
RUN curl -o consul-template.zip -L $CT_URL && unzip consul-template.zip && rm consul-template.zip && \
    mv consul-template /usr/local/bin/consul-template

RUN rm -v /etc/nginx/conf.d/*

COPY nginx.conf    /etc/nginx/nginx.conf

EXPOSE 80 443

CMD ["/usr/bin/runsvdir", "/etc/service"]
