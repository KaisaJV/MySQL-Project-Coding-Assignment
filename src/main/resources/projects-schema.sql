DROP TABLE if exists material;
DROP TABLE if exists step;
DROP TABLE if exists project_category;
DROP TABLE if exists category;
DROP TABLE if exists project;

CREATE TABLE project (
	project_id INT auto_increment not null primary key,		-- primary key
	project_name VARCHAR(128) NOT NULL,
	estimated_hours DECIMAL(7,2),
	actual_hours DECIMAL(7,2),
	difficulty INT,
	notes TEXT
);

CREATE TABLE category (
	category_id INT AUTO_INCREMENT NOT NULL primary key,	-- primary key
	category_name VARCHAR(128) NOT NULL
);

CREATE TABLE project_category (
	project_id INT NOT NULL,	-- foreign key, unique key with category_id
	category_id INT NOT NULL,	-- foreign key, unique key with project_id
	primary key (project_id, category_id),
	foreign key (category_id) 
		references category(category_id)
		ON DELETE CASCADE,
	foreign key (project_id) 
		references project(project_id)
		ON DELETE CASCADE
);

CREATE TABLE step (
	step_id INT AUTO_INCREMENT NOT NULL primary key,	-- primary key
	project_id INT NOT NULL,	-- foreign key
	step_text TEXT NOT NULL,
	step_order INT NOT NULL,
	foreign key (project_id)
		references project(project_id)
		ON DELETE CASCADE
);

CREATE TABLE material (
	material_id INT AUTO_INCREMENT NOT NULL primary key,	-- primary key
	project_id INT NOT NULL,	-- foreign key
	material_name VARCHAR(128) NOT NULL,
	num_required INT,
	cost DECIMAL(7,2),
	foreign key (project_id) 
		references project(project_id)
		ON DELETE CASCADE
);
