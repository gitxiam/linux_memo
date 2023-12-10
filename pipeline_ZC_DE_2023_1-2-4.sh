#!/bin/bash

#i just want start all containers in background and do not download local data in csv from Internet

#start local server
python3 -m http.server &

#start postgres db
#docker pull image/postgres:13
docker run -itd \
	-e POSTGRES_USER="root" \
	-e POSTGRES_PASSWORD="root" \
	-e POSTGRES_DB="ny_taxi" \
	-v $(pwd)/ny_taxi_postgres_data:/var/lib/postgresql/data \
	-p 5432:5432 \
	--network=pg-network \
	--name pg-database \
	postgres:13

#start pg admin with easy creds from pg-database
#docker pull image/pgadmin4
docker run -itd \
    -e PGADMIN_DEFAULT_EMAIL="admin@admin.com" \
    -e PGADMIN_DEFAULT_PASSWORD="root" \
    -p 8080:80 \
    --network=pg-network \
    --name pgadmin \
    dpage/pgadmin4

#start loading data in database
#data was cut by pandas:
# df = pd.read_csv('2021_Yellow_Taxi_Trip_Data_20231210.csv',nrows=2000000)
# df_cuted = df
# df_cuted.to_csv('taxi_cuted_2m.csv')

URL="http://$(ip -4 addr | grep '192' | grep -oP '(?<=inet\s)\d+(\.\d+){3}'):8000/taxi_cuted_2m.csv";
docker run -itd \
  --network=pg-network \
  --name taxi_ingest_load \
    taxi_ingest \
      --user=root \
      --password=root \
      --host=pg-database \
      --port=5432 \
      --db=ny_taxi \
      --table_name=ytx \
      --url=${URL}