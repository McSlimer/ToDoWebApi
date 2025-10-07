-- Select database
USE ToDoDB;

-- Role table
CREATE TABLE IF NOT EXISTS Role (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_Role_Name (Name)
);

-- User table
CREATE TABLE IF NOT EXISTS User (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(80) NOT NULL,
    Surname VARCHAR(80) NOT NULL,
    Email VARCHAR(80) NOT NULL UNIQUE,
    ProfilePicture VARCHAR(255),
    HashedPassword CHAR(255) NOT NULL,
    PasswordResetToken CHAR(255),
    LastLogin DATETIME,
    IsActive BOOLEAN DEFAULT TRUE,
    INDEX idx_User_Email (Email)
);

-- Permission table
CREATE TABLE IF NOT EXISTS Permission (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    UserId INT NOT NULL,
    GrantedBy INT,
    RoleId INT NOT NULL,
    GrantedDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (UserId) REFERENCES User(Id),
    FOREIGN KEY (GrantedBy) REFERENCES User(Id),
    FOREIGN KEY (RoleId) REFERENCES Role(Id)
);

-- Priority table
CREATE TABLE IF NOT EXISTS Priority (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    INDEX idx_Priority_Id (Id)
);

-- Status table
CREATE TABLE IF NOT EXISTS Status (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    INDEX idx_Status_Id (Id)
);

-- Label table
CREATE TABLE IF NOT EXISTS Label (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL
);

-- Task table
CREATE TABLE IF NOT EXISTS Task (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    UserId INT NOT NULL,
    PriorityId INT,
    StatusId INT,
    Title VARCHAR(255) NOT NULL,
    Description VARCHAR(255),
    DueDate DATETIME,
    UpdatedAt DATETIME,
    CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (UserId) REFERENCES User(Id),
    FOREIGN KEY (PriorityId) REFERENCES Priority(Id),
    FOREIGN KEY (StatusId) REFERENCES Status(Id),
    INDEX idx_Task_UserId (UserId),
    INDEX idx_Task_PriorityId (PriorityId),
    INDEX idx_Task_StatusId (StatusId),
    INDEX idx_Task_DueDate (DueDate),
    INDEX idx_Task_CreatedAt (CreatedAt)
);

-- Task-Label junction table (Many-to-Many)
CREATE TABLE IF NOT EXISTS TaskLabel (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    TaskId INT NOT NULL,
    LabelId INT NOT NULL,
    FOREIGN KEY (TaskId) REFERENCES Task(Id),
    FOREIGN KEY (LabelId) REFERENCES Label(Id)
);