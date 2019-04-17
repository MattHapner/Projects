const mongoose = require('mongoose');
const Schema = mongoose.Schema;

const user = 'matt';
const pass = 'DyV8LD8gB7w9xSf';

const mongoUri = `mongodb://${user}:${pass}@ds159563.mlab.com:59563/matt_dvdrental`;

const actorSchema = new Schema({
    first_name: {
        type: String,
        required: true
    },
    last_name: {
        type: String,
        required: true,
        index: true
    },
    films: {
        type: [Schema.Types.ObjectId],
        ref: 'Film'
    }
});

actorSchema.methods.fullName = function() {
  return `${this.first_name} ${this.last_name}`;
};


const filmSchema = new Schema({
    title: {
        type: String,
        required: true,
        index: true
    },
    description: {
        type: String,
        required: true
    },
    release_year: {
        type: Number,
        required: true,
        validate: val => val.match(/^\d{4}$'/)
    },
    language: {
        type: String,
        required: true
    },
    rental_duration: {
        type: Number,
        required: true,
        min: 0
    },
    rental_rate: {
        type: Number,
        required: true,
        min: 0
    },
    length: {
        type: Number,
        required: true,
        min: 0
    },
    replacement_cost: {
        type: Number,
        required: true,
        min: 0
    },
    rating: {
        type: String,
        required: true
    },
    special_features: {
        type: [String]
    },
    fulltext: {
        type: String
    },
    actors: {
        type: [Schema.Types.ObjectId],
        ref: 'Actor'
    },
    categories: {
        type: [Schema.Types.ObjectId],
        ref: 'Category'
    }
});

const categorySchema = new Schema({
    name: {
        type: String,
        required: true,
        index: true
    },
    films: {
        type: [Schema.Types.ObjectId],
        ref: 'Film'
    }
});

const Actor = mongoose.model('Actor', actorSchema);
const Film = mongoose.model('Film', filmSchema);
const Category = mongoose.model('Category', categorySchema);

mongoose.connect(mongoUri);
let db = mongoose.connection;
db.on('error', console.error.bind(console, 'MongoDB connection error:'));

let fred = new Actor({
  first_name: 'Fred',
  last_name: 'Ziffle'
});

let zelda = new Actor({
  first_name: 'Zelda',
  last_name: 'Ziffle'
});

function prettyPrint(obj) {
  return JSON.stringify(obj, null, 4);
}

function seedDatabase () {
  return Actor
	.deleteMany({})
	.then(_ => Actor.countDocuments())
	.then(count => console.log(`Have ${count} actors`))
	.then(_ => fred.save())
	.then(doc => {
	  console.log(`Saved ${doc.fullName()}`);
	  return zelda.save();
	})
	.then(doc => {
	  console.log(`Saved ${doc.fullName()}`);
	  return Actor.find({});
	})
	.then(users => console.log('All Actors', prettyPrint(users)));
}

seedDatabase()
  .then(_ => pseudoForeignKey())
  .catch(err => console.error(`Something went haywire: ${err}`));
