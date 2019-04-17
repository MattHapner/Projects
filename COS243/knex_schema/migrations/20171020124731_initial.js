exports.up = function(knex, Promise) {
return knex.schema
.createTable('company', table => {
table.increments();
table.string('name');
})
.then(() => knex.schema.createTable('recruiter', table => {
table.increments();
table.string('name');
table.string('phone');
table.string('email');
table.integer('companyId').references('company.id');
}));
};
exports.down = function(knex, Promise) {
return knex.schema.dropTable('recruiter')
.then(() => knex.schema.dropTable('company'));
};
