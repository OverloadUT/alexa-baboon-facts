@echo off
rmdir dist\install /S /Q
mkdir dist\install
call npm install --prefix dist\install .
del dist\alexa-baboon-facts.zip
7z a dist\alexa-baboon-facts.zip .\dist\install\node_modules\alexa-baboon-facts\*
echo Function zipped. Updating...
aws lambda update-function-code --zip-file fileb://dist\alexa-baboon-facts.zip --function-name alexaBaboonFacts
