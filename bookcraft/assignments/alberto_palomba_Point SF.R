# Point SF


point=st_point(c(14.381565875917675,40.77905981128135))


Name <- c("Alberto")
Surname <- c("Palomba")
SchoolName <- c("Liceo Scientifico Alfred Nobel")
GraduationDat <- c("2016")
info=data_frame(Name, Surname,SchoolName,GraduationDat)
class(info)

geom = st_sfc(point,crs=4326)
st_crs(geom)
SF1=st_sf(info,geom)

SF1

plot(SF)
