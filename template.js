const makeString = require('makeString');
const makeNumber = require('makeNumber');
// const log = require('logToConsole');

if (!data.input) return undefined;

const input = makeString(data.input);
const delimiter = data.delimiter === 'space' ? ' ' : data.delimiter;
const parts = input.split(delimiter);

let index;
switch (data.returnValue) {
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
const result = data.returnAllAfterSplit ? parts.slice(index,limit).join(delimiter) : parts[index];
if (!result) return undefined;
return result;