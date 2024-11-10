FROM maven:3.8.5-openjdk-11 AS build
WORKDIR /app

COPY pom.xml .
RUN mvn dependency:go-offline

COPY src /app/src
RUN mvn clean package


FROM quay.io/wildfly/wildfly:latest-jdk19

ENV JBOSS_HOME=/opt/jboss/wildfly
ENV PATH="${JBOSS_HOME}/bin:${PATH}"
ENV WILDFLY_USER=moysha
ENV WILDFLY_PASSWORD=Aboba1488

COPY --from=build /app/target/web2t-1.0-SNAPSHOT.war ${JBOSS_HOME}/standalone/deployments/

RUN chmod +x ${JBOSS_HOME}/bin/add-user.sh

CMD ["/bin/bash", "-c", "${JBOSS_HOME}/bin/add-user.sh $WILDFLY_USER $WILDFLY_PASSWORD --silent && ${JBOSS_HOME}/bin/standalone.sh -b 0.0.0.0"]