# Exercises

## Vector Geodata

### Upper Secondary School
Create a Simple Feature object in R to manage and represent (the position and other attributes of) your upper secondary school.
Therefore, use Google Maps to get the coordinates of your school and populate the following attributes:

 - geometry: POINT XY (2D)
 - CRS: 4326 (as used in Google)
 - attributes:
   - 'Name'
   - 'Surname'
   - 'SchoolName'
   - 'GraduationDate'

**Note:** do not change the labels used for the attributes, including lowercase / uppercase characters.

<b><font color="green">Folder:</font></b> 'didattica/assignments/vector_ex01/' <br>
Deliver the file named `name_surname_school.geojson` in the folder 'didattica/assignments/vector_ex01/'. <br>
[E.g. giuliano_langella_school.geojson]

Once all students complete the previous step, in folder `vector_ex01` there will be more files.
Each student has to import 

### Agraria Teching Rooms
<b><font color="blue">Objective:</font></b> create a map with all Points of Interest (PoI) of the Dep. of Agriculture in Portici. <br>
<b><font color="green">Folder:</font></b> 'didattica/assignments/vector_ex02/' <br>
<b><font color="black">Source:</font></b> <a href="https://www.agraria.unina.it/strutture_didattiche/aule" target="_blank">Aule lezioni e aule studio</a> <br>
<br>
<b><font color="gray">Note:</font></b> do not change the labels used for the attributes, including lowercase / uppercase characters.


#### Instructions
 1. Each student select one or more PoIs within the Department (select different PoIs)
 2. Go to [geojson.io](https://geojson.io/) and draw a point on the map where you want to create a PoI
 3. Add the following attributes (take care of the UPPERCASE / lowercase letters):
    - 'Aula'         &rarr; e.g. 1
    - 'Ubicazione'   &rarr; e.g. Mascabruno
    - 'Piano'        &rarr; e.g. Terra
    - 'Posti'        &rarr; e.g. 200
    - 'Descrizione'. &rarr; e.g. TAL
 4. Export from [geojson.io](https://geojson.io/) using format GeoJSON.
 5. Load in RStudio Server file system
 6. Import in R as Simple Feature
 7. Create a plot / map to visualize the PoIs
 8. Export the simple feature using filename such as `name_surname_poistudent.geojson` (e.g. giuliano_langella_poistudent.geojson) in the shared folder 'didattica/assignments/vector_ex02/
 9. Wait that all students save their file
 10. Load in R all the files and create a unique SF object in R fusing all the PoIs from all students
 11. Save the SF object with all PoIs as `name_surname_poiagraria.geojson` (e.g. giuliano_langella_poiagraria.geojson)


