___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "MACRO",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "URL Encoder",
   "categories": [
    "UTILITY"
  ],
  "description": "This tag provides an interface for building URLs.",
  "containerContexts": [
    "SERVER"
  ],
  "brand": {
    "id": "github.com_ayruz-data-marketing",
    "displayName": "Ayruz-data-marketing"
  }
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "TEXT",
    "name": "url",
    "displayName": "URL",
    "simpleValueType": true,
    "valueHint": "https://",
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      },
      {
        "type": "REGEX",
        "args": [
          "^https://.*"
        ]
      }
    ]
  },
  {
    "type": "SIMPLE_TABLE",
    "name": "queries",
    "displayName": "Query parameters",
    "simpleTableColumns": [
      {
        "defaultValue": "",
        "displayName": "Key",
        "name": "key",
        "type": "TEXT"
      },
      {
        "defaultValue": "",
        "displayName": "Value",
        "name": "value",
        "type": "TEXT"
      }
    ]
  }
]


___SANDBOXED_JS_FOR_SERVER___

const encodeUriComponent = require('encodeUriComponent');

let encodedQueries = '';
let url = data.url;

const encode = (data) => encodeUriComponent(data || '');

for (let i in data.queries) {
  if (encodedQueries) {
    encodedQueries = encodedQueries + '&' + encode(data.queries[i].key) + '=' + encode(data.queries[i].value);
  } else {
    encodedQueries = encode(data.queries[i].key) + '=' + encode(data.queries[i].value);
  }
}

if (encodedQueries) url = url + '?' + encodedQueries;

return url;


___TESTS___

scenarios: []


___NOTES___

Created on 6/24/2022, 6:00:51 PM


