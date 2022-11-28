initdb -D db
pg_ctl -D db -l logfile -o "--unix_socket_directories='$PWD'" start
createdb --host=$PWD db
alias psql='psql --host=$PWD'