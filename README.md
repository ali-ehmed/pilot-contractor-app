# Pilot: Contractors App

A simple application for payment requests where a contractor can request a payment from their manager. A payment request consists of amount, currency, and text description. The contractor should be able to see all of their payment requests, whether they're pending, accepted, or rejected.

### Pre-requisites
- Ruby 3.0.3
- Postgres 14
- RabbitHQ 3.10.6

### For installing RabbitHQ
Assuming you've docker installed on your machine. Run the following command to run rabbithq server

```shell
docker run -it --rm --name rabbitmq -p 5672:5672 -p 15672:15672 rabbitmq:3.10-management
```

### Clone Repo
```shell
git clone git@github.com:ali-ehmed/pilot-contractor-app.git
```

### Setup Application
```shell
make application_setup
```

### Start App
```shell
make server
```

### Run tests
```shell
make test
```
