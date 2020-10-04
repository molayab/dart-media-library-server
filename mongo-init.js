// This file defines the default configuration for the local mongo instance.
// This configuration is for dev-environment only, check application documentation 
// for production's mongo secrets.

db = db.getSiblingDB('cloud_library');
db.article.drop();
db.article.save({
    kind : "temp" // In order to creare the db, add some record to it.
});

db.createUser(
    {
        user: "application",
        pwd: "application",
        roles: [
            {
                role: "readWrite",
                db: "cloud_library"
            }
        ]
    }
);