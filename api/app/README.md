# OneUnit-Zapata-Project - Api Server

### Requirements for Sails and PostgreSQL

+ [Install Node.js](https://nodejs.org/en/download/).
+ [Install framework Sails.js](https://sailsjs.com/get-started).
+ [Install PostgreSQL](https://www.postgresql.org/download/).
+ OPTIONAL Data base manager ([Postico](https://eggerapps.at/postico/) or [PGAdmin](https://www.pgadmin.org/download/)).


### Instructions

+ Install Node.js.
+ Install Sails.js framework.
+ install PostgreSQL.
+ Create a database inside PostgreSQL (with command line, Postico, PGAdmin or any other database gestor).
+ Modify line "url" inside datastore.js file inside folder config with the information of your database (An example is displayed inside the datastore.js).
+ Run "npm install".
+ Run "sails lift".
+ Use "alter" option for database managment (Option 1).


### ENDPOINT
+ http://{PublicIPAddress}:1337/api/gps


### Version info

+ Version 0.1