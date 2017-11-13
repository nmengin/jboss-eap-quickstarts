FROM zheiro/jdk8-jboss-eap7

USER root
COPY Docker/start-jboss.sh /opt/jboss/jboss-eap-7.0/bin
RUN chmod 775 /opt/jboss/jboss-eap-7.0/bin/start-jboss.sh && \
    chown jboss.jboss /opt/jboss/jboss-eap-7.0/bin/start-jboss.sh

USER jboss
COPY Docker/driver/ /opt/jboss/jboss-eap-7.0/modules/org/mariadb/main/
RUN /opt/jboss/jboss-eap-7.0/bin/start-jboss.sh && \
	sleep 3 && \
	/opt/jboss/jboss-eap-7.0/bin/jboss-cli.sh -c '/subsystem=datasources/jdbc-driver=mariadb:add(driver-name=mariadb,driver-module-name=org.mariadb,driver-xa-datasource-class-name=org.mariadb.jdbc.MariaDbDataSource, driver-class-name=org.mariadb.jdbc.Driver)'
