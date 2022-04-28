# FinalPaperRepository

This repository can be found at https://github.com/OlaedoOkpareke/FinalPaperRepository.

First run the simulation file, this creates an imitation dataset that is similar to the one that will be used for analysis. Then run the rscript file, this cleans and modifies the dataset and loads the clean dataset into the Inputs Folder. Then run the bib file for references and citations, then run the rmd file.   

The repository is organised as follows:

1. The Outputs folder: 

The .bib file contains the citations website that the data is gotten from, the packages used for analysis, and the literature used in the report.

The rmd file contains the report on the decision to seek mental health care globally for 2020 based on status in different grouos, as well as the code used to create the report. This code was mainly used to create tables and graphs, as well as for training and testing. This rmd file also contains the datasheet for the original dataset, and to an extent the cleaned dataset. 

The pdf file contains the same report analysis but in pdf form, and without the code.

2. The Inputs folder:

The wgm_full_wave2_public_file_final (1)_csv.csv dataset is the original dataset gotten from the data source.

The datamod csv file contains the cleaned and modifed dataset; the main dataset used in the report. 


3. The Scripts folder:

The Scripts.R file contains the code for reading in the data, cleaning and modifying the variables, and saving the csv file. 

The 00-Simulation file contains the code used to create an imitation dataset using false data that looks similar to the actual dataset, used for analysis?


Abstract:

Mental Health care is fundamental to good quality of life, however for many people globally, it is deemed as unimportant or unattainable. Previous research has found that the choice to seek therapy is heavily related to income, gender, and personal views towards mental health, so we use data from the 2020 Wellcome Trust survey on Mental Health to analyze this. We use graphs and tables to evaluate the differences in mental health access for different groups, using R [@citeR] and other packages. We also predict the probability that a person belonging to certain groups seeks out professional care. We find that the personal income of an individual, relative wealth of the country, gender, and the presence of external support increase the likelihood that a person seeks mental health care. We also find that level of education, employment status and views on the validity of mental health science also affect this choice. This shows the elitism and privilege tied to mental health access, and explains why getting adequate care is not an option for many people. In order to increase the acceptance and availability of mental health treatments, it is important to identify and lessen the sources of these barriers.
