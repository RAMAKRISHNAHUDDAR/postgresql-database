-- ENUM types
CREATE TYPE user_role AS ENUM ('Manager', 'User');
CREATE TYPE task_status AS ENUM ('ToDo', 'InProgress', 'Done');
CREATE TYPE task_priority AS ENUM ('Low', 'Medium', 'High');



-- USERS
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY, 
    name VARCHAR(100) NOT NULL,
    email VARCHAR(250) UNIQUE NOT NULL, 
    password VARCHAR(50) NOT NULL CHECK (char_length(password) >= 8), 
    created_at DATE DEFAULT CURRENT_DATE
);

-- PROJECTS
CREATE TABLE projects (
    project_id SERIAL PRIMARY KEY, 
    name VARCHAR(150) NOT NULL,
    project_description TEXT, 
    manager_id INT NOT NULL REFERENCES users(user_id) ON DELETE CASCADE, 
    priority task_priority DEFAULT 'Medium',
    deadline DATE,
    created_at DATE DEFAULT CURRENT_DATE
);

-- PROJECT MEMBERS
CREATE TABLE project_members (
    project_mem_id SERIAL PRIMARY KEY, 
    project_id INT NOT NULL REFERENCES projects(project_id) ON DELETE CASCADE, 
    user_id INT NOT NULL REFERENCES users(user_id) ON DELETE CASCADE, 
    role user_role DEFAULT 'User',
    UNIQUE(project_id, user_id) -- avoid duplicates
);

-- TASKS
CREATE TABLE tasks (
    task_id SERIAL PRIMARY KEY, 
    project_id INT NOT NULL REFERENCES projects(project_id) ON DELETE CASCADE, 
    title VARCHAR(250) NOT NULL, 
    task_description TEXT, 
    assignee_id INT REFERENCES users(user_id) ON DELETE SET NULL, 
    deadline DATE,
    status task_status DEFAULT 'ToDo',
    priority task_priority DEFAULT 'Medium',
    created_at DATE DEFAULT CURRENT_DATE,
    updated_at DATE DEFAULT CURRENT_DATE
);

-- DISCUSSIONS
CREATE TABLE discussions (
    disc_id SERIAL PRIMARY KEY, 
    project_id INT NOT NULL REFERENCES projects(project_id) ON DELETE CASCADE, 
    user_id INT NOT NULL REFERENCES users(user_id) ON DELETE CASCADE, 
    message TEXT NOT NULL, 
    created_at DATE DEFAULT CURRENT_DATE
);

-- NOTIFICATIONS
CREATE TABLE notifications (
    not_id SERIAL PRIMARY KEY, 
    user_id INT NOT NULL REFERENCES users(user_id) ON DELETE CASCADE, 
    type VARCHAR(50) NOT NULL, -- e.g., "Deadline Alert", "Task Update"
    message VARCHAR(100) NOT NULL, -- in-built messages as per rules 
    is_read BOOLEAN DEFAULT FALSE,
    created_at DATE DEFAULT CURRENT_DATE
);

-- INDEXES (performance boost)
CREATE INDEX idx_tasks_project ON tasks(project_id);
CREATE INDEX idx_tasks_assignee ON tasks(assignee_id);
CREATE INDEX idx_discussions_project ON discussions(project_id);
CREATE INDEX idx_notifications_user ON notifications(user_id);