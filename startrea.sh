docker run -it -p 80:8000 --link rea-db:db -e ADMIN_PASS=nimda -e DB_HOST=db -e DB_NAME=rea_database -e DB_PORT=5432 -e DB_USER=rea_user -e DB_PASS=rea_pass -e DEBUG=true xtremxpert/docker-carra
