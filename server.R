library(shinydashboard)
library(leaflet)
library(leaflet.extras)
library(dplyr)

# data --------------------------------------------------------------------

function(input, output, session) {
  
  output$crimeMap <- renderLeaflet({
    year_selected <- input$slider
    df <- read.csv("map_data.csv")
    freq_table <- df %>% 
      select(X, Y, year) %>%
      filter(year == year_selected) %>% 
      group_by(X, Y) %>% 
      summarise(Total = n())
    
    map <- leaflet(freq_table) %>% 
      addTiles(
        urlTemplate = "//{s}.tiles.mapbox.com/v3/jcheng.map-5ebohr46/{z}/{x}/{y}.png",
        attribution = 'Maps by <a href="http://www.mapbox.com/">Mapbox</a>'
      ) %>% 
      addHeatmap(lng = ~X, lat = ~Y, radius = 8) %>% 
      setView(lng = -71.10, lat = 42.39, zoom = 13)
    map
  })
}