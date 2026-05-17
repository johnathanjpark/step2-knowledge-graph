## Continued refinement of intake process and paring away of friction points
V2 was an improvement over v1 because it significantly reduced entry time while still ingesting most of the relevant error data.  V2 removed explicit ontology node and edge creation while still preserving the data required to create them at a later time.  Analysis of V2 data, whether by SQL/python scripting or by using ChatGPT generated interesting results.

My mistake patterns are typical of a student who has not yet begun clinical rotations.  Most of the mistakes involve management gaps or diagnostic confusion.  A detailed breakdown may be viewed in the v2 design document on github.

The goals of v3 are to refine the intake form to utilize specifically AMBOSS and UWORLD question formats and to implement a standardized method for continuing review (ideally spaced repetition) of node/edge relationships from missed questions.

The first goal includes expanding error types to include KTPR categorization.  Some fields that seemed useful at the outset but proved to be less diagnostically relevant were removed.  One key addition is a question’s estimated IRT a and b values.

The second goal acts as a bridge between this project and ensuring concepts are consolidated into long term memory.  The workflow will be: intake -> generation of key node/edges -> generation of Anki cards.  What is meant by node/edges is to structure the learning points from a given question in an ontological framework that will be represented in Anki card format.  The objective is to consolidate relationships not mere knowledge.  The tradeoff here is that while concepts can be adequately represented on Anki, it is not possible to traverse the ontology.  However, if graph traversal is desirable or needed at a later time, perhaps when thousands of questions have been completed, we can construct one from question data.

Nonetheless, an ontological representation of clinical medicine provides a robust framework for learners going through the clinical years and beyond.  Additionally, active development using Postgres and Python will take a back seat moving forward as question throughput is prioritized.  Analysis of question take using ChatGPT has proven sufficient at this point to direct strategy.
