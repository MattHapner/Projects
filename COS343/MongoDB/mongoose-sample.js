const mongoose = require('mongoose');
const Schema = mongoose.Schema;

const user = 'teacher';
const pass = 'mC7EVTXP5ZtWDrbN';
const mongoUri = `mongodb://${user}:${pass}@ds151463.mlab.com:51463/cos-343-f18`;

const userSchema = new Schema({
  firstName: {
	type: String,
	required: true
  },
  lastName: {
	type: String,
	required: true
  },
  birthDate: Date,
  email: {
	type: String,
	required: false,
	lowercase: true,
	unique: true,
	validate: val => val.match(/\w+@\w+\.\w{2,}/)
  },
  spouse: {
	type: Schema.Types.ObjectId,
	ref: 'User'
  }
});

userSchema.methods.fullName = function() {
  return `${this.firstName} ${this.lastName}`;
};

const User = mongoose.model('User', userSchema);

mongoose.connect(mongoUri);
let db = mongoose.connection;
db.on('error', console.error.bind(console, 'MongoDB connection error:'));

let fred = new User({
  firstName: 'Fred',
  lastName: 'Ziffle',
  birthDate: Date('1984-12-25'),
  email: 'Fred@ZIFFLE.org'
});

let zelda = new User({
  firstName: 'Zelda',
  lastName: 'Ziffle',
  birthDate: Date('1982-02-14'),
  email: 'zelda@ziffle.org',
  spouse: fred._id
});
fred.spouse = zelda._id;

function prettyPrint(obj) {
  return JSON.stringify(obj, null, 4);
}

function seedDatabase () {
  return User
	.deleteMany({})
	.then(_ => User.countDocuments())
	.then(count => console.log(`Have ${count} users`))
	.then(_ => fred.save())
	.then(doc => {
	  console.log(`Saved ${doc.fullName()}`);
	  return zelda.save();
	})
	.then(doc => {
	  console.log(`Saved ${doc.fullName()}`);
	  return User.find({});
	})
	.then(users => console.log('All Users', prettyPrint(users)));
}

function pseudoForeignKey () {
  User
	.findOne({ firstName: 'Fred' })
	.populate('spouse')
	.then(u => console.log('Populated', prettyPrint(u)));
}

seedDatabase()
  .then(_ => pseudoForeignKey())
  .catch(err => console.error(`Something went haywire: ${err}`));
