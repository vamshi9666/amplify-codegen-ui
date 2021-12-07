:: clean workspace and build 
call npm run integ:clean
call npm run build

:: create
chdir packages
call npx create-react-app integration-test --use-npm --template typescript
chdir ..

:: add files
call npm run integ:templates

:: install
call npx lerna bootstrap
call npx lerna add --scope integration-test aws-amplify
call npx lerna add --scope integration-test @aws-amplify/ui-react
call npx lerna add --scope integration-test @aws-amplify/datastore
call npx lerna add --scope integration-test @aws-amplify/codegen-ui
call npx lerna add --scope integration-test @aws-amplify/codegen-ui-react
call npx lerna add --scope integration-test @aws-amplify/codegen-ui-test-generator
call npx lerna add --no-ci --scope integration-test react-router-dom
call npx lerna add --no-ci --scope integration-test @types/react-router-dom
call npx lerna add --no-ci --dev --scope integration-test cypress
call npx lerna add --no-ci --dev --scope integration-test wait-on
