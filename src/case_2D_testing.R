# define lat and lon
lon = 10:10
lat = 54:54

# sphere with radius and lon-center and lat-center
radius_grid_low = 7
radius_cell = 7.5
radius_grid_high = 8
clon =  7.0
clat = 47.1

## angles center
# 56, 65, 74
## angles bnds
# 51.5, 60.5, 69.5, 78.5

angle = 0:90
pi = 3.14
ulon_grid_low = radius_grid_low * cos(angle/180*pi) + clon
ulat_grid_low = radius_grid_low * sin(angle/180*pi) + clat
ulon_cell = radius_cell * cos(angle/180*pi) + clon
ulat_cell = radius_cell * sin(angle/180*pi) + clat
ulon_grid_high = radius_grid_high * cos(angle/180*pi) + clon
ulat_grid_high = radius_grid_high * sin(angle/180*pi) + clat


lon_bnds = (10:11) - 0.5
lat_bnds = (54:55) - 0.5

dlon_solid = 0.4
dlat_solid = 0.4
dlon_dot = 0.6
dlat_dot = 0.6
dlon_text1 = 0.3
dlat_text1 = 0.22
dlon_text2 = 1.1
dlat_text2 = 0.7
dlon_max = 2*dlon_text2 - dlon_dot
dlat_max = 2*dlat_text2 - dlat_dot

nlon = length(lon)
nlat = length(lat)


# colors
col_grid = 'coral1'
col_cell = 'limegreen'


# create base plot
plot(c(lon[1], lon[nlon]), c(lat[1], lat[nlat]),
     xlab = ' ', ylab = '',
     xlim = c(lon_bnds[1] - dlon_dot, lon_bnds[nlon+1] + dlon_max),
     ylim = c(lat_bnds[1] - dlat_dot, lat_bnds[nlat+1] + dlat_max),
     xaxt = 'n', yaxt = 'n',
     bty = 'n', type = 'n')
axis(1, at = c(0, 360))
axis(2, at = c(0, 360))
mtext('longitude', 1, line = +1.2, cex = 2)
mtext('-->  increasing  -->', 1, line = +3, cex = 1.3)
mtext('latitude', 2, line = 2.5, cex = 2)
mtext('-->  increasing  -->', 2, line = 0.8, cex = 1.3)


# add grid ----
# vertical lines, dotted
lines(rep(lon_bnds, each = 3), rep(c(lat_bnds[1] - dlat_dot, lat_bnds[nlat+1] + dlat_dot, NA), times = nlon+1), col = col_grid, lwd = 2, lty = 'dotted')
# horizontal lines, dotted
lines(rep(c(lon_bnds[1] - dlon_dot, lon_bnds[nlon+1] + dlon_dot, NA), times = nlat+1), rep(lat_bnds, each = 3), col = col_grid, lwd = 2, lty = 'dotted')

# vertical lines, solid
lines(rep(lon_bnds, each = 3), rep(c(lat_bnds[1] - dlat_solid, lat_bnds[nlat+1] + dlat_solid, NA), times = nlon+1), col = col_grid, lwd = 2)
# horizontal lines, solid
lines(rep(c(lon_bnds[1] - dlon_solid, lon_bnds[nlon+1] + dlon_solid, NA), times = nlat+1), rep(lat_bnds, each = 3), col = col_grid, lwd = 2)

# dots on grid intersection
points(rep(lon_bnds, each = nlat+1), rep(lat_bnds, times = nlon  +1), pch = 18, cex = 2, col = col_grid)

# lines through grid cell center
lines(c(lon[1], lon[1]), c(lat[1] - dlat_text1/2, lat[1] + dlat_text1/2), col = col_cell)
lines(c(lon[1] - dlon_text1/3, lon[1] + dlon_text1/3), c(lat[1], lat[1]), col = col_cell)

# dots in the grid cell center
points(rep(lon, each = nlat), rep(lat, times = nlon), pch = 18, cex = 2, col = col_cell)

points(ulon_grid_low, ulat_grid_low, col = 'blue')
points(ulon_cell, ulat_cell, col = 'blue')
points(ulon_grid_high, ulat_grid_high, col = 'blue')

# add text ----
# bnds
text(lon_bnds[1], lat_bnds[nlat+1] + dlat_text2, 'lon_bnds(i,1)', col = col_grid, cex = 1.5)
text(lon_bnds[2], lat_bnds[nlat+1] + dlat_text2, 'lon_bnds(i,2)', col = col_grid, cex = 1.5)
text(lon_bnds[nlon+1] + dlon_text2, lat_bnds[1], 'lon_bnds(i,1)', col = col_grid, cex = 1.5)
text(lon_bnds[nlon+1] + dlon_text2, lat_bnds[2], 'lon_bnds(i,2)', col = col_grid, cex = 1.5)
# grid cell center
text(lon[1], lat[1] - dlat_text1, 'lon(i)', col = col_cell, cex = 1.5)
text(lon[1] + dlon_text1, lat[1], 'lat(i)', col = col_cell, cex = 1.5)



