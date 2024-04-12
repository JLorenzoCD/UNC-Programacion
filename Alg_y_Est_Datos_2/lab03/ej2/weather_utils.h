#ifndef _WEATHER_UTILS_H
#define _WEATHER_UTILS_H

#include "array_helpers.h"
#include "weather.h"

int lowest_historical_min_temp(WeatherTable a);

void higher_max_temp_annually(WeatherTable a, int a_min[]);

void highest_monthly_amount_of_rainfall(WeatherTable a, month_t a_max[]);

#endif