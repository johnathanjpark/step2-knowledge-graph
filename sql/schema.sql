CREATE TABLE attempts (
    attempt_id SERIAL PRIMARY KEY,
    question_id TEXT,
    system TEXT,
    diagnosis TEXT,
    chosen_answer TEXT,
    correct BOOLEAN,
    error_type TEXT,
    missed_clue TEXT,
    attempt_date DATE
);