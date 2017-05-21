# Python compiler web service

Python compiler service is the part of Term project of Software Design and Developments course

## Requirements

- Docker (For Windows user are recommended using docker toolbox) or any webserver (Xampp, Xampp)
- PHP >= 5.6.4
- OpenSSL PHP Extension
- PDO PHP Extension
- Mbstring PHP Extension

## Getting up

##### Docker Users
1. Start database container at the beginning.
- `docker run --name database -e MYSQL_ROOT_PASSWORD=password -e TZ='Asia/Bangkok' -d mariadb`
2. Start phpMyadmin for database.
- `docker run --name myadmin -d --link database:db -p 8080:80 phpmyadmin/phpmyadmin`
3. Create database from phpMyadmin and import it.
- Access phpMyadmin [http://localhost:8080](http://localhost:8080) or [http://192.168.99.100:8080](http://192.168.99.100:8080)
4. Change directory to project source.
5. Build web-server image.
- `docker build -t compiler-img .`
6. Start php web-server.
- `docker run -p 80:80 -d -v  $(pwd):/var/www/html -it --name my-compiler compiler-img`
7. Run `composer update` in container (`docker exec -it my-compiler bash`).
8. Create `.env` file (can copy from `.env.example`) and config Database connection here.
9. Example SQL file for database at `/database/sql/` in code folder, can try to import it.

## Reference

- [https://github.com/Neungzad/SECU-API/](https://github.com/Neungzad/SECU-API/)
- [https://github.com/Neungzad/SECU-API/wiki](https://github.com/Neungzad/SECU-API/wiki)