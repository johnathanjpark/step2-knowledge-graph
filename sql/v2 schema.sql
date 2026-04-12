-- =========================
-- STEP 2 V2 SCHEMA
-- =========================

begin;

-- 1. Create schema
create schema if not exists step2_v2;

-- =========================
-- 2. RAW TABLE (ingest layer)
-- =========================

create table if not exists step2_v2.intake_responses_raw (
    "Timestamp" text,
    "block date" text,
    "qbank" text,
    "timed block?" text,
    "QID" text,
    "how confident were you with the answer you selected?" text,
    "how many distractors did you correctly eliminate?" text,
    "did you get the correct answer?" text,
    "recreate the question task verbatim" text,
    "entry point" text,
    "key signals" text,
    "is the patient stable?" text,
    "what is the diagnosis?" text,
    "discriminating clue" text,
    "error type" text,
    "key takeaway" text,
    "picked response" text,
    "keyed response" text
);

-- =========================
-- 3. CLEAN TABLE (analysis layer)
-- =========================

create table if not exists step2_v2.intake_responses (
    response_id bigserial primary key,

    form_timestamp        timestamp,
    block_date            date,

    qbank                 text not null,
    source_qid            text not null,

    timed_block           boolean,
    confidence            text,
    distractors_eliminated text,
    got_correct           boolean,

    question_task         text,
    entry_point           text,
    key_signals           text,
    patient_stable        text,

    final_diagnosis       text,
    discriminating_clue   text,

    error_type            text,
    takeaway              text,

    picked_response       text,
    keyed_response        text,

    constraint chk_confidence
        check (confidence in ('low', 'medium', 'high') or confidence is null),

    constraint chk_distractors_eliminated
        check (
            distractors_eliminated in ('0', '1-2', '3-4', '5+')
            or distractors_eliminated is null
        ),

    constraint chk_patient_stable
        check (
            patient_stable in ('Yes', 'No', 'Unsure')
            or patient_stable is null
        )
);

-- =========================
-- 4. INDEXES
-- =========================

create index if not exists ix_intake_responses_block_date
    on step2_v2.intake_responses (block_date);

create index if not exists ix_intake_responses_qbank
    on step2_v2.intake_responses (qbank);

create index if not exists ix_intake_responses_error_type
    on step2_v2.intake_responses (error_type);

create index if not exists ix_intake_responses_final_diagnosis
    on step2_v2.intake_responses (final_diagnosis);

-- =========================
-- 5. ANALYSIS VIEW
-- =========================

create or replace view step2_v2.intake_analysis as
select *
from step2_v2.intake_responses;

commit;