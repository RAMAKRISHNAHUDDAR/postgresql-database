INSERT INTO users (name, email, password, created_at)
VALUES 
('Alice Johnson', 'alice@example.com', 'pass12333', '2025-09-01'),
('Bob Smith', 'bob@example.com', 'pass456333', '2025-09-02'),
('Charlie Brown', 'charlie@example.com', 'pass722289', '2025-09-03'),
('Diana Prince', 'diana@example.com', 'wonder12223', '2025-09-04'),
('Ethan Hunt', 'ethan@example.com', 'imf002227', '2025-09-05');

INSERT INTO projects (name, project_description, manager_id, priority, deadline, created_at)
VALUES
('Hackathon Platform', 'A platform to manage hackathon projects.', 1, 'High', '2025-09-15', '2025-09-01'),
('Task Tracker', 'A task tracking tool for teams.', 2, 'Medium', '2025-09-20', '2025-09-02');

INSERT INTO project_members (project_id, user_id, role)
VALUES
(1, 1, 'Manager'),  -- Alice manages Hackathon Platform
(1, 2, 'User'),
(1, 3, 'User'),
(2, 2, 'Manager'),  -- Bob manages Task Tracker
(2, 4, 'User'),
(2, 5, 'User'),
(2, 3, 'User');     -- Charlie also in Task Tracker


INSERT INTO tasks (project_id, title, task_description, assignee_id, deadline, status, priority, created_at, updated_at)
VALUES
(1, 'Setup Database', 'Design and create the database schema.', 1, '2025-09-07', 'Done', 'High', '2025-09-01', '2025-09-07'),
(1, 'Build API', 'Develop REST APIs for project management.', 2, '2025-09-10', 'InProgress', 'High', '2025-09-02', '2025-09-06'),
(1, 'Frontend UI', 'Create frontend using React.', 3, '2025-09-12', 'ToDo', 'Medium', '2025-09-03', '2025-09-03'),
(1, 'Final Presentation', 'Prepare hackathon presentation slides.', 3, '2025-09-15', 'ToDo', 'Medium', '2025-09-05', '2025-09-05'),
(2, 'Setup Authentication', 'Implement login and registration system.', 2, '2025-09-09', 'InProgress', 'High', '2025-09-02', '2025-09-06'),
(2, 'Task Board UI', 'Design Kanban-style board for tasks.', 4, '2025-09-13', 'ToDo', 'Medium', '2025-09-04', '2025-09-04'),
(2, 'Notifications System', 'Implement user notifications.', 5, '2025-09-11', 'ToDo', 'Low', '2025-09-05', '2025-09-05'),
(2, 'Testing & Debugging', 'Test the application before demo.', 4, '2025-09-14', 'ToDo', 'High', '2025-09-05', '2025-09-05');


INSERT INTO discussions (project_id, user_id, message, created_at)
VALUES
(1, 2, 'I will start working on the API today.', '2025-09-02'),
(1, 3, 'Frontend design ideas ready, will share soon.', '2025-09-03'),
(2, 4, 'Started working on Task Board UI.', '2025-09-04'),
(2, 5, 'Notifications module will need WebSocket integration.', '2025-09-05'),
(2, 3, 'I can help with debugging tasks later.', '2025-09-05');

INSERT INTO notifications (user_id, type, message, is_read, created_at)
VALUES
(1, 'Task Update', 'Your task "Setup Database" has been marked as Done.', FALSE, '2025-09-07'),
(2, 'Deadline Alert', 'Task "Build API" is due soon.', FALSE, '2025-09-06'),
(3, 'New Task Assigned', 'You have been assigned "Frontend UI".', FALSE, '2025-09-03'),
(4, 'Deadline Alert', 'Task "Task Board UI" is approaching.', FALSE, '2025-09-04'),
(5, 'New Task Assigned', 'You have been assigned "Notifications System".', FALSE, '2025-09-05'),
(2, 'Reminder', 'Project "Task Tracker" deadline is approaching.', FALSE, '2025-09-05'),
(1, 'Reminder', 'Project "Hackathon Platform" deadline is approaching.', FALSE, '2025-09-05');


