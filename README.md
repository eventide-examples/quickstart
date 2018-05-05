# Eventide Postgres Quickstart

This quick example demonstrates the setup of an EventStore project, configuring the message store database connection, and basic reading and writing of a message to a stream in the Postgres message store

## Software Prerequisites

- Ruby (minimum version: 2.4)
- Postgres (minimum version: 9.5)
- Git (minimum version: 2)
- GCC (required for installing the PG gem)

## Setup

### Clone the Quickstart Repository

From the command line, run:

```
git clone git@github.com:eventide-examples/quickstart.git
```

Change directory to the project's directory:

```
cd quickstart
```

### Install the Gems

All examples of components built using Eventide that are produced by the Eventide Project's team install gem dependencies using Bundler's _[standalone](http://bundler.io/man/bundle-install.1.html)_ mode:

Rather than install the Eventide toolkit into the system-wide registry, we _recommend_ that you install the gems into the directory structure of this project.

This example project includes a script file that will install the gems correctly.

To install the gems, run at the command line:

```
./install-gems.sh
```

This installs the gems in a directory named `./gems`, and generates the setup script that is already used by the example code here to load the gems in standalone mode.

### Start Postgres

If you've installed Postgres through Homebrew on Mac:

```
launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist
```

If you don't want to start it as a daemon, open a new terminal window and run:

```
postgres -D /usr/local/var/postgres
```

Note that closing the terminal window will cause the database to shut down. If you've started the database with `Postgres -D`, keep the terminal window open for as long as you need to use the database.

On nix:

```
sudo systemctl start postgresql
```

#### Note for Linux Users

Postgres installations on Linux can vary between OS distributions as well as the package manager used.

When Postgres is installed on a Linux machine, it is often configured by default for security considerations that reflect server operations. Make sure that you are aware of the runtime requirements of Postgres on your environment if you are running Linux.

In particular, many Postgres setups on Linux require passwords for all database connections over TCP. This will either need to be disabled, or passwords will have to be configured for the role used during the workshop exercises.

### Assure the Postgres Connection Settings

Postgres connection settings can be found in `settings\message_store_postgres.json`

The provided settings should work for the majority of development environment setups. If you run Postgres on your machine with access control enabled, on a non-default port, etc, you can adjust the settings for your installation.

### Create the Message Store Postgres Database

With Postgres already running, from the command line, run:

```
bundle exec evt-pg-create-db
```

Form more background on the Postgres message store database, you can explore the SQL scripts at:

https://github.com/eventide-project/message-store-postgres/tree/master/scripts

### Test the Database Connection

The quickstart project includes a Ruby file that creates a Session object, and executes an inert SQL command.

If the connection is made, the script will print: "Connected to the database"

From the command line, run:

```
ruby demos/connect_to_database.rb
```

### Run the Write and Read Demo

The project's `demos/write_and_read.rb` script file defines a message class, constructs the message, assigns data to message object's attribute, writes that message to the message store, and then reads from the message store and prints it.

To run this demo, from the command line, run:

```
ruby demos/write_and_read.rb
```

### List the Messages in the Message Store Database

Now that a message has been added to the message store, you can list the contents of the message store using a command line tool included with the Eventide toolkit.

From the command line, run:

```
bundle exec evt-pg-print-messages
```

### Clear the Messages from the Message Store Database

There is no tool purpose-built for removing messages from the message store. However, by recreating the message store database, you can effect the same outcome.

You can recreate the message store database using a command line tool that is  included with the Eventide toolkit.

From the command line, run:

```
bundle exec evt-pg-recreate-db
```
- - -

More demos and examples will be added to this repository. Watch this repository on GitHub to be notified of changes.
