FROM tomcat:latest AS ip-auction

ADD ./ /usr/local/tomcat/webapps/jsptut/
