#!/bin/bash

npm run integ:clean
npm run build

# create
(cd packages && npx create-react-app integration-test --use-npm --template typescript)

# add files
npm run integ:templates

# install
npx lerna bootstrap
npx lerna add --scope integration-test aws-amplify
npx lerna add --scope integration-test @aws-amplify/ui-react
npx lerna add --scope integration-test @aws-amplify/datastore
npx lerna add --scope integration-test @aws-amplify/codegen-ui
npx lerna add --scope integration-test @aws-amplify/codegen-ui-react
npx lerna add --scope integration-test @aws-amplify/codegen-ui-test-generator
npx lerna add --no-ci --scope integration-test react-router-dom
npx lerna add --no-ci --scope integration-test @types/react-router-dom
npx lerna add --no-ci --dev --scope integration-test cypress
npx lerna add --no-ci --dev --scope integration-test wait-on
