-- Task:
-- 1)Создайте тестовую таблицу, назовите её user_test. Таблица должна содержать поля: «Идентификатор», «Логин», «Размер заработной платы», «Контактный номер телефона».
-- 2)Создайте тестовые учётные записи пользователей БД.
-- Для сотрудников отдела сбыта,для бухгалтерии
-- 3)Настройте правила RLS.
-- Для сотрудников отдела сбыта: видят только свои личные оклады (одну запись со своим логином).
-- Для сотрудника бухгалтерии: видит все данные.

-- Создаем таблицу 
CREATE TABLE user_test ( 
    id SERIAL PRIMARY KEY,
    login VARCHAR(100),
    salary NUMERIC,
    phone_number VARCHAR(15)
);
-- Вставляем данные
INSERT INTO user_test (login, salary, phone_number) VALUES ('SEMIONOV', 50000, '791101234567');
INSERT INTO user_test (login, salary, phone_number) VALUES ('DANILOV', 90000, '795301234567');
INSERT INTO user_test (login, salary, phone_number) VALUES ('ROMANOVA', 70000, '790401234567');

--Эти политики помогают контролировать доступ к данным в таблице, ограничивая тех, кто может извлекать из нее информацию, на основе их логинов.
CREATE POLICY semionov_policy ON user_test FOR SELECT USING (login = 'SEMIONOV'); --Первая политика называется "semionov_policy" и позволяет только пользователю с именем входа "SEMIONOV" выполнять операции выбора в таблице "skillbox_test".
CREATE POLICY danilov_policy ON user_test FOR SELECT USING (login = 'DANILOV'); --Вторая политика называется "danilov_policy" и позволяет только пользователю с логином "DANILOV" выполнять операции выбора в той же таблице "skillbox_test".
