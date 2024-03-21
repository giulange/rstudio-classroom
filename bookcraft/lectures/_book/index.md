--- 
title: "A Minimal Set of Lectures Notes"
author: "Giuliano Langella"
date: "2024-03-20"
site: bookdown::bookdown_site
output: bookdown::bs4_book
#output: bookdown::gitbook
#documentclass: book
bibliography: [book.bib, packages.bib]
link-citations: yes
# url: your book url like https://bookdown.org/yihui/bookdown
# cover-image: path to the social sharing image like images/cover.jpg
description: |
  This is a minimal example of using the bookdown package to write a book.
  The HTML output format for this example is bookdown::bs4_book,
  set in the _output.yml file.
biblio-style: apalike
csl: chicago-fullnote-bibliography.csl
params:
  gevs_link_year: 2023
  gevs_link_degree: N08
  gevs_link_course: U3265
---

# About {-}

This is a _sample_ handbook written in **Markdown**.
You can find all the topics covered by the teacher during the lessons with appropriate insights.

## Geografia e Valutazione del Suolo (GeVS) 

This is the section dedicated to the course _Geografia e Valutazione del Suolo_ (U3265) in the master's degree in _SCIENZE FORESTALI ED AMBIENTALI_ (N08).

Course information are available at the [teacher's web page](https://www.docenti.unina.it/glangella/2023/N08/U3265).

### Obiettivi formativi
The course aims at providing students with advanced notions related to soil and its key properties, the analysis of the spatial variability of environmental information with particular emphasis to soil properties and characteristics, also by means of data manipulation to build models of spatial interpolation.

Further, it is provided students with the notions related to data retrieval (e.g. from database or from internet), geospatial data visualization and analysis, land evaluation.

### Risultati di apprendimenti attesi
The course provides students with knowledge of: spatial (and temporal) variability; pedometrics and quantitative approaches to soil (and environmental) spatial variability

The course delivers ability and tools needed to apply knowledge in retrieving and fusing data coming from different collection of observations and their armonization; producing high resolution data by means of low-cost, auxiliary and environmental covariates; analysing and modelling the geospatial variability of key crop/forestry features; digital mapping of variables belonging above all to weather, soil, crop and forestry conditions; land evaluation techniques; aggregation of the available information.

In addition, the student must be able to evaluate (above all the soil) spatial variability and their impact on decision making, state conditions and their spatial variability also using precision approaches (4.0 agriculture), data elaboration and mapping in open-source software (QGIS, RStudio)

### Materiale didattico
 - “Guida Pratica di Pedologia” di Curtaz et al. Agronomia-NAPEA_Manuale_pedologia.pdf [Parte A, B e C]
 - "Metodi di valutazione dei suoli e delle terre". MIPAF. Collana di metodi analitici per l’agricoltura. CRA – Istituto Sperimentale per lo Studio e la Difesa del Suolo. Firenze [ PDF ] – Capitoli: 1, 2, 3, 4, 5, 12, 29, 40, appendice
 - "Basi di Pedologia" [ WEB ] – Capitoli: 1, 2, 3, 5, [6], 9
 - “A framework for land evaluation”, FAO, [ WEB ]
 - “R Programming for Data Science” by Roger D. Peng [ WEB ] – Capitoli: 1, 2, 3, 4, 5, 6, 9, 10, 11
 - “Geocomputation with R” by Lovelace, Nowosad and Muenchow [ WEB ] – Capitoli: 1, 2, 3, 6, 7, [8]
 - R Cheat Sheets [ WEB ]
 - Lecture notes provided by the teacher during the course

### Modalità di svolgimento dell'insegnamento
#### Mode

 1. Lectures (see syllabus)
 2. Hands-on sessions

Teacher will use a) lectures per approx. 55% of the total hours, b) practical exercises with a computer (mainly with RStudio) to further elaborate on applied knowledge for approx. 40% of the total hours, c) seminars for approx. 5% of the total hours.

Teacher will organize with students a field excursion to refine the study of soils with a more geographical and territorial emphasis.

On teacher discretion, the data collected during field excursion might be used in the written exam.

