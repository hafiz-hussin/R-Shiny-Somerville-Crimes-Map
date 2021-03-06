library(shinydashboard)
library(leaflet)
library(leaflet.extras)

header <- dashboardHeader(
  title = "Somerville Crimes Rate"
)

body <- dashboardBody(
  fluidRow(
    column(width = 12,
           box(width = NULL,
               solidHeader = T,
               leafletOutput("crimeMap", height = 500))
    )
  )
)

sidebar <- dashboardSidebar(
  sidebarMenu(
    sliderInput("slider", "Year Input:", 2005, 2018, 1,
                animate = animationOptions(interval = 1500))
  )
)
dashboardPage(
  header,
  sidebar,
  body
)
