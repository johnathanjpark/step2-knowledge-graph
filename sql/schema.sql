CREATE TABLE nodes(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    node_type TEXT NOT NULL,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(name, node_type)
);

CREATE TABLE questions(
    id SERIAL PRIMARY KEY,
    date_completed DATE NOT NULL,
    source TEXT NOT NULL,
    source_qid TEXT NOT NULL,
    correct BOOLEAN,
    confidence TEXT,
    timed_out BOOLEAN,
    discipline TEXT,
    organ_system TEXT,
    entry_point TEXT,
    final_diagnosis TEXT,
    discriminating_clue TEXT,
    confirmatory_test TEXT,
    next_best_step TEXT,
    first_intervention TEXT,
    definitive_management TEXT,
    common_trap TEXT,
    error_type TEXT,
    error_note TEXT,
    educational_value INT,
    takeaway TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(source,source_qid)
);

CREATE TABLE edges(
    id SERIAL PRIMARY KEY,
    source_node_id INT NOT NULL REFERENCES nodes(id),
    relationshp_type TEXT NOT NULL,
    target_node_id INT NOT NULL REFERENCES nodes(id),
    weight INT DEFAULT 1,
    note TEXT,
    source_quetion_id INT REFERENCES questions(id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE question_nodes(
    id SERIAL PRIMARY KEY,
    question_id INT NOT NULL REFERENCES questions(id),
    note_id INT NOT NULL REFERENCES nodes(id),
    role TEXT NOT NULL,
    UNIQUE(question_id, note_id, role)
);