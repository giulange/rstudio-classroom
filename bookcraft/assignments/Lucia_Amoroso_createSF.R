# Creare un oggetto Simple Feature che permetta di rappresentare la vostra scuola 
# (superiori, medie, ...).
# L'oggetto simple feature dovrà avere le seguenti caratteristiche:

# geometria: PUNTO 2D
# crs: 4326 (prendere la posizione del punto da Google)
# attributi: 'Name', 'Surname', 'SchoolName', 'GraduationDate'
# NOTA: non cambiare le etichette degli attributi, incluso minuscole / maiuscole

# Consegnare lo script (denominarlo "nome_cognome_createSF.R") entro 
# domenica 27-Mar-2022 su Teams, nella cartella Assignments / create_SF

# Buon Lavoro!

point=st_point(c(15.560200106705251,41.44259657866147))
info=data.frame("Lucia","Amoroso","Liceo Scientifico Statale Guglielmo Marconi","2015")

info=data.frame( Name="Lucia",
                 Surname="Amoroso",
                 SchoolName="Liceo Scientifico Statale Guglielmo Marconi",
                 GraduationDate = "2015")

geom=st_sfc(point, crs=4326)
st_crs(geom)
sf5=st_sf(info,geom)
sf5
