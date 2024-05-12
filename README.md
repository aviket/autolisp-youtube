## Hands on practice video 2

This AutoLISP function, named `FEATURESELECT`, performs the following tasks in an AutoCAD environment:

1. **User Selection:** Prompts the user to select a set of features within the AutoCAD drawing.
2. **Feature Identification:** Iterates through the selected features, identifying and counting each type of feature:
    - Lines
    - Polylines
    - Circles
    - Points
3. **Feedback:** Prints a summary to the command line, displaying the total count for each feature type found in the selection. If no features were selected, it prints a message indicating so.

**Purpose:** The function serves to automate the process of analyzing a selection of features in an AutoCAD drawing. It can be a useful tool for quickly assessing the composition of a drawing or for gathering statistics on specific feature types.
