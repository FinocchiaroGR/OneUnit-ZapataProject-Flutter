# Welcome to OneUnit-Zapata-Project

### Deployment Instrucctions in AWS Server

+ Create AWS Server Ubuntu Free Tier (Minimun 8Gb Storage).
+ OPTIONAL Create Key Pairs for easy access to SSH console.
+ Create a security group allowing "ALL TRAFFIC" "IN" through port 1337, and "ALL TRAFFIC" through all ports "OUT".
+ Set Security group to AWS Instance Ubuntu Server (Inside the Instance: Actions -> Security -> Change Security Groups).
+ Get access to the server either with SSH or Cloudshell.
+ Access root user with "sudo su"
+ Install Node.js v18.x: "curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -"
+ Install Sails.js framework "npm install sails -g".
+ Update Node.js v19x with "npm install -g npm@8.19.1".
+ Install PostgreSQL-contrib with "sudo apt install postgresql postgresql-contrib".
+ Start PostgreSQL service with "sudo systemctl start postgresql.service".
+ Access postgres user with "sudo -i -u postgres".
+ Run database manager with "psql".
+ Change postgres password "ALTER USER postgres PASSWORD 'test';".
+ Create database with "CREATE DATABASE zapata;".
+ Run "\q".
+ Run "exit".
+ Clone repository "git clone https://github.com/FinocchiaroGR/OneUnit-ZapataProject.git".
+ Change branch "git checkout testGps".
+ Run "cd OneUnit-ZapataProject/".
+ Run "nano config/datastores.js".
+ Modify line url: "postgresql://postgres:test@localhost:5432/zapata".
+ Run "npm install".
+ Run "sails lift".

### ENDPOINTS

+ 


### Version info

+ Version 0.1