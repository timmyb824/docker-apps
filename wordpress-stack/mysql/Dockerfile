FROM mysql:latest

COPY my.cnf /etc/mysql/my.cnf

# once container is created a new user can only be created if the container and data is deleted first
# ADD ./scripts/add_user.sql /docker-entrypoint-initdb.d
