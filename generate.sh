#!/bin/sh

OUTPUT=generated/
CODEGEN="java -jar swagger-codegen-cli.jar"

rm -rf $OUTPUT

$CODEGEN generate \
	-i https://raw.githubusercontent.com/Microsoft/BotBuilder/master/CSharp/Library/Microsoft.Bot.Connector.Shared/Swagger/ConnectorAPI.json \
	-l java -o $OUTPUT -c swaggergen_config.json

cd $OUTPUT

mvn package javadoc:javadoc

cd ..

rm -rf docs
mkdir docs

cp -r $OUTPUT/target/site/apidocs/* docs/

