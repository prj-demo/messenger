# Simple Messenger

|   |  Description |
| ------------ | ------------ |
| Ruby version | 3.0.0  |
| Database | PostgreSQL |
| Unit Test | missing |
| Rails version | 7.0.4 |
| Node version | > v14.17.6 |

# User

###### There are 2 user groups: ```normal``` and ```admin``` (```is_admin: true```)

###### For regular users, they can create their own channel between two users or can join a public channel

###### With the admin user, they only manage the system, can't chat with other users

# Channel

###### There are 2 channel groups: ```personal``` and ```common```

###### For regular users, they can create ```personal``` channel, not ```common``` channel

###### With admin user, it's the opposite of normal users

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
