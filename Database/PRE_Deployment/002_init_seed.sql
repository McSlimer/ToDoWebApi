USE ToDoDB;

-- Roles
INSERT IGNORE INTO Role (Id, Name) VALUES
  (1, 'Admin'),
  (2, 'User'),
  (3, 'Manager');

-- Priorities
INSERT IGNORE INTO Priority (Id, Name) VALUES
  (1, 'High'),
  (2, 'Medium'),
  (3, 'Low');

-- Statuses
INSERT IGNORE INTO Status (Id, Name) VALUES
  (1, 'Pending'),
  (2, 'In Progress'),
  (3, 'Completed'),
  (4, 'Cancelled');