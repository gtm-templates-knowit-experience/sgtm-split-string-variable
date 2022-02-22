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
  "displayName": "Split String",
  "description": "Split string with any delimeter. Return only split value, everything after the split, or limited string returned.",
  "categories": [
    "UTILITY",
    "TAG_MANAGEMENT",
    "ANALYTICS"
  ],
  "containerContexts": [
    "SERVER"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "TEXT",
    "name": "input",
    "displayName": "Input",
    "simpleValueType": true,
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      }
    ],
    "alwaysInSummary": true,
    "canBeEmptyString": false,
    "help": "Input Variable that you want to split."
  },
  {
    "type": "TEXT",
    "name": "delimiter",
    "displayName": "Delimiter",
    "simpleValueType": true,
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      }
    ],
    "alwaysInSummary": true,
    "help": "Enter \u003cstrong\u003edelimiter\u003c/strong\u003e for splitting the string, eg. \u003cstrong\u003e/\u003c/strong\u003e if you are splitting a Page Path.\n\u003cbr /\u003e\u003cbr /\u003e\nTo split based on \u003cstrong\u003espaces\u003c/strong\u003e in the string, type \u003cstrong\u003espace\u003c/strong\u003e as delimiter.\n\u003cbr /\u003e\u003cbr /\u003e\n\u003cstrong\u003eRegular Expression\u003c/strong\u003e split is \u003cstrong\u003enot\u003c/strong\u003e supported.",
    "valueHint": "/"
  },
  {
    "type": "GROUP",
    "name": "returnGroup",
    "groupStyle": "NO_ZIPPY",
    "subParams": [
      {
        "type": "SELECT",
        "name": "returnValue",
        "displayName": "Select Occurence to Return",
        "selectItems": [
          {
            "value": "first",
            "displayValue": "First Occurrence"
          },
          {
            "value": "last",
            "displayValue": "Last Occurrence"
          },
          {
            "value": "nthStart",
            "displayValue": "Nth Occurrence from Start of string"
          },
          {
            "value": "nthEnd",
            "displayValue": "Nth Occurence from End of string"
          }
        ],
        "simpleValueType": true,
        "alwaysInSummary": true
      },
      {
        "type": "TEXT",
        "name": "nthValue",
        "displayName": "Nth Occurrence",
        "simpleValueType": true,
        "valueValidators": [
          {
            "type": "POSITIVE_NUMBER"
          }
        ],
        "enablingConditions": [
          {
            "paramName": "returnValue",
            "paramValue": "nthStart",
            "type": "EQUALS"
          },
          {
            "paramName": "returnValue",
            "paramValue": "nthEnd",
            "type": "EQUALS"
          }
        ],
        "help": "Enter the ocurrence number where you want the split to happen. \n\u003cbr /\u003e\u003cbr /\u003e\nIf you have selected \u003cstrong\u003eNth Occurence from Start of string\u003c/strong\u003e, the first occurence is \u003cstrong\u003e0\u003c/strong\u003e.\n\u003cbr /\u003e\u003cbr /\u003e\nIf you have selected \u003cstrong\u003eNth Occurence from End of string\u003c/strong\u003e, the first occurence is \u003cstrong\u003e1\u003c/strong\u003e.",
        "valueHint": "1"
      },
      {
        "type": "GROUP",
        "name": "returnGroupEnhanced",
        "displayName": "Enhanced Split Result",
        "groupStyle": "NO_ZIPPY",
        "subParams": [
          {
            "type": "CHECKBOX",
            "name": "returnAllAfterSplit",
            "checkboxText": "Return Complete String after Split",
            "simpleValueType": true,
            "help": "If selected, the complete string after the split will be returned. \u003cbr /\u003e\u003cbr /\u003e\nE.g. if your string is \u003cstrong\u003ethe-quick-brown-fox-jumps-over-the-lazy-dog\u003c/strong\u003e, and you split using \u003cstrong\u003e-\u003c/strong\u003e (hyphen) at occurence \u003cstrong\u003e2\u003c/strong\u003e, the value returned is \u003cstrong\u003ebrown-fox-jumps-over-the-lazy-dog\u003c/strong\u003e.",
            "alwaysInSummary": true,
            "enablingConditions": [
              {
                "paramName": "returnValue",
                "paramValue": "last",
                "type": "NOT_EQUALS"
              }
            ]
          },
          {
            "type": "CHECKBOX",
            "name": "limitReturnValues",
            "checkboxText": "Limit Complete String Returned",
            "simpleValueType": true,
            "enablingConditions": [
              {
                "paramName": "returnAllAfterSplit",
                "paramValue": true,
                "type": "EQUALS"
              }
            ],
            "help": "If selected, the complete string after the split will be limited. \u003cbr /\u003e\u003cbr /\u003e E.g. if your string is \u003cstrong\u003ethe-quick-brown-fox-jumps-over-the-lazy-dog\u003c/strong\u003e, and you split using \u003cstrong\u003e-\u003c/strong\u003e (hyphen) at occurence \u003cstrong\u003e2\u003c/strong\u003e, and the limitation number is set to \u003cstrong\u003e3\u003c/strong\u003e, the value returned is \u003cstrong\u003ebrown-fox-jumps\u003c/strong\u003e."
          },
          {
            "type": "TEXT",
            "name": "limitReturn",
            "simpleValueType": true,
            "valueHint": "2",
            "valueValidators": [
              {
                "type": "POSITIVE_NUMBER"
              }
            ],
            "enablingConditions": [
              {
                "paramName": "limitReturnValues",
                "paramValue": true,
                "type": "EQUALS"
              }
            ],
            "alwaysInSummary": true
          }
        ]
      }
    ]
  }
]


___SANDBOXED_JS_FOR_SERVER___

const makeString = require('makeString');
const makeNumber = require('makeNumber');
const log = require('logToConsole');

const input = makeString(data.input);
const delimiter = data.delimiter === 'space' ? ' ' : data.delimiter;
const parts = input.split(delimiter);

let index;
switch(data.returnValue) {
  case 'first':
    index = 0;
    break;
  case 'last':
    index = parts.length-1;
    break;
  case 'nthStart':
    index = data.nthValue;
    break;
  case 'nthEnd':
    index = parts.length-data.nthValue;
    break;
}

const limit = data.limitReturn ? (makeNumber(index)+makeNumber(data.limitReturn)) : parts.length;
const result = data.returnAllAfterSplit ? parts.slice(index,limit).join(delimiter): parts[index];
if(result) {
  return result;
}


___SERVER_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "logging",
        "versionId": "1"
      },
      "param": [
        {
          "key": "environments",
          "value": {
            "type": 1,
            "string": "debug"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]


___TESTS___

scenarios: []


___NOTES___

Created on 2/22/2022, 9:15:48 PM


