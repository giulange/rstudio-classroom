require(sf)   #RICHIAMO IL PACCHETTO SF

point <-st_point(c(coords=40.895748, 14.605672)) #CREO LA GEOMETRIA PUNTO

st_crs(point) #DEFINISCO L'EPSG
Point_wgs <- st_sfc(point, crs = 4326)

#DEFINISCO GLI ATTRIBUTI
attribute<-data.frame(Name="Antonio", Surname="Manzi", SchoolName="Nicola Pecorelli", GraduationDate="2011")

SF2 <-st_sf(attribute,Point_wgs)
plot (SF2)

tmap_mode("view")
tm_shape(SF2) + 
  tm_dots()

 