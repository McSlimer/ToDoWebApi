USE ToDoDB;

-- Roles
INSERT INTO Role (Name) VALUES 
  ('Admin'),
  ('User');

-- Priorities
INSERT INTO Priority (Name) VALUES
  ('High'),
  ('Medium'),
  ('Low');

-- Statuses
INSERT INTO Status (Name) VALUES
  ('Pending'),
  ('In Progress'),
  ('Completed'),
  ('Cancelled');