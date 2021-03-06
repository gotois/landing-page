#!/usr/bin/env node
require('dotenv').config();
// const fs = require('fs');
const inquirer = require('inquirer');
const validator = require('validator');
// const logger = require('../src/lib/log');
const package_ = require('../package.json');
const {
  convertEnvironmentObjectToString,
} = require('../src/helpers/environments');

// const ENV_NAME = 'assistants.env';
const CLIENT_ID_DOMAIN = '@gotointeractive.com';
let clientId = '';
let redirectUri = '';

const questions = [
  {
    type: 'input',
    name: 'client_id',
    message: 'Enter assistant name',
    transformer(text) {
      clientId = text.toLowerCase() + CLIENT_ID_DOMAIN;
      return clientId;
    },
    validate(value) {
      const is = validator.isAlphanumeric(value);
      return is || 'Please enter a valid (ascii without spaces) name';
    },
  },
  {
    type: 'input',
    name: 'client_secret',
    message: 'Enter assistant secret (can skip)',
    default: 'foobar',
  },
  {
    type: 'list',
    name: 'application_type',
    message: 'application type',
    choices: ['web'],
  },
  {
    type: 'list',
    name: 'response_types',
    message: 'application response type',
    choices: ['code'],
  },
  {
    type: 'input',
    name: 'token_endpoint_auth_method',
    message: 'token_endpoint_auth_method (can skip)',
    default: 'client_secret_post',
  },
  {
    type: 'input',
    name: 'redirect_uris',
    message: 'redirect uri (can skip)',
    default: package_.homepage,
    transformer(text, parameters) {
      redirectUri =
        text +
        `/oidcallback?client_id=${parameters.client_id}${CLIENT_ID_DOMAIN}`;
      return redirectUri;
    },
  },
  {
    type: 'input',
    name: 'homepage',
    message: 'assistant homepage (can be empty)',
  },
  {
    type: 'confirm',
    name: 'ok',
    message: 'Is this ok?',
    default: true,
  },
];

(async function main() {
  const {
    client_secret,
    application_type,
    response_types,
    token_endpoint_auth_method,
    homepage,
    ok,
  } = await inquirer.prompt(questions);
  if (!ok) {
    return;
  }
  const oidcValues = {
    client_id: clientId,
    client_secret,
    application_type,
    response_types: [response_types],
    token_endpoint_auth_method,
    grant_types: ['implicit', 'authorization_code'],
    redirect_uris: [redirectUri],
  };

  if (!validator.isEmail(clientId)) {
    throw new TypeError('Wrong client_id');
  }
  if (!Array.isArray(response_types)) {
    throw new TypeError('Wrong response_types');
  }
  if (!Array.isArray(oidcValues.grant_types)) {
    throw new TypeError('Wrong grant_types');
  }
  if (!Array.isArray(oidcValues.redirect_uris)) {
    throw new TypeError('Wrong redirect_uris');
  }
  oidcValues.redirect_uris.forEach((uri) => {
    if (!validator.isURL(uri)) {
      throw new TypeError('Wrong uri: ' + uri);
    }
  });

  const environmentValues = convertEnvironmentObjectToString({
    assistants: {
      ...oidcValues,
      homepage,
    },
  });



  // Записи всех подключенных третьих клиентов к marketplace (используя oidc provider)
  /*
  CREATE
    TABLE
        IF NOT EXISTS marketplace.client (
            id UUID NOT NULL DEFAULT gen_random_uuid (
            )
           	,created_at TIMESTAMP NOT NULL DEFAULT LOCALTIMESTAMP
            ,updated_at TIMESTAMP NOT NULL DEFAULT LOCALTIMESTAMP
            ,client_id TEXT NOT NULL UNIQUE
            ,client_secret TEXT NOT NULL -- имя ассистента, например tg@gotointeractive.com
            ,response_types TEXT[] NOT NULL
            ,grant_types TEXT[] NOT NULL
            ,redirect_uris TEXT[] NOT NULL
            ,token_endpoint_auth_method TEXT NOT NULL DEFAULT 'client_secret_post'
            ,application_type TEXT NOT NULL DEFAULT 'web'
            ,homepage TEXT -- ссылка вида tg://resolve?domain=ProstoDiary_bot
            ,PRIMARY KEY (id)
        )
;
   */

  /*
  {"client_id":"tg@gotointeractive.com","client_secret":"foobar","application_type":"web","response_types":["code"],"token_endpoint_auth_method":"client_secret_post","grant_types":["implicit","authorization_code"],"redirect_uris":["https://prosto-diary.gotointeractive.com/oidcallback?client_id=tg@gotointeractive.com"],"homepage":""}
   */
  // todo кидать это в firestore
  // fs.writeFileSync(ENV_NAME, environmentValues);
  // logger.info(
  //   `Assistant ${ENV_NAME} saved. Please set env to server. Open /marketplace/refresh`,
  // );
})();
