Codebook
==================================================================

Human Activity Recognition Using Smartphones Dataset
==================================================================
Version 1.0


**Activity** was transformed into a factor variable (levels walking, walking upstairs, walking downstair, sitting, standing, and laying).Some of the levels included a "_" and this was removed via substitution.

The **Features** text file provided labels for the columns, but these were altered as follows to provide descriptive labels:

1. Only alpha numeric characters were retained.
2. Capitalization and spacing was properly applied
3. The "f" and "t" prefixes were replaced with Frequency and Time, respectively
4. Abbreviated definiations were expanded
5. One feature was labeled "BodyBody", but this was edited to "Body" as it appeared to be an error within the **Features** text file.

The variable indicating whether the subject was doing the training or test data was dropped. 

Each row is an entry for the means of each of the features for each subject's activity. 