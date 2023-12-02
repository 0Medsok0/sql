create database  Database_Practice; -- создаем базу данных Database_Practice
\c Database_Practice; -- выбираем базу данных Database_Practice

-- Создаем таблицу Skillbox 
CREATE TABLE Skillbox (
    id SERIAL PRIMARY KEY,
    text_value TEXT
);

-- Вставляем значения
INSERT INTO Skillbox (text_value) VALUES ('First text');
INSERT INTO Skillbox (text_value) VALUES ('Second text');
INSERT INTO Skillbox (text_value) VALUES ('Third text');

-- Записываем в файл DDl DML команды
$sudo -u postgres pg_dump  database_practice > data.sql
cat data.sql

-- Делаем экспорт 
$sudo -u postgres psql -W imp < data.sql 
$sudo -u postgres psql -- входим в бд
  \c imp;
select * from Skillbox; -- провряем что таблица Skillbox создалась;

-- Сохраняем pg_dump команды(при наличии того,что,таблица Skillbox еще не создана)
$sudo -u postgres psql -W imp < data.sql > commands.txt
cat commands.txt
