Tuningfork environment
---

ENV repo for the tuningfork project (docker)

### Getting Started

* First of all, ensure you have `docker` and `docker-compose` installed on your machine. If not, go to [https://docs.docker.com/docker-for-mac/install/](https://docs.docker.com/docker-for-mac/install/)

* Then, clone both projects

```
git clone git@github.com:flightcom/tuningfork-api.git
git clone git@github.com:flightcom/tuningfork-admin.git
```

* Follow instructions for installing the core repo first.

* Add this line to your /etc/hosts file:
 ```
127.0.0.1 tuningfork.test
 ```

* Copy the dotenv file example to .env and edit information that needs to be changed (DB credentials, host ports, etc...)
```
cp .env.example .env
```

* Check if some values are in LastPass and replace them if needed

* Start the docker environment
```
cd tuningfork-env
docker-compose build && docker-compose up
```

* Once container are ready, run these commands to init your Laravel project
```
docker-compose exec php php artisan key:generate
docker-compose exec php php artisan jwt:secret
docker-compose exec php php artisan migrate
docker-compose exec php php artisan db:seed
```

* Start the Front-End app:
 ```
cd ../tuningfork-admin
yarn
yarn start
 ```

* Build and start your docker environment
```
cd tuningfork-env
docker-compose build && docker-compose up -d
```

You should be good to go. 
You can use kitematics to view containers logs, or use previous command without -d to see logs in your terminal.
To generate new resources, use the following commands:

```
cd ../cd tuningfork-env && docker-compose exec php php artisan make:api test && cd ..
cd ../cd tuningfork-env && docker-compose exec php php artisan make:admin test && cd ..
```

* A folder named `data` containing DB data will be created at the root of the core repo.
* A folder named `logs` contains logs from nginx server


### View data in MySQL

```
cd tuningfork-env
docker-compose exec mysql mysql -u default_user -p
```

Or simply open a mysql connection on localhost through port 3310
```
mysql -P <HOST_DB_PORT> -u default_user -p default_database
```
