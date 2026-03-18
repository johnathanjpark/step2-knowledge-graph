# Methodology

## Purpose
This project tracks missed or difficult Step 2 questions in a structured way in order to identify knowledge gaps, reasoning errors, and recurring diagnostic confusion patterns.

## Intake Layer
Questions are initially logged in spreadsheet form and exported as CSV.

## Initial Variables
- date
- question_id
- source
- system
- diagnosis
- chosen_answer
- correct
- error_type
- missed_clue

## Planned Stack
- Spreadsheet for intake
- PostgreSQL for structured storage
- Pandas for analysis
- Neo4j for relationship mapping