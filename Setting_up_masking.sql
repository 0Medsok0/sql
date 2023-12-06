-- Создаем таблицу 
CREATE TABLE users ( 
    id SERIAL PRIMARY KEY,
    login VARCHAR(100),
    salary NUMERIC,
    phone_number VARCHAR(15)
);
-- Вставляем данные
INSERT INTO users (login, salary, phone_number) VALUES ('SEMIONOV', 50000, '791101234567');
INSERT INTO users (login, salary, phone_number) VALUES ('DANILOV', 90000, '795301234567');
INSERT INTO users (login, salary, phone_number) VALUES ('ROMANOVA', 70000, '790401234567');

--Эти политики помогают контролировать доступ к данным в таблице, ограничивая тех, кто может извлекать из нее информацию, на основе их логинов и текущего пользователя. 
CREATE POLICY semionov_policy ON users FOR SELECT USING (login = 'SEMIONOV' AND current_user = 'semionov');
CREATE POLICY danilov_policy ON users FOR SELECT USING (login = 'DANILOV' AND current_user = 'danilov');


CREATE EXTENSION IF NOT EXISTS anon CASCADE;
SELECT anon.start_dynamic_masking();

SECURITY LABEL FOR anon ON ROLE semionov IS 'MASKED';
SECURITY LABEL FOR anon ON ROLE danilov IS 'MASKED';

SECURITY LABEL FOR anon ON COLUMN users.phone_number IS 'MASKED WITH FUNCTION anon.partial(phone,4,$$********$$,0)';
\c - danilov
SELECT * FROM skillbox_test;
\c - semionov
SELECT * FROM skillbox_test;

-- Эта строка кода устанавливает метку безопасности для столбца "телефон" в таблице "люди".
--Для маскировки телефонных номеров используется функция под названием "anon.partial". 
--В частности, там говорится, что первые четыре символа телефонного номера должны быть видны,
--а остальные следует заменить звездочками (*). 
-- Это метод защиты конфиденциальной информации, позволяющий при этом определенным частям данных оставаться видимыми.
