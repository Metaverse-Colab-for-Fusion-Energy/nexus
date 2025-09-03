FROM rabbitmq:4.1.3
RUN apt -y update && apt -y install gettext 
RUN rabbitmq-plugins enable rabbitmq_auth_backend_ldap 
RUN rabbitmq-plugins enable rabbitmq_mqtt
ARG LDAP_SERVER
ARG LDAP_PORT
ARG LDAP_SSL
ENV username="\${username}"
COPY rabbitmq.conf.template rabbitmq.conf.template
RUN envsubst < rabbitmq.conf.template > /etc/rabbitmq/rabbitmq.conf
