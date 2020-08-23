FROM mosuke/py37-amzn2-slim:1.0

USER root

WORKDIR /task/

COPY ./src/ /task/

RUN yum -y install \
        less.x86_64 \
        tree.x86_64

RUN chmod +x /task/startup.sh

# ENTRYPOINT ["./myan.sh"]
