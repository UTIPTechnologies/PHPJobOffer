--
-- Отключение внешних ключей
-- 
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

-- 
-- Установка кодировки, с использованием которой клиент будет посылать запросы на сервер
--
SET NAMES 'utf8';

--
-- Описание для таблицы servers
--
DROP TABLE IF EXISTS servers;
CREATE TABLE servers (
  id int(11) NOT NULL AUTO_INCREMENT,
  name varchar(50) NOT NULL,
  server_type varchar(10) NOT NULL,
  settings text NOT NULL,
  PRIMARY KEY (id)
)
  ENGINE = INNODB
  AUTO_INCREMENT = 4
  AVG_ROW_LENGTH = 5461
  CHARACTER SET utf8
  COLLATE utf8_general_ci;

--
-- Описание для таблицы groups
--
DROP TABLE IF EXISTS groups;
CREATE TABLE groups (
  id int(11) NOT NULL AUTO_INCREMENT,
  name varchar(50) NOT NULL,
  server_id int(11) NOT NULL,
  PRIMARY KEY (id),
  INDEX IDX_groups_server_id (server_id),
  CONSTRAINT FK_groups_servers_id FOREIGN KEY (server_id)
  REFERENCES servers (id) ON DELETE CASCADE ON UPDATE CASCADE
)
  ENGINE = INNODB
  AUTO_INCREMENT = 5
  AVG_ROW_LENGTH = 4096
  CHARACTER SET utf8
  COLLATE utf8_general_ci;

--
-- Описание для таблицы accounts
--
DROP TABLE IF EXISTS accounts;
CREATE TABLE accounts (
  id int(11) NOT NULL AUTO_INCREMENT,
  server_account int(11) NOT NULL,
  group_id int(11) NOT NULL,
  PRIMARY KEY (id),
  INDEX IDX_accounts_group_id (group_id),
  CONSTRAINT FK_accounts_groups_id FOREIGN KEY (group_id)
  REFERENCES groups (id) ON DELETE CASCADE ON UPDATE CASCADE
)
  ENGINE = INNODB
  AUTO_INCREMENT = 12
  AVG_ROW_LENGTH = 1489
  CHARACTER SET utf8
  COLLATE utf8_general_ci;

-- 
-- Вывод данных для таблицы servers
--
INSERT INTO servers(id, name, server_type, settings) VALUES
(1, 'server1', 'type1', '{"host":"127.0.0.1","database":"database_name1","user":"user1","password":"password1"}'),
(2, 'server2', 'type1', '{"host":"192.168.0.1","database":"database_name2","user":"user2","password":"password2"}'),
(3, 'server3', 'type2', '{"host":"127.0.0.1","port":3344,"token":"abcdef"}');

-- 
-- Вывод данных для таблицы groups
--
INSERT INTO groups(id, name, server_id) VALUES
(1, 'group1', 1),
(2, 'group2', 1),
(3, 'group3', 2),
(4, 'group4', 3);

-- 
-- Вывод данных для таблицы accounts
--
INSERT INTO accounts(id, server_account, group_id) VALUES
(1, 100, 1),
(2, 101, 1),
(3, 102, 1),
(4, 103, 2),
(5, 104, 2),
(6, 105, 3),
(7, 106, 3),
(8, 107, 3),
(9, 108, 4),
(10, 109, 4),
(11, 110, 4);

-- 
-- Включение внешних ключей
-- 
/*!40014 SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS */;