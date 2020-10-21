USE `dormitory`;

CREATE TABLE Employees (
  id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
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
  year INT,
  password VARCHAR(100),
  hometown VARCHAR(100),
  nationality VARCHAR(10),
  faculty VARCHAR(10),
  created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Building (
  name VARCHAR(10) NOT NULL PRIMARY KEY
);

CREATE TABLE Rooms (
  name VARCHAR(10) NOT NULL PRIMARY KEY,
  capacity INT,
  building_name VARCHAR(10),
  FOREIGN KEY (building_name) REFERENCES Building(name)
);

CREATE TABLE Semeters (
  name VARCHAR(100) NOT NULL PRIMARY KEY
);

CREATE TABLE RoomArrangements (
  id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
  semeter_name VARCHAR(100),
  student_id VARCHAR(10),
  room_name VARCHAR(10),
  assigned_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  assigned_employee INT,
  FOREIGN KEY (semeter_name) REFERENCES Semeters(name),
  FOREIGN KEY (student_id) REFERENCES Students(id),
  FOREIGN KEY (room_name) REFERENCES Rooms(name),
  FOREIGN KEY (assigned_employee) REFERENCES Employees(id)
);

CREATE TABLE Attendance (
  date DATE,
  status BOOLEAN,
  student_id VARCHAR(10) NOT NULL,
  FOREIGN KEY (student_id) REFERENCES Students(id)
);

CREATE TABLE Violations (
  id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
  message VARCHAR(100),
  student_id VARCHAR(10),
  semeter_name VARCHAR(100),
  employee_id INT,
  FOREIGN KEY (student_id) REFERENCES Students(id),
  FOREIGN KEY (semeter_name) REFERENCES Semeters(name),
  FOREIGN KEY (employee_id) REFERENCES Employees(id)
);

INSERT INTO `Employees` (`id`, `name`, `email`, `username`, `password`, `role`, `created_date`) VALUES (NULL, 'Bui Xuan Sang', 'xsang.bui@gmail.com', 'bxsang', 'e10adc3949ba59abbe56e057f20f883e', 'admin', current_timestamp());
INSERT INTO `Students` (`id`, `name`, `year`, `password`, `hometown`, `nationality`, `faculty`, `created_date`) VALUES ('51800918', 'Bui Xuan Sang', 2018, 'e10adc3949ba59abbe56e057f20f883e', 'Lam Dong', 'VN', 'CNTT', current_timestamp());
INSERT INTO `Semeters` (`name`) VALUES ('HK1 2020-2021'), ('HK2 2020-2021'); 
INSERT INTO `Building` (`name`) VALUES ('H'), ('I'), ('K'), ('L'); 
INSERT INTO `Rooms` (`name`, `capacity`, `building_name`) VALUES ('H.0100', '8', 'H'), ('I.0100', '8', 'I'), ('K.0100', '6', 'K'), ('L.0100', '6', 'L');
INSERT INTO `RoomArrangements` (`id`, `semeter_name`, `student_id`, `room_name`, `assigned_time`, `assigned_employee`) VALUES (NULL, 'HK1 2020-2021', '51800000', 'I.0100', current_timestamp(), '1');
INSERT INTO `Attendance` (`date`, `status`, `student_id`) VALUES ('2020-10-20', '1', '51800000');
INSERT INTO `Violations` (`id`, `message`, `student_id`, `semeter_name`, `employee_id`) VALUES (NULL, 'Khong truc phong', '51800000', 'HK1 2020-2021', '1');
