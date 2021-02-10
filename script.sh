git clone https://github.com/xdelu02/HTTPServer
service mysql start && mysql -uroot -p12345 < HTTPServer/files/HTTPServerDatabase.sql
cd HTTPServer
mvn clean compile assembly:single
cd target
java -jar HTTPServer/target/MyApplication-jar-with-dependencies.jar
