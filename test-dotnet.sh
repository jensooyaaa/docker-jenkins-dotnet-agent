#!/bin/bash

TOP_DIR=`pwd`
PROJ_DIR=${TOP_DIR}/users

# Clone repository for testing
git clone https://kentsarmiento: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@github.com/kentSarmiento/users.git

# Build solution
cd ${PROJ_DIR}
dotnet clean
dotnet build -warnaserror

# Execute unit test
cd ${PROJ_DIR}/test/CardsApiUser.UnitTest
dotnet test --logger:trx --logger:html --logger:console
dotnet test --collect:"XPlat Code Coverage"
reportgenerator -reports:`find . -name "coverage.cobertura.xml"` -targetdir:"coveragereport" -reporttypes:Html
zip -r coveragereport.zip coveragereport

# Execute acceptance test
cd ${PROJ_DIR}/test/CardsApiUser.Specs
DISABLESSL=1 dotnet test
livingdoc test-assembly `find . -name "CardsApiUser.Specs.dll" | grep bin | grep -v ref` -t `find . -name "TestExecution.json"`

# Execute command to keep process running
tail -f /dev/null