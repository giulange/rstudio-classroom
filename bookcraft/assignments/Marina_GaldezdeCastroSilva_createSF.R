# Questo programma crea un oggetto Simple Feature che permette di rappresentare la mia scuola

# L'oggetto simple feature ha le seguenti caratteristiche:
  # geometria: PUNTO 2D
  # crs: 4326 (la posizione del punto da Google è: -22.919314293983728, -43.21118938733662)
  # attributi: 'Name', 'Surname', 'SchoolName', 'GraduationDate'

point = st_point(c(-43.21118938733662,-22.919314293983728))
geom = st_sfc(point, crs=4326)
attrib = data.frame(
  Name = "Marina",
  Surname = "GaldezdeCastroSilva",
  SchoolName = "CApUERJ",
  GraduationDate = as.Date("10/12/16")
)

SF6 = st_sf(attrib, geometry=geom)

View(SF)
