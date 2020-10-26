DROP TABLE IF EXISTS role_users;
DROP TABLE IF EXISTS permission_roles;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS roles;
DROP TABLE IF EXISTS permissions;
DROP TABLE IF EXISTS oauth_client_details;
DROP TABLE IF EXISTS oauth_access_token;
DROP TABLE IF EXISTS oauth_refresh_token;

CREATE TABLE oauth_client_details
(
  client_id VARCHAR (255) NOT NULL PRIMARY KEY ,
  client_secret VARCHAR (255) NOT NULL,
  web_server_redirect_uri VARCHAR (2048) DEFAULT NULL,
  scope VARCHAR (255) DEFAULT NULL,
  access_token_validity int(11) DEFAULT NULL,
  refresh_token_validity int(11) DEFAULT NULL,
  resource_ids VARCHAR (1024) DEFAULT NULL,
  authorized_grant_types VARCHAR (1024) DEFAULT NULL,
  authorities VARCHAR (1024) DEFAULT NULL,
  additional_information VARCHAR (4096) DEFAULT NULL,
  autoapprove VARCHAR (255) DEFAULT NULL
);

CREATE TABLE oauth_access_token
(
  token_id VARCHAR(256),
  token  VARBINARY,
  authentication_id VARCHAR(256) PRIMARY KEY,
  user_name VARCHAR(256),
  client_id VARCHAR(256),
  authentication  VARBINARY,
  refresh_token VARCHAR(256)
);

CREATE TABLE oauth_refresh_token
(
  token_id VARCHAR(256),
  token  VARBINARY,
  authentication  VARBINARY
);

CREATE TABLE users
(
    id       INT AUTO_INCREMENT PRIMARY KEY,
    email    VARCHAR(250) NOT NULL,
    password VARCHAR(250) NOT NULL
);

CREATE TABLE roles
(
    id          INT AUTO_INCREMENT PRIMARY KEY,
    name        VARCHAR(250) NOT NULL,
    description VARCHAR(500) NULL,
    UNIQUE (name)
);

CREATE TABLE permissions
(
    id   INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(250) NOT NULL,
    UNIQUE (name)
);

CREATE TABLE permission_roles
(
    role_id       INT NOT NULL,
    permission_id INT NOT NULL,
    FOREIGN KEY (role_id) REFERENCES roles (id) ON DELETE CASCADE,
    FOREIGN KEY (permission_id) REFERENCES permissions (id) ON DELETE CASCADE
);

CREATE TABLE role_users
(
    role_id INT NOT NULL,
    user_id INT NOT NULL,
    FOREIGN KEY (role_id) REFERENCES roles (id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
);

INSERT INTO users (id, email, password)
VALUES (1, 'john@gmail.com','$2a$10$jbIi/RIYNm5xAW9M7IaE5.WPw6BZgD8wcpkZUg0jm8RHPtdfDcMgm'),
       (2, 'mike@gmail.com','$2a$10$jbIi/RIYNm5xAW9M7IaE5.WPw6BZgD8wcpkZUg0jm8RHPtdfDcMgm');

INSERT INTO roles (id, name, description)
VALUES (1, 'ROLE_ADMIN', 'School system administrator'),
       (2, 'ROLE_STUDENT', 'Student attending the school');

INSERT INTO permissions (id, name)
VALUES (1, 'course_create'),
       (2, 'course_read'),
       (3, 'course_update'),
       (4, 'course_delete'),
       (5, 'student_create'),
       (6, 'student_read'),
       (7, 'student_update'),
       (8, 'student_delete');

INSERT INTO permission_roles (role_id, permission_id)
VALUES (1, 1),
       (1, 2),
       (1, 3),
       (1, 4),
       (1, 5),
       (1, 6),
       (1, 8),
       (2, 2),
       (2, 6),
       (2, 7);

INSERT INTO role_users (role_id, user_id)
VALUES (1, 1),
       (2,2);

INSERT INTO oauth_client_details (client_id, client_secret, web_server_redirect_uri, scope, access_token_validity, refresh_token_validity, resource_ids, authorized_grant_types, additional_information)
VALUES ('mobile', '$2y$10$m58SCAKXTYrligwJa9oQu.vdcBQ8VQKLL/iRVqX4VWu1F3XcKzReq', 'http://localhost:8080/code', 'READ,WRITE', '3600', '10000', 'students,courses', 'authorization_code,password,refresh_token,implicit', '{}');

