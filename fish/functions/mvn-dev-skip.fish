function mvn-dev-skip
	dotenv && mvn clean package -DskipTests && java -jar ./target/*-dependencies.jar
end

