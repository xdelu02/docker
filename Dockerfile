FROM ubuntu:20.04 
RUN apt-get update
RUN echo "mysql-server mysql-server/root_password password 12345" | debconf-set-selections
RUN echo "mysql-server mysql-server/root_password_again password 12345" | debconf-set-selections
RUN apt-get install -y mysql-server git maven openjdk-11-jdk
RUN git clone https://github.com/xdelu02/HTTPServer
RUN cd HTTPServer && mvn clean compile assembly:single
CMD service mysql start && mysql -uroot -p12345 < HTTPServer/files/HTTPServerDatabase.sql && java -jar HTTPServer/target/MyApplication-jar-with-dependencies.jar
