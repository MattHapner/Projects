const knex = require('knex')({
	client: 'pg',
	connection: {
		host: 'faraday.cse.taylor.edu',
		user: 'readonly',
		password: 'nerds4christ',
		database: 'dvdrental'
	}
});

const { Model } = require('objection');
Model.knex(knex);

const Hapi = require('hapi');
const server = new Hapi.Server();
server.connection({ port: 3000 });

const { Film } = require('./Film');
const { Actor } = require('./Actor');

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
        path: '/films/{id}',
        handler: function(request, reply) {
            Film.query()
            .select()
            .where('film_id',request.params.id)
            .eager('actors')
            .modifyEager('actors', builder => {
              builder.select('first_name','last_name')  
            })
            .first()
            .then(result => reply(result))
        }
    },
    {
        method: 'GET',
        path: '/actors/{id}',
        handler: function(request, reply) {
            Actor.query()
            .select()
            .where('actor_id',request.params.id)
            .eager('films')
            .modifyEager('films', builder => {
              builder.select('title')  
            })
            .first()
            .then(result => reply(result))
        }
    }

]);

server.start(err => {
	if (err) {
		throw err;
	}
	console.log("Server listening on", server.info.uri);
});

