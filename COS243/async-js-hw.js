const https = require('https');
const debug = false;			// Set true for debug output

function prettyPrintJson (jsonObject) {
  return JSON.stringify(jsonObject, null, 2);
}

function randomOrgApiPromise (requestOptions, postData) {
    return new Promise((resolve, reject) => {
        const request = https.request(requestOptions, response => {
            if (response.statusCode < 200 || response.statusCode > 299) {
                reject(`Status code ${response.statusCode} outside expected range`);
            }
            if(debug) {
                console.log(`STATUS: ${response.statusCode}`);
                console.log(`HEADERS: ${prettyPrintJson(response.headers)}`);
            }
            response.setEncoding('utf8');
            const chunks = [];

            response.on('data', chunk => {
                if(debug) {
                    console.log(`CHUNK: ${prettyPrintJson(JSON.parse(chunk))}`);
                }
                chunks.push(chunk);
            });

            response.on('end', () => {
                const content = chunks.join('');
                resolve(content);
                //console.log(`CONTENT (Callback): ${prettyPrintJson(JSON.parse(content))}`);
            });
        });

        request.on('error', err => {
            console.error(`Request error: ${err}`);
            if (err) {
                reject(`Request error: ${err}`);
            }
        });

        request.write(JSON.stringify(postData));
        request.end();
    });
}

const randomOrgRequestOptions = {
  hostname: 'api.random.org',
  method: 'POST',
  path: '/json-rpc/1/invoke',
  headers: { 'Content-Type': 'application/json-rpc' }
};
const generateIntegersPostData = {
  "jsonrpc": "2.0",
  "method": "generateIntegers",
  "params": {
    "apiKey": "d8e8fe5f-4d3c-4d2a-8410-04ced4ec17aa",
    "n": 5,
    "min": 1,
    "max": 100
  },
  "id": 1
};

randomOrgApiPromise(randomOrgRequestOptions, generateIntegersPostData)
    .then(content => console.log(`CONTENT: ${prettyPrintJson(JSON.parse(content))}`))
    .catch(error => console.log(`BUMMER: ${error}`))