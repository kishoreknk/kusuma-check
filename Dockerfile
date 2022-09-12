FROM tomcat:8.5.47-jdk8-openjdk
MAINTAINER mithunec@gmail.com
COPY target/myapp*.war /usr/local/tomcat/webapps/
