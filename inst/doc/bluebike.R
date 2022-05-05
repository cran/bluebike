## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup, message = FALSE---------------------------------------------------
# needed packages in vignette
library(bluebike)
library(dplyr)
library(leaflet)

## ---- message=FALSE, warning=FALSE--------------------------------------------
library(bluebike)
library(dplyr)

## -----------------------------------------------------------------------------
jan2015 <- import_month_data(2015, 1)

## ----example, message=FALSE, warning=FALSE------------------------------------
stations <- trip_history_sample %>% 
  group_by(start_station_name) %>% 
  summarize(trips_from = n())
head(stations)

## -----------------------------------------------------------------------------
jan_distance <- jan2015 %>% 
  sample_n(1000) %>% 
  trip_distance()
mean_jan_distance <- mean(jan_distance$distance)

mean_jan_distance

## -----------------------------------------------------------------------------
top_5_station <- station_distance(-71.13, 42.36) %>%
  head(5)

top_5_station

## -----------------------------------------------------------------------------
library(leaflet)

BostonMap <- leaflet(data = station_data) %>% 
  addTiles() %>% 
  addCircleMarkers(lng = station_data$longitude, 
                   lat = station_data$latitude, 
                   radius = 0.1, 
                   color = "blue")

BostonMap

## -----------------------------------------------------------------------------
station_500 <- station_radius(-71.13, 42.36, r = 500)

station_500

