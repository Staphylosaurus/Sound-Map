library(leaflet)
library(htmlwidgets) # saveWidget



dat <- read.csv2("soundmap.csv", fileEncoding="UTF-8-BOM")
dat$lat <- as.numeric(dat$lat)
dat$long <- as.numeric(dat$long)



# icons <- awesomeIcons(
#   icon = 'tree-conifer',
#   iconColor = 'black',
#   library = 'glyphicon',
#   markerColor = c("red", "orange", "beige", "green", "blue", "purple", "white", "gray", "pink", "lightgray", "black", "darkred", "lightred", "darkgreen", "lightgreen", "darkblue", "lightblue", "darkpurple", "cadetblue")[dat$Kategorie %>% factor]
# )



(m <- leaflet() %>%
  addTiles() %>%
  addAwesomeMarkers(lat=dat$lat, lng=dat$long, popup=
    paste0(
      dat$Kategorie, 
      "<h3>", dat$Titel, "</h3>", 
      "<p>", dat$Text, "</p>",
      dat$Link), 
    # icon=icons, 
    clusterOptions = markerClusterOptions()))



saveWidget(m, file="soundmap.html", title="Chabacha's Soundmap")
