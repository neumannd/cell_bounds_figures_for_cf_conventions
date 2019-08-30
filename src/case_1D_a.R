# define lat and lon
lon = 10:10
lat = 54:54

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
col_grid_draw = '#38598CFF'
col_grid_text = '#440154FF'
col_cell_draw = '#8AD647FF'
col_cell_text = '#8AD647FF'


# write plot to file
png('pics/case_1D_a.png', width = 7, height = 5.2, units='in', res = 300)
# pdf('pics/case_1D_a.pdf', width = 7, height = 5.2, paper='special')
par(mar = c(4.5, 4.5, 1, 1))


# create base plot
plot(c(lon[1], lon[nlon]), c(lat[1], lat[nlat]),
     xlab = ' ', ylab = '',
     xlim = c(lon_bnds[1] - dlon_dot, lon_bnds[nlon+1] + dlon_max),
     ylim = c(lat_bnds[1] - dlat_dot, lat_bnds[nlat+1] + dlat_max),
     xaxt = 'n', yaxt = 'n',
     bty = 'n', type = 'n')
axis(1, at = c(0, 360), lwd = 2)
axis(2, at = c(0, 360), lwd = 2)
mtext('longitude', 1, line = +1.2, cex = 2)
mtext('-->  increasing  -->', 1, line = +3, cex = 1.3)
mtext('latitude', 2, line = 2.5, cex = 2)
mtext('-->  increasing  -->', 2, line = 0.8, cex = 1.3)


# add grid ----
# vertical lines, dotted
lines(rep(lon_bnds, each = 3), rep(c(lat_bnds[1] - dlat_dot, lat_bnds[nlat+1] + dlat_dot, NA), times = nlon+1), col = col_grid_draw, lwd = 2, lty = 'dotted')
# horizontal lines, dotted
lines(rep(c(lon_bnds[1] - dlon_dot, lon_bnds[nlon+1] + dlon_dot, NA), times = nlat+1), rep(lat_bnds, each = 3), col = col_grid_draw, lwd = 2, lty = 'dotted')

# vertical lines, solid
lines(rep(lon_bnds, each = 3), rep(c(lat_bnds[1] - dlat_solid, lat_bnds[nlat+1] + dlat_solid, NA), times = nlon+1), col = col_grid_draw, lwd = 2)
# horizontal lines, solid
lines(rep(c(lon_bnds[1] - dlon_solid, lon_bnds[nlon+1] + dlon_solid, NA), times = nlat+1), rep(lat_bnds, each = 3), col = col_grid_draw, lwd = 2)

# dots on grid intersection
points(rep(lon_bnds, each = nlat+1), rep(lat_bnds, times = nlon  +1), pch = 18, cex = 2, col = col_grid_draw)

# lines through grid cell center
lines(c(lon[1], lon[1]), c(lat[1] - dlat_text1/2, lat[1] + dlat_text1/2), col = col_cell_draw)
lines(c(lon[1] - dlon_text1/3, lon[1] + dlon_text1/3), c(lat[1], lat[1]), col = col_cell_draw)

# dots in the grid cell center
points(rep(lon, each = nlat), rep(lat, times = nlon), pch = 18, cex = 2, col = col_cell_draw)


# add text ----
# bnds
text(lon_bnds[1], lat_bnds[nlat+1] + dlat_text2, 'lon_bnds(i,0)', col = col_grid_text, cex = 1.5)
text(lon_bnds[2], lat_bnds[nlat+1] + dlat_text2, 'lon_bnds(i,1)', col = col_grid_text, cex = 1.5)
text(lon_bnds[nlon+1] + dlon_text2, lat_bnds[1], 'lat_bnds(i,0)', col = col_grid_text, cex = 1.5)
text(lon_bnds[nlon+1] + dlon_text2, lat_bnds[2], 'lat_bnds(i,1)', col = col_grid_text, cex = 1.5)
# grid cell center
text(lon[1], lat[1] - dlat_text1, 'lon(i)', col = col_cell_text, cex = 1.5)
text(lon[1] + dlon_text1, lat[1], 'lat(i)', col = col_cell_text, cex = 1.5)


# close picture output device
dev.off()

