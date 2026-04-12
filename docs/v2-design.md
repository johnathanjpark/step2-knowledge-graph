## Major redesign of the question intake process
It was taking too long to manually enter missed questions into Google Sheets.  Using UMLS nomenclature and keeping track of all unique entries was too time intensive for my needs.  There were many time intensive yet low yield fields that needed populating, such as subject, topic, etc.  High yield fields such as next_best_step were unwieldy because many questions were not formatted in a way where it mattered.

## Solution
For v2 I changed the intake process to utilize a standardized Google Forms document.  The document allows rapid selection of standardized responses ranging from QBANK source, error type, etc.  After two weeks of using the v2 form, I am already thinking that v3 will need expanded error types such as, missed_contraindication, missed_adverse_effect, and subtyles of diagnostic_error (many thinking type errors are currently being categorized here, it's a lack of specificity) and management_error types.  I may incorporate the more traditional KTPR groupings as well, as a management mistake could stem from for example, incomplete knowledge of management, or thinking about management in the wrong way, etc.

I also decided to scrap the creation of a full ontology because it was taking too much time.  For key nodes and edges I may reintroduce maybe one or two per question as a seperate process for the creation of Anki cards or such review material in v3.  The main thing is creating a method or organizing the information in my mind and study systems such that it is easily accessible, and robust.  I don't need to recreate an entire ontology.  In fact, this is sounding more like a logic tree: Disease {has syndrome} syndrome {has discriminator} discriminator {has next_best_step} next_best_step.

## Analysis
So far, after two weeks I've just been asking ChatGPT to analyze my misses until I have the time to write my own (or have it write) scripts.  So far my major error types are management and diagnostic gaps, K, T, and some P.

MISSES BY QUESTION TASK
(each █ ≈ 2 misses)

Management / Next step / Initial step / Best step     ████████████████████████████████████████
Diagnosis / Most likely diagnosis / Cause             ████████████
Pharmacotherapy / Treatment selection                 ██████████
Diagnostic study / Confirmatory / Evaluation          ████████
Interpretation / Explanation / Study design           ██
Adverse effect / Contraindication / Complication      █████
Ethics / Professional response / Systems              █████
Risk factor / Predisposition / Screening              ████

TASK × ERROR PATTERN

Management tasks
- mainly management_gap
- then missed_key_clue
- then anchored_too_early / missed_instability

Diagnosis tasks
- mainly diagnostic_confusion
- then did_not_recognize_pattern
- then changed_right_to_wrong

Pharmacotherapy tasks
- mainly management_gap
- then contraindication-style missed_key_clue
- then diagnostic_confusion

Diagnostic study / evaluation tasks
- mainly management_gap
- then misread_stem
- then diagnostic_confusion

LOW CONFIDENCE MISSES
= "I don't quite know this"

Most common forms:
████████████ Management gap
███████      Pattern miss
██████       Diagnostic confusion
███          Missed key clue

MEDIUM CONFIDENCE MISSES
= "I kind of know this, but not cleanly"

Most common forms:
██████████████ Management gap
█████████      Diagnostic confusion
██████         Missed key clue
█████          Pattern miss
██             Changed right to wrong / misread stem

HIGH CONFIDENCE MISSES
= "I was sure, and I was wrong"

Most common forms:
███████   Anchoring / premature closure
██████    Diagnostic confusion
█████     Missed key clue
████      Management gap
███       Pattern miss

MISSES BY SUBJECT MATTER / DISCIPLINE
(each █ ≈ 2 misses)

Medicine (IM-heavy, multisystem, heme/onc, ID, renal, pulm, cardio, endo)   █████████████████████████████████████
OB/GYN                                                                    ███████
Neurology / Psychiatry                                                    ███████
Dermatology                                                               ██████
Surgery / Trauma                                                          ██████
Pediatrics                                                                █████
MSK / Rheum                                                               █████
Ethics / Systems / Preventive / Stats                                     ████████

INTERNAL MEDICINE SUBCLUSTERS

Renal / nephrology           ███████████
Cardio / vascular            ██████████
Pulm / critical care         █████████
Endocrine / metabolic        ████████
Infectious disease           ███████
GI / hepatology              ██████
Heme / onc                   █████