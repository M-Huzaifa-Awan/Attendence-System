-- Create the table
CREATE TABLE subjName (
    sem VARCHAR(1) NOT NULL,
    CODE VARCHAR(15) NOT NULL,
    NAME VARCHAR(255) NOT NULL
);

-- Insert data into the table
INSERT INTO subjName (sem, CODE, NAME) VALUES
('4', 'SE', 'Software Engineering'),
('4', 'WP', 'Web Programming'),
('4', 'Lab-Web Prog', 'Lab-Web Programming'),
('4', 'DM', 'Digital Marketing'),
('4', 'AOOP', 'Advance Object Oriented Programming'),
('4', 'Lab-AOOP', 'Lab-Advance Object Oriented Programming'),
('4', 'DE', 'Differential Equations'),
('4', 'DAA', 'Design & Analysis of Algorithmss');


SELECT * FROM subjName;

