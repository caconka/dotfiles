function mvn-dev
	dotenv && mvn clean package && java -jar ./target/*-dependencies.jar
end
