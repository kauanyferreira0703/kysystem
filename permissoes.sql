use kysystem;
select user(), current_user();

alter user 'root'@'localhost' identified by 'Camilas2.';
flush privileges;

select user, host
from mysql.user;
GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;

DROP DATABASE tabelas;