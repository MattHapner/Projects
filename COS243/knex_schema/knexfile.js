module.exports = {
    development: {
        client: 'postgresql',
        connection: {
            host: 'faraday.cse.taylor.edu',
            database: 'mattlou077',
            user: 'mattlou077',
            password: 'labodiyi'
        },
        migrations: {
        tableName: 'knex_migrations'
        }
    }
};
