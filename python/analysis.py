import pandas as pd

df = pd.read_csv("logs/question_log_template.csv")

print("Total questions:", len(df))
print("Accuracy:", df["correct"].mean())

print("\nErrors:")
print(df["error_type"].value_counts())