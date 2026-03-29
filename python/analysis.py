import pandas as pd
from sqlalchemy import create_engine

DB_USER = "postgres"
DB_PASSWORD = "password"
DB_HOST = "localhost"
DB_PORT = "5432"
DB_NAME = "step2_knowledge_graph"

engine = create_engine(f"postgresql+psycopg2://{DB_USER}:{DB_PASSWORD}@{DB_HOST}:{DB_PORT}/{DB_NAME}")

#test connection
df = pd.read_sql("SELECT current_database();", engine)
print(df)

questions = pd.read_sql("SELECT * FROM intake_questions;", engine)
edges = pd.read_sql("SELECT * FROM question_edges;", engine)
nodes = pd.read_sql("SELECT * FROM ontology_nodes;", engine)

accuracy_by_system = (
    questions.groupby("organ_system")["correct"]
    .agg(total="count", accuracy="mean")
    .assign(accuracy_pct=lambda df: df["accuracy"] * 100)
    .sort_values("total", ascending=False)
)
print("/nAccuracy by organ system:")
print(accuracy_by_system)

error_distribution = (
    questions[questions["correct"] == False]["error_type"]
    .value_counts()
)
print("/nError type distribution:")
print(error_distribution)

high_confidence_misses = questions[
    (questions["correct"] == False) & (questions["confidence"] == "high")
]
print("/nHigh confidence misses:")
print(high_confidence_misses[["source_qid", "final_diagnosis", "error_type", "common_trap"]])

diagnosis_error = (
    questions[questions["correct"] == False]
    .groupby(["final_diagnosis", "error_type"])
    .size()
    .reset_index(name="count")
    .sort_values("count", ascending=False)
)
print("/nMost common misdiagnoses and error types:")
print(diagnosis_error)

edge_counts = edges["relationship_type"].value_counts()
print("/nEdge relationship type distribution:")
print(edge_counts)

diagnosis_connections = (
    edges[edges["target_type"] == "Disease"]
    .groupby("target_node")
    .size()
    .sort_values(ascending=False)
)
print("/nMost connected diagnoses:")
print(diagnosis_connections)