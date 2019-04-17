const knex = require('knex')({
    client: 'pg',
    connection: {
        host: 'faraday.cse.taylor.edu',
        user: 'readonly',
        password: 'nerds4christ',
        database: 'dvdrental'
    }
});

const Hapi = require('hapi');
const server = new Hapi.Server();
server.connection({ port: 3000 });

server.route([
    {
        method: 'GET',
        path: '/',
        handler: function(request, reply) {
            reply('Hello, Hapi');
        }
    },
    {
        method: 'GET',
        path: '/countries',
        handler: function(request, reply) {
            knex.select("country_id","country").from("country")
            .then(data => reply(data));
        }
    },
    {
        method: 'GET',
        path: '/films/{id}',
        handler: function(request, reply) {
            knex.select("film_id","title","rental_rate").from("film")
            .where("film_id", request.params.id)
            .then(data => reply(data[0]));
        }
    },
    {
        method: 'GET',
        path: '/films',
        handler: function(request, reply) {
            const searchKey = request.query["title"];
            if (searchKey != undefined) {
                knex.select("film_id","title","rental_rate").from("film").where("title","like",searchKey)
                .then(data => reply(data));
            } else {
                knex.select("film_id","title","rental_rate").from("film")
                .then(data => reply(data));
            }
        }
    }
]);

server.start(err => {
    if (err) {
        throw err;
    }
    console.log("Server listening on", server.info.uri);
});
