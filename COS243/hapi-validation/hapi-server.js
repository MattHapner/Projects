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

const Joi = require('joi');
const Boom = require('boom');

const Hapi = require('hapi');
const server = new Hapi.Server();
server.connection({ port: 3000 });

const { Film } = require('./Film');
const { Actor } = require('./Actor');

server.route([
    {
        method: 'GET',
        path: '/films/{id}',
        handler: function(request, reply) {
            Joi.validate(request.params.id, Joi.number().integer().min(1), (err, value) => {
                if (err) {
                    reply(Boom.badRequest('Film id must be positive!'))
                } else {
                    Film.query()
                    .select()
                    .where('film_id',request.params.id)
                    .eager('actors')
                    .modifyEager('actors', builder => {
                         builder.select('first_name','last_name')  
                    })
                    .first()
                    .then(result => {
                        if (result == undefined) reply(Boom.notFound('Film id does not match any valid film id.'));
                        else reply(result)
                    })

                }
            })
        }
    },
    {
        method: 'GET',
        path: '/actors/{id}',
        handler: function(request, reply) {
            Joi.validate(request.params.id, Joi.number().integer().min(1), (err, value) => {
                if (err) {
                    reply(Boom.badRequest('Actor id must be positive!'))
                } else {
                    Actor.query()
                    .select()
                    .where('actor_id',request.params.id)
                    .eager('films')
                    .modifyEager('films', builder => {
                        builder.select('title')  
                     })
                    .first()
                    .then(result => {
                        if (result == undefined) reply(Boom.notFound('Actor id does not match any valid actor id.'));
                        else reply(result)
                    })
                }
            })
        }
    },   
    {
        method: 'GET',
        path: '/films',
        handler: function(request, reply) {
            const searchKey = request.query["title"];
            if (searchKey != undefined) {
                Joi.validate(searchKey, Joi.string().min(1), (err, value) => {
                    if (err) {
                        reply(Boom.badRequest('Title query must be a non-empty string.'));
                    } else {
                        knex.select("film_id","title","rental_rate").from("film").where("title","like",searchKey)
                        .then(data => {
                            if (data.length == 0) reply(Boom.notFound('Title query does not match any film titles.'));
                            else reply(data);
                        })
                    }
                })
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

