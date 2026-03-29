-- Active: 1771780791951@@127.0.0.1@5432@step2_knowledge_graph@public
-- Active: 1771780791951@@127.0.0.1@5432@step2_knowledge_graph0791951@@127.0.0.1@5432@step2_knowledge_graph
-- step2kg schema
-- built from:
-- Intake spreadsheet:
--   Questions sheet
--   Edges sheet
-- Ontology spreadsheet:
--   nodes sheet

DROP TABLE IF EXISTS intake_questions;
DROP TABLE IF EXISTS question_edges;
DROP TABLE IF EXISTS ontology_nodes;

CREATE TABLE intake_questions (
    date_completed date,
    source text,
    source_qid text PRIMARY KEY,
    correct boolean,
    confidence text,
    timed text,
    discipline text,
    organ_system text,
    entry_point text,
    final_diagnosis text,
    discriminating_clue text,
    confirmatory_test text,
    next_best_step text,
    first_intervention text,
    definitive_management text,
    common_trap text,
    error_type text,
    error_note text,
    educational_value integer,
    takeaway text
);

CREATE TABLE question_edges (
    source_node text,
    source_type text,
    relationship_type text,
    target_node text,
    target_type text,
    weight integer,
    note text,
    source_qid text
);

CREATE TABLE ontology_nodes (
    umls_cui text,
    node_name text PRIMARY KEY,
    node_type text,
    synonyms text
);

-- optional quality constraints
ALTER TABLE intake_questions
ADD CONSTRAINT chk_confidence
CHECK (confidence IN ('low', 'medium', 'high') OR confidence IS NULL);

ALTER TABLE intake_questions
ADD CONSTRAINT chk_correct
CHECK (correct IN (true, false) OR correct IS NULL);

ALTER TABLE intake_questions
ADD CONSTRAINT chk_educational_value
CHECK (educational_value IN (1, 2, 3) OR educational_value IS NULL);

ALTER TABLE question_edges
ADD CONSTRAINT chk_weight
CHECK (weight IN (1, 2, 3) OR weight IS NULL);

-- optional indexes
CREATE INDEX idx_intake_questions_source ON intake_questions(source);
CREATE INDEX idx_intake_questions_discipline ON intake_questions(discipline);
CREATE INDEX idx_intake_questions_organ_system ON intake_questions(organ_system);
CREATE INDEX idx_intake_questions_final_diagnosis ON intake_questions(final_diagnosis);
CREATE INDEX idx_intake_questions_error_type ON intake_questions(error_type);

CREATE INDEX idx_question_edges_source_node ON question_edges(source_node);
CREATE INDEX idx_question_edges_target_node ON question_edges(target_node);
CREATE INDEX idx_question_edges_relationship_type ON question_edges(relationship_type);
CREATE INDEX idx_question_edges_source_qid ON question_edges(source_qid);

CREATE INDEX idx_ontology_nodes_node_type ON ontology_nodes(node_type);