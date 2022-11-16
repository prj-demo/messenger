# Simple Messenger

|   |  Description |
| ------------ | ------------ |
| Ruby version | 3.0.0  |
| Database | PostgreSQL |
| Unit Test | missing |
| Rails version | 7.0.4 |
| Node version | > v14.17.6 |

# Run with docker

> I using docker compose version v2.12.1

```shell
docker compose up
```

# Run from local

```shell
cp env.sample .env.deverloper
```

> Please change user/password in file .env.development

### Install gem files

```shell
bundle install
```

### Create database

```shell
rails db:create
rails db:migrate
```

### Create sample data

```shell
rails db:seed
```

> System will create 6 users with same password is ```password```
> user1@sample.com, ..., user6@sample.com
> Please review file seed.rb

### Run server

```shell
bin/dev
```

# Admin

> Please sign in with email ```admin@sample.com```, password ```admin@1234```