#### Hands-on sessions

It is recommended the use of a personal computer.

Teacher assigns homework to facilitate the acquisition of technical and practical skills.

Teacher provides access to an RStudio Server instance which can be used by the student during the course by means of a web browser.

Student can install RStudio on their own laptop, but teacher advises to use the server instance provided (es. to avoid compatibility issues with R libraries).

### Verifica di apprendimento
The written exam will take place at the end of the course and its performance is binding to have access to the oral exam.

The final mark will be computed giving the following relative weights: 60% for written exam and 40% for oral exam.

## Digital Mapping, Geospatial Statistics & Decision Support
This is the section dedicated to the course _Digital Mapping, Geospatial Statistics & Decision Support_ (U2584) in the master's degree in _PRECISION LIVESTOCK FARMING_ (P36).

Course information are available at the [teacher's web page](https://www.docenti.unina.it/glangella/2023/P36/U2584).

### Prerequisiti
 - Basic notions related to statistics (position and dispersion indicators)
 - Computer science basics (software installation, spreadsheet software)
 - Install and open QGIS (the use of GIS software is optional)
 - Install and open RStudio (optional, teacher shares an RStudio Server instance)

### Obiettivi Formativi
The course aims at providing students with advanced notions related to soil and its key properties, the analysis of the spatial variability of environmental information with particular emphasis to soil properties and characteristics, also by means of data manipulation to build models of spatial interpolation.

Further, it is provided students with the notions related to data retrieval, geospatial visualization and analysis.

### Risultati di apprendimenti attesi

#### Conoscenza e capacità di comprensione
The course provides students with knowledge of: key soil physical and chemical characteristics; pedology, soil classification and spatial variability; pedometrics and quantitative approaches to soil spatial variability; land evaluation in the livestock farm management; spatial (and temporal) variability in the production process; decision support.

#### Capacità di applicare conoscenza e comprensione
The course delivers ability and tools needed to apply knowledge in retrieving and fusing data coming from different collection of observations; producing high resolution data by means of low-cost, auxiliary and environmental covariates; analysing and modelling the geospatial variability of key crop/livestock features; digital mapping of variables belonging above all to weather, soil, crop and livestock conditions; land evaluation techniques; aggregation of the available information to support management decisions.

In addition, the student must be able to evaluate (soil) spatial variability and their impact on farm management, farm state conditions and variability and their impact in the management process also using precision approaches, data elaboration and mapping in open-source software (QGIS, RStudio)

### Materiale didattico
 - “Principles and Practice of Soil Science: The Soil as a Natural Resource” by White, 4th Edition, LINK, ISBN: 978-0-632-06455-7. Chapters: 2, 3, 4, 14
 - “Soils: Basic Concepts and Future Challenges” by Certini & Scalenghe, LINK, ISBN: 9780511535802. Chapters: 8.
 - “Geocomputation with R” by Lovelace, Nowosad and Muenchow (https://r.geocompx.org)
 - “R Programming for Data Science” by Roger D. Peng [ https://bookdown.org/rdpeng/rprogdatascience/ ] – Chapters: 1, 2, 3, 4, 5, 6, 9, 10, 11
 - “A framework for land evaluation”, FAO, (http://www.fao.org/3/x5310e/x5310e00.htm) 
 - Lecture notes provided by the teacher during the course

### Modalità di svolgimento dell'insegnamento
Teacher will use a) lectures per approx. 45% of the total hours, b) practical exercises with a computer (mainly with RStudio) to further elaborate on applied knowledge for approx. 40% of the total hours, c) seminars for approx. 15% of the total hours.

Teacher will organize with students a field excursion to refine the study of soils with a more geographical and territorial emphasis.

On teacher discretion, the data collected during field excursion might be used in the written exam.

### Verifica di apprendimento
The written exam will take place at the end of the course and its performance is binding to have access to the oral exam.

The final mark will be computed giving the following relative weights: 60% for written exam and 40% for oral exam.


## General notes about the courses

The two courses are made combining frontal and integrative teaching.
Hands-on sessions in R / RStudio will be fostered to enhance both the comprehension and the technicalities of topics.



