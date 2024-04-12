#include "array_helpers.h"

#include "weather_utils.h"

int lowest_historical_min_temp(WeatherTable a) {
  int min = a[0u][january][0u]._min_temp;

  for (unsigned int year = 0u; year < YEARS; year++) {
    for (month_t month = january; month <= december; month++) {
      for (unsigned int day = 0u; day < DAYS; day++) {
        if (a[year][month][day]._min_temp < min) {
          min = a[year][month][day]._min_temp;
        }
      }
    }
  }

  return min;
}

void higher_max_temp_annually(WeatherTable a, int a_min[]) {
  int min;

  for (unsigned int year = 0u; year < YEARS; year++) {
    min = a[year][january][0u]._min_temp;

    for (month_t month = january; month <= december; month++) {
      for (unsigned int day = 0u; day < DAYS; day++) {
        if (a[year][month][day]._min_temp < min) {
          min = a[year][month][day]._min_temp;
        }
      }
    }

    a_min[year] = min;
  }
}

void highest_monthly_amount_of_rainfall(WeatherTable a, month_t a_max[]) {
  unsigned int max_rainfall;
  month_t max_month_rainfall;

  for (unsigned int year = 0u; year < YEARS; year++) {
    max_month_rainfall = january;
    max_rainfall = a[year][max_month_rainfall][0u]._rainfall;

    for (month_t month = january; month <= december; month++) {
      for (unsigned int day = 0u; day < DAYS; day++) {
        if (max_rainfall < a[year][month][day]._rainfall) {
          max_rainfall = a[year][month][day]._rainfall;
          max_month_rainfall = month;
        }
      }
    }

    a_max[year] = max_month_rainfall;
  }
}