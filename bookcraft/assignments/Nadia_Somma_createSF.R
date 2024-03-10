


point = st_point( c(14.252605,40.848248) )
info=data.frame('Nadia', 'Somma', 'Liceo Classico Statale Vittorio Emanuele II', '2018')
geom=st_sfc(point, crs = 4326)
st_crs(geom)
SF=st_sf(info, geom)

SF

