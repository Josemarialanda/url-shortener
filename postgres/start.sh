alias psql='psql --host=$PWD'
pg_ctl -D db -l logfile -o "--unix_socket_directories='$PWD'" start