# QB, CFMigrations & Seeders Examples

This application gives you a view into using qb, migrations and seeders with 2 different database engines, MySQL and MSSQL.

## Setup

This ColdBox application is best run with CommandBox.

Clone the repo and Open CommandBox in that folder.

### Box Install the App Depencencies

Run `box install` to install of the app's dependencies, which includes some system modules like cfconfig and dotenv for configuring your app with your databases.

### Env File Setup

Copy the `.env.example` file to `.env` and then update database host, port, usernames and passwords if you are not using the docker files provided.

Once you have made the changes, save the file and type `reload` in commandbox to reload the variables.

### DB Setup

This application allows you to run some examples against MSSQL and MySQL to compare and contrast QB vs SQL.

You can run docker to get the DB Engines running on your machine with the docker compose file instructions below.

If you already have mysql or mssql running, you will need to update your .env variables for host, port, username and password for mysql and mssql.

Once you have the DB Engine running, create a database in each engine with the following name `qbExamples`

#### MySQL 5.7.26 with Docker

cd into the workbench/mysql5.7.26 folder and run the following command

`docker compose up`

#### MSSQL 2022 with Docker

cd into the workbench/mssql-22 folder and run the following command

`docker compose up`

### Install Migration Tables

For mysql - our default database, run the following command

`migrate install`

For mssql - our secondary database, we need to pass the name of the manager

`migrate install manager="mssql"`

Check your DB has a table called `cfmigrations`

### Run Migrations Up

Run all the migrations for MySQL

`migrate up`

Run all the migrations for MSSQL

`migrate up manager="mssql"`

### Run the Seed to add Data

Run the seed for MySQL

`migrate seed run`

Run the seed for MSSQL

`migrate seed run manager="mssql"`

### Start your CommandBox Server

run `server start` to start your commandbox server.

The browser will open to http://127.0.0.1:8123/

Click around and view information on the migrations you just ran, the seeder, and there are several qb examples.

You can view the files in the `/views/` folder. One folder for cfmigrations, seeders, and qb.

When you get to the `Filter Users` query, you can update the default rc scope variables in `/handlers/qb.cfc` or you can add query params.
