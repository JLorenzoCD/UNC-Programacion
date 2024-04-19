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

void higher_max_temp_annually(WeatherTable a, int a_max[]) {
  int max;

  for (unsigned int year = 0u; year < YEARS; year++) {
    max = a[year][january][0u]._max_temp;

    for (month_t month = january; month <= december; month++) {
      for (unsigned int day = 0u; day < DAYS; day++) {
        if (max < a[year][month][day]._max_temp) {
          max = a[year][month][day]._max_temp;
        }
      }
    }

    a_max[year] = max;
  }
}

void highest_monthly_amount_of_rainfall(WeatherTable a, month_t a_max[]) {
  unsigned int max_rainfall;
  month_t max_month_rainfall;

  unsigned int sum;

  for (unsigned int year = 0u; year < YEARS; year++) {
    max_month_rainfall = january;
    max_rainfall = a[year][max_month_rainfall][0u]._rainfall;

    for (month_t month = january; month <= december; month++) {
      sum = 0u;

      for (unsigned int day = 0u; day < DAYS; day++) {
        sum += a[year][month][day]._rainfall;
      }

      if (max_rainfall < sum) {
        max_rainfall = sum;
        max_month_rainfall = month;
      }
    }

    a_max[year] = max_month_rainfall;
  }
}