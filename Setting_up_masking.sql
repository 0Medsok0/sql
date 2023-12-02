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



-- Настрииваем правила маскирования на таблицу user_test так, чтобы сотрудникам отдела сбыта в поле «Телефон» показывались бы только четыре символа слева, остальные символы выводились бы символом «*», сотрудники бухгалтерии должны видеть данные без маскирования (без назначения роли superuser).

-- Подключение расширения PostgreSQL Anonymizer
CREATE EXTENSION IF NOT EXISTS anonymizer;

-- Настройка правил маскирования на таблицу user_test
ALTER TABLE user_test 
    ALTER COLUMN phone_number TYPE VARCHAR(15) USING 
        CASE WHEN current_user = 'sales_department' THEN SUBSTRING(phone_number FROM 1 FOR 4) || repeat('*', length(phone_number)-4)
        ELSE phone_number END;

-- Будем считать,что есть группа sales_department в которой состоят сотрудники отдела сбыта,  если это так,
--то он возьмет первые 4 символа телефонного номера с помощью функции подстроки и объединит их со строкой звездочек, сгенерированной функцией повтора, которая заменяет остальные символы в телефонном номере
