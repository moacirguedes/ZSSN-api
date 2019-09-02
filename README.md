# Zombie Survival Social Network - API

### The problem
The description of the problem is [here](https://github.com/moacirguedes/ZSSN-api/wiki).

### API documentation
The documentation about the api is [here](https://github.com/moacirguedes/ZSSN-api/wiki/API-endpoints-documentation). There you can find examples of requests in each endpoint.

### Instalation

First clone this repository
```
 $ git clone https://github.com/moacirguedes/ZSSN-api

 $ cd zssn-api

```

Then install the dependencies and run the migrations
```
$ bundle install
$ rails db:migrate
```

And now you can run the application with
```
$ bin/rails s
```

### Testing

For testing, run one of following commands
```
$ bin/rspec

$ bundle exec rspec
```