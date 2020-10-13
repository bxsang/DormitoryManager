USE `dormitory`;

CREATE TABLE Employees (
    id  INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    username VARCHAR(100),
    password VARCHAR(100),
    role VARCHAR(100),
    created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Students (
  id VARCHAR(10) NOT NULL PRIMARY KEY,
  name VARCHAR(100),
  password VARCHAR(100),
  hometown VARCHAR(100),
  nationality VARCHAR(10),
  faculty VARCHAR(10),
  created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO `Employees` (`id`, `name`, `email`, `username`, `password`, `role`, `created_date`) VALUES (NULL, 'Bui Xuan Sang', 'xsang.bui@gmail.com', 'bxsang', 'e10adc3949ba59abbe56e057f20f883e', 'admin', current_timestamp());
INSERT INTO `Students` (`id`, `name`, `password`, `hometown`, `nationality`, `faculty`, `created_date`) VALUES ('51800918', 'Bui Xuan Sang', 'e10adc3949ba59abbe56e057f20f883e', 'Lam Dong', 'VN', 'CNTT', current_timestamp());
