create DATABASE BD;
use BD;

create table users(
	ID INT AUTO_INCREMENT PRIMARY KEY, 
    NOME varchar(90),
    EMAIL varchar(90)
);