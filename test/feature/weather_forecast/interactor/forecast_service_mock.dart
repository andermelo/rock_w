String forecastResponseMock = '''
{
    "cod": "200",
    "message": 0,
    "cnt": 40,
    "list": [
        {
            "dt": 1699488000,
            "main": {
                "temp": 300.13,
                "feels_like": 300.26,
                "temp_min": 298.44,
                "temp_max": 300.13,
                "pressure": 1020,
                "sea_level": 1020,
                "grnd_level": 929,
                "humidity": 45,
                "temp_kf": 1.69
            },
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01n"
                }
            ],
            "clouds": {
                "all": 0
            },
            "wind": {
                "speed": 1.64,
                "deg": 81,
                "gust": 2.71
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "n"
            },
            "dt_txt": "2023-11-09 00:00:00"
        },
        {
            "dt": 1699498800,
            "main": {
                "temp": 298.84,
                "feels_like": 298.69,
                "temp_min": 296.27,
                "temp_max": 298.84,
                "pressure": 1018,
                "sea_level": 1018,
                "grnd_level": 928,
                "humidity": 47,
                "temp_kf": 2.57
            },
            "weather": [
                {
                    "id": 802,
                    "main": "Clouds",
                    "description": "scattered clouds",
                    "icon": "03n"
                }
            ],
            "clouds": {
                "all": 25
            },
            "wind": {
                "speed": 1.89,
                "deg": 52,
                "gust": 2.86
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "n"
            },
            "dt_txt": "2023-11-09 03:00:00"
        },
        {
            "dt": 1699509600,
            "main": {
                "temp": 296.4,
                "feels_like": 296.11,
                "temp_min": 294.53,
                "temp_max": 296.4,
                "pressure": 1015,
                "sea_level": 1015,
                "grnd_level": 927,
                "humidity": 51,
                "temp_kf": 1.87
            },
            "weather": [
                {
                    "id": 803,
                    "main": "Clouds",
                    "description": "broken clouds",
                    "icon": "04n"
                }
            ],
            "clouds": {
                "all": 54
            },
            "wind": {
                "speed": 1.89,
                "deg": 22,
                "gust": 3.01
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "n"
            },
            "dt_txt": "2023-11-09 06:00:00"
        },
        {
            "dt": 1699520400,
            "main": {
                "temp": 294.35,
                "feels_like": 293.81,
                "temp_min": 294.35,
                "temp_max": 294.35,
                "pressure": 1013,
                "sea_level": 1013,
                "grnd_level": 928,
                "humidity": 49,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 803,
                    "main": "Clouds",
                    "description": "broken clouds",
                    "icon": "04d"
                }
            ],
            "clouds": {
                "all": 58
            },
            "wind": {
                "speed": 1.76,
                "deg": 2,
                "gust": 2.54
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2023-11-09 09:00:00"
        },
        {
            "dt": 1699531200,
            "main": {
                "temp": 302.64,
                "feels_like": 301.27,
                "temp_min": 302.64,
                "temp_max": 302.64,
                "pressure": 1013,
                "sea_level": 1013,
                "grnd_level": 929,
                "humidity": 27,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 802,
                    "main": "Clouds",
                    "description": "scattered clouds",
                    "icon": "03d"
                }
            ],
            "clouds": {
                "all": 36
            },
            "wind": {
                "speed": 3.25,
                "deg": 339,
                "gust": 5.13
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2023-11-09 12:00:00"
        },
        {
            "dt": 1699542000,
            "main": {
                "temp": 306.97,
                "feels_like": 305.22,
                "temp_min": 306.97,
                "temp_max": 306.97,
                "pressure": 1011,
                "sea_level": 1011,
                "grnd_level": 929,
                "humidity": 23,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "clouds": {
                "all": 2
            },
            "wind": {
                "speed": 4.92,
                "deg": 297,
                "gust": 6.26
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2023-11-09 15:00:00"
        },
        {
            "dt": 1699552800,
            "main": {
                "temp": 307.75,
                "feels_like": 305.98,
                "temp_min": 307.75,
                "temp_max": 307.75,
                "pressure": 1009,
                "sea_level": 1009,
                "grnd_level": 928,
                "humidity": 22,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 801,
                    "main": "Clouds",
                    "description": "few clouds",
                    "icon": "02d"
                }
            ],
            "clouds": {
                "all": 13
            },
            "wind": {
                "speed": 4.58,
                "deg": 269,
                "gust": 4.83
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2023-11-09 18:00:00"
        },
        {
            "dt": 1699563600,
            "main": {
                "temp": 304.04,
                "feels_like": 303.06,
                "temp_min": 304.04,
                "temp_max": 304.04,
                "pressure": 1010,
                "sea_level": 1010,
                "grnd_level": 927,
                "humidity": 33,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 803,
                    "main": "Clouds",
                    "description": "broken clouds",
                    "icon": "04d"
                }
            ],
            "clouds": {
                "all": 72
            },
            "wind": {
                "speed": 2.82,
                "deg": 189,
                "gust": 4.77
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2023-11-09 21:00:00"
        },
        {
            "dt": 1699574400,
            "main": {
                "temp": 296.34,
                "feels_like": 296.33,
                "temp_min": 296.34,
                "temp_max": 296.34,
                "pressure": 1015,
                "sea_level": 1015,
                "grnd_level": 929,
                "humidity": 62,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 804,
                    "main": "Clouds",
                    "description": "overcast clouds",
                    "icon": "04n"
                }
            ],
            "clouds": {
                "all": 86
            },
            "wind": {
                "speed": 4.34,
                "deg": 165,
                "gust": 7.25
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "n"
            },
            "dt_txt": "2023-11-10 00:00:00"
        },
        {
            "dt": 1699585200,
            "main": {
                "temp": 294.22,
                "feels_like": 294.37,
                "temp_min": 294.22,
                "temp_max": 294.22,
                "pressure": 1015,
                "sea_level": 1015,
                "grnd_level": 929,
                "humidity": 76,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 803,
                    "main": "Clouds",
                    "description": "broken clouds",
                    "icon": "04n"
                }
            ],
            "clouds": {
                "all": 83
            },
            "wind": {
                "speed": 3.5,
                "deg": 141,
                "gust": 5.61
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "n"
            },
            "dt_txt": "2023-11-10 03:00:00"
        },
        {
            "dt": 1699596000,
            "main": {
                "temp": 293.39,
                "feels_like": 293.53,
                "temp_min": 293.39,
                "temp_max": 293.39,
                "pressure": 1013,
                "sea_level": 1013,
                "grnd_level": 927,
                "humidity": 79,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 804,
                    "main": "Clouds",
                    "description": "overcast clouds",
                    "icon": "04n"
                }
            ],
            "clouds": {
                "all": 87
            },
            "wind": {
                "speed": 3.04,
                "deg": 144,
                "gust": 4.69
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "n"
            },
            "dt_txt": "2023-11-10 06:00:00"
        },
        {
            "dt": 1699606800,
            "main": {
                "temp": 292.86,
                "feels_like": 293,
                "temp_min": 292.86,
                "temp_max": 292.86,
                "pressure": 1015,
                "sea_level": 1015,
                "grnd_level": 928,
                "humidity": 81,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 804,
                    "main": "Clouds",
                    "description": "overcast clouds",
                    "icon": "04d"
                }
            ],
            "clouds": {
                "all": 98
            },
            "wind": {
                "speed": 3.19,
                "deg": 142,
                "gust": 5.17
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2023-11-10 09:00:00"
        },
        {
            "dt": 1699617600,
            "main": {
                "temp": 297.54,
                "feels_like": 297.6,
                "temp_min": 297.54,
                "temp_max": 297.54,
                "pressure": 1015,
                "sea_level": 1015,
                "grnd_level": 930,
                "humidity": 60,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 804,
                    "main": "Clouds",
                    "description": "overcast clouds",
                    "icon": "04d"
                }
            ],
            "clouds": {
                "all": 95
            },
            "wind": {
                "speed": 3.45,
                "deg": 112,
                "gust": 4.94
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2023-11-10 12:00:00"
        },
        {
            "dt": 1699628400,
            "main": {
                "temp": 301.19,
                "feels_like": 301.22,
                "temp_min": 301.19,
                "temp_max": 301.19,
                "pressure": 1013,
                "sea_level": 1013,
                "grnd_level": 929,
                "humidity": 45,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 804,
                    "main": "Clouds",
                    "description": "overcast clouds",
                    "icon": "04d"
                }
            ],
            "clouds": {
                "all": 94
            },
            "wind": {
                "speed": 2.54,
                "deg": 127,
                "gust": 3.12
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2023-11-10 15:00:00"
        },
        {
            "dt": 1699639200,
            "main": {
                "temp": 304.23,
                "feels_like": 304.32,
                "temp_min": 304.23,
                "temp_max": 304.23,
                "pressure": 1010,
                "sea_level": 1010,
                "grnd_level": 927,
                "humidity": 41,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 803,
                    "main": "Clouds",
                    "description": "broken clouds",
                    "icon": "04d"
                }
            ],
            "clouds": {
                "all": 59
            },
            "wind": {
                "speed": 4.86,
                "deg": 154,
                "gust": 4.33
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2023-11-10 18:00:00"
        },
        {
            "dt": 1699650000,
            "main": {
                "temp": 295.62,
                "feels_like": 295.91,
                "temp_min": 295.62,
                "temp_max": 295.62,
                "pressure": 1013,
                "sea_level": 1013,
                "grnd_level": 927,
                "humidity": 76,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 500,
                    "main": "Rain",
                    "description": "light rain",
                    "icon": "10d"
                }
            ],
            "clouds": {
                "all": 33
            },
            "wind": {
                "speed": 5.2,
                "deg": 144,
                "gust": 6.06
            },
            "visibility": 10000,
            "pop": 0.24,
            "rain": {
                "3h": 0.14
            },
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2023-11-10 21:00:00"
        },
        {
            "dt": 1699660800,
            "main": {
                "temp": 293.65,
                "feels_like": 293.95,
                "temp_min": 293.65,
                "temp_max": 293.65,
                "pressure": 1015,
                "sea_level": 1015,
                "grnd_level": 929,
                "humidity": 84,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 803,
                    "main": "Clouds",
                    "description": "broken clouds",
                    "icon": "04n"
                }
            ],
            "clouds": {
                "all": 62
            },
            "wind": {
                "speed": 3.9,
                "deg": 134,
                "gust": 5.27
            },
            "visibility": 10000,
            "pop": 0.16,
            "sys": {
                "pod": "n"
            },
            "dt_txt": "2023-11-11 00:00:00"
        },
        {
            "dt": 1699671600,
            "main": {
                "temp": 293.71,
                "feels_like": 293.96,
                "temp_min": 293.71,
                "temp_max": 293.71,
                "pressure": 1014,
                "sea_level": 1014,
                "grnd_level": 928,
                "humidity": 82,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 804,
                    "main": "Clouds",
                    "description": "overcast clouds",
                    "icon": "04n"
                }
            ],
            "clouds": {
                "all": 98
            },
            "wind": {
                "speed": 3.12,
                "deg": 126,
                "gust": 4.67
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "n"
            },
            "dt_txt": "2023-11-11 03:00:00"
        },
        {
            "dt": 1699682400,
            "main": {
                "temp": 293.02,
                "feels_like": 293.28,
                "temp_min": 293.02,
                "temp_max": 293.02,
                "pressure": 1012,
                "sea_level": 1012,
                "grnd_level": 926,
                "humidity": 85,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 804,
                    "main": "Clouds",
                    "description": "overcast clouds",
                    "icon": "04n"
                }
            ],
            "clouds": {
                "all": 92
            },
            "wind": {
                "speed": 2.03,
                "deg": 95,
                "gust": 3.57
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "n"
            },
            "dt_txt": "2023-11-11 06:00:00"
        },
        {
            "dt": 1699693200,
            "main": {
                "temp": 293.15,
                "feels_like": 293.45,
                "temp_min": 293.15,
                "temp_max": 293.15,
                "pressure": 1012,
                "sea_level": 1012,
                "grnd_level": 926,
                "humidity": 86,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 803,
                    "main": "Clouds",
                    "description": "broken clouds",
                    "icon": "04d"
                }
            ],
            "clouds": {
                "all": 73
            },
            "wind": {
                "speed": 1.96,
                "deg": 60,
                "gust": 3.81
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2023-11-11 09:00:00"
        },
        {
            "dt": 1699704000,
            "main": {
                "temp": 303.04,
                "feels_like": 302.6,
                "temp_min": 303.04,
                "temp_max": 303.04,
                "pressure": 1010,
                "sea_level": 1010,
                "grnd_level": 927,
                "humidity": 39,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 803,
                    "main": "Clouds",
                    "description": "broken clouds",
                    "icon": "04d"
                }
            ],
            "clouds": {
                "all": 57
            },
            "wind": {
                "speed": 3.68,
                "deg": 351,
                "gust": 6.87
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2023-11-11 12:00:00"
        },
        {
            "dt": 1699714800,
            "main": {
                "temp": 308.85,
                "feels_like": 307.45,
                "temp_min": 308.85,
                "temp_max": 308.85,
                "pressure": 1008,
                "sea_level": 1008,
                "grnd_level": 926,
                "humidity": 23,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 802,
                    "main": "Clouds",
                    "description": "scattered clouds",
                    "icon": "03d"
                }
            ],
            "clouds": {
                "all": 40
            },
            "wind": {
                "speed": 5.85,
                "deg": 318,
                "gust": 7.01
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2023-11-11 15:00:00"
        },
        {
            "dt": 1699725600,
            "main": {
                "temp": 310.24,
                "feels_like": 308.48,
                "temp_min": 310.24,
                "temp_max": 310.24,
                "pressure": 1005,
                "sea_level": 1005,
                "grnd_level": 924,
                "humidity": 19,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 803,
                    "main": "Clouds",
                    "description": "broken clouds",
                    "icon": "04d"
                }
            ],
            "clouds": {
                "all": 67
            },
            "wind": {
                "speed": 5.24,
                "deg": 306,
                "gust": 6.86
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2023-11-11 18:00:00"
        },
        {
            "dt": 1699736400,
            "main": {
                "temp": 307.14,
                "feels_like": 305.53,
                "temp_min": 307.14,
                "temp_max": 307.14,
                "pressure": 1005,
                "sea_level": 1005,
                "grnd_level": 923,
                "humidity": 24,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 804,
                    "main": "Clouds",
                    "description": "overcast clouds",
                    "icon": "04d"
                }
            ],
            "clouds": {
                "all": 100
            },
            "wind": {
                "speed": 2.27,
                "deg": 308,
                "gust": 4.32
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2023-11-11 21:00:00"
        },
        {
            "dt": 1699747200,
            "main": {
                "temp": 303.17,
                "feels_like": 302.54,
                "temp_min": 303.17,
                "temp_max": 303.17,
                "pressure": 1008,
                "sea_level": 1008,
                "grnd_level": 925,
                "humidity": 37,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 804,
                    "main": "Clouds",
                    "description": "overcast clouds",
                    "icon": "04n"
                }
            ],
            "clouds": {
                "all": 100
            },
            "wind": {
                "speed": 2.32,
                "deg": 174,
                "gust": 3.38
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "n"
            },
            "dt_txt": "2023-11-12 00:00:00"
        },
        {
            "dt": 1699758000,
            "main": {
                "temp": 297.21,
                "feels_like": 297.5,
                "temp_min": 297.21,
                "temp_max": 297.21,
                "pressure": 1010,
                "sea_level": 1010,
                "grnd_level": 925,
                "humidity": 70,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 804,
                    "main": "Clouds",
                    "description": "overcast clouds",
                    "icon": "04n"
                }
            ],
            "clouds": {
                "all": 96
            },
            "wind": {
                "speed": 2.51,
                "deg": 171,
                "gust": 4.21
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "n"
            },
            "dt_txt": "2023-11-12 03:00:00"
        },
        {
            "dt": 1699768800,
            "main": {
                "temp": 297.45,
                "feels_like": 297.69,
                "temp_min": 297.45,
                "temp_max": 297.45,
                "pressure": 1008,
                "sea_level": 1008,
                "grnd_level": 923,
                "humidity": 67,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 804,
                    "main": "Clouds",
                    "description": "overcast clouds",
                    "icon": "04n"
                }
            ],
            "clouds": {
                "all": 92
            },
            "wind": {
                "speed": 0.37,
                "deg": 3,
                "gust": 1.17
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "n"
            },
            "dt_txt": "2023-11-12 06:00:00"
        },
        {
            "dt": 1699779600,
            "main": {
                "temp": 297.81,
                "feels_like": 297.92,
                "temp_min": 297.81,
                "temp_max": 297.81,
                "pressure": 1008,
                "sea_level": 1008,
                "grnd_level": 923,
                "humidity": 61,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 804,
                    "main": "Clouds",
                    "description": "overcast clouds",
                    "icon": "04d"
                }
            ],
            "clouds": {
                "all": 95
            },
            "wind": {
                "speed": 1.84,
                "deg": 4,
                "gust": 2.89
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2023-11-12 09:00:00"
        },
        {
            "dt": 1699790400,
            "main": {
                "temp": 306.81,
                "feels_like": 305.83,
                "temp_min": 306.81,
                "temp_max": 306.81,
                "pressure": 1007,
                "sea_level": 1007,
                "grnd_level": 925,
                "humidity": 29,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 804,
                    "main": "Clouds",
                    "description": "overcast clouds",
                    "icon": "04d"
                }
            ],
            "clouds": {
                "all": 88
            },
            "wind": {
                "speed": 3.16,
                "deg": 344,
                "gust": 5.96
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2023-11-12 12:00:00"
        },
        {
            "dt": 1699801200,
            "main": {
                "temp": 311.65,
                "feels_like": 310.23,
                "temp_min": 311.65,
                "temp_max": 311.65,
                "pressure": 1005,
                "sea_level": 1005,
                "grnd_level": 924,
                "humidity": 19,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 802,
                    "main": "Clouds",
                    "description": "scattered clouds",
                    "icon": "03d"
                }
            ],
            "clouds": {
                "all": 33
            },
            "wind": {
                "speed": 4.2,
                "deg": 304,
                "gust": 5.38
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2023-11-12 15:00:00"
        },
        {
            "dt": 1699812000,
            "main": {
                "temp": 304.78,
                "feels_like": 305.8,
                "temp_min": 304.78,
                "temp_max": 304.78,
                "pressure": 1006,
                "sea_level": 1006,
                "grnd_level": 924,
                "humidity": 45,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 802,
                    "main": "Clouds",
                    "description": "scattered clouds",
                    "icon": "03d"
                }
            ],
            "clouds": {
                "all": 48
            },
            "wind": {
                "speed": 6.47,
                "deg": 155,
                "gust": 6.81
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2023-11-12 18:00:00"
        },
        {
            "dt": 1699822800,
            "main": {
                "temp": 301.08,
                "feels_like": 301.79,
                "temp_min": 301.08,
                "temp_max": 301.08,
                "pressure": 1008,
                "sea_level": 1008,
                "grnd_level": 924,
                "humidity": 53,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 803,
                    "main": "Clouds",
                    "description": "broken clouds",
                    "icon": "04d"
                }
            ],
            "clouds": {
                "all": 63
            },
            "wind": {
                "speed": 4.49,
                "deg": 130,
                "gust": 6.26
            },
            "visibility": 10000,
            "pop": 0.03,
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2023-11-12 21:00:00"
        },
        {
            "dt": 1699833600,
            "main": {
                "temp": 299.64,
                "feels_like": 299.64,
                "temp_min": 299.64,
                "temp_max": 299.64,
                "pressure": 1010,
                "sea_level": 1010,
                "grnd_level": 926,
                "humidity": 58,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 500,
                    "main": "Rain",
                    "description": "light rain",
                    "icon": "10n"
                }
            ],
            "clouds": {
                "all": 67
            },
            "wind": {
                "speed": 3.22,
                "deg": 92,
                "gust": 7.03
            },
            "visibility": 10000,
            "pop": 0.3,
            "rain": {
                "3h": 0.11
            },
            "sys": {
                "pod": "n"
            },
            "dt_txt": "2023-11-13 00:00:00"
        },
        {
            "dt": 1699844400,
            "main": {
                "temp": 297.63,
                "feels_like": 297.8,
                "temp_min": 297.63,
                "temp_max": 297.63,
                "pressure": 1010,
                "sea_level": 1010,
                "grnd_level": 925,
                "humidity": 64,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 500,
                    "main": "Rain",
                    "description": "light rain",
                    "icon": "10n"
                }
            ],
            "clouds": {
                "all": 34
            },
            "wind": {
                "speed": 2.58,
                "deg": 88,
                "gust": 6.52
            },
            "visibility": 10000,
            "pop": 0.33,
            "rain": {
                "3h": 0.12
            },
            "sys": {
                "pod": "n"
            },
            "dt_txt": "2023-11-13 03:00:00"
        },
        {
            "dt": 1699855200,
            "main": {
                "temp": 297.53,
                "feels_like": 297.67,
                "temp_min": 297.53,
                "temp_max": 297.53,
                "pressure": 1008,
                "sea_level": 1008,
                "grnd_level": 923,
                "humidity": 63,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 803,
                    "main": "Clouds",
                    "description": "broken clouds",
                    "icon": "04n"
                }
            ],
            "clouds": {
                "all": 57
            },
            "wind": {
                "speed": 2.7,
                "deg": 36,
                "gust": 5.59
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "n"
            },
            "dt_txt": "2023-11-13 06:00:00"
        },
        {
            "dt": 1699866000,
            "main": {
                "temp": 297.67,
                "feels_like": 297.77,
                "temp_min": 297.67,
                "temp_max": 297.67,
                "pressure": 1008,
                "sea_level": 1008,
                "grnd_level": 924,
                "humidity": 61,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 803,
                    "main": "Clouds",
                    "description": "broken clouds",
                    "icon": "04d"
                }
            ],
            "clouds": {
                "all": 75
            },
            "wind": {
                "speed": 1.89,
                "deg": 21,
                "gust": 4.07
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2023-11-13 09:00:00"
        },
        {
            "dt": 1699876800,
            "main": {
                "temp": 304.26,
                "feels_like": 304.06,
                "temp_min": 304.26,
                "temp_max": 304.26,
                "pressure": 1009,
                "sea_level": 1009,
                "grnd_level": 926,
                "humidity": 39,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 803,
                    "main": "Clouds",
                    "description": "broken clouds",
                    "icon": "04d"
                }
            ],
            "clouds": {
                "all": 77
            },
            "wind": {
                "speed": 2.41,
                "deg": 358,
                "gust": 5.1
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2023-11-13 12:00:00"
        },
        {
            "dt": 1699887600,
            "main": {
                "temp": 311.03,
                "feels_like": 310.11,
                "temp_min": 311.03,
                "temp_max": 311.03,
                "pressure": 1007,
                "sea_level": 1007,
                "grnd_level": 926,
                "humidity": 22,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 803,
                    "main": "Clouds",
                    "description": "broken clouds",
                    "icon": "04d"
                }
            ],
            "clouds": {
                "all": 51
            },
            "wind": {
                "speed": 4.41,
                "deg": 302,
                "gust": 5.84
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2023-11-13 15:00:00"
        },
        {
            "dt": 1699898400,
            "main": {
                "temp": 300.95,
                "feels_like": 302.31,
                "temp_min": 300.95,
                "temp_max": 300.95,
                "pressure": 1008,
                "sea_level": 1008,
                "grnd_level": 924,
                "humidity": 60,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 803,
                    "main": "Clouds",
                    "description": "broken clouds",
                    "icon": "04d"
                }
            ],
            "clouds": {
                "all": 74
            },
            "wind": {
                "speed": 6.5,
                "deg": 151,
                "gust": 7.74
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2023-11-13 18:00:00"
        },
        {
            "dt": 1699909200,
            "main": {
                "temp": 298.34,
                "feels_like": 298.72,
                "temp_min": 298.34,
                "temp_max": 298.34,
                "pressure": 1010,
                "sea_level": 1010,
                "grnd_level": 925,
                "humidity": 69,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 500,
                    "main": "Rain",
                    "description": "light rain",
                    "icon": "10d"
                }
            ],
            "clouds": {
                "all": 100
            },
            "wind": {
                "speed": 4.77,
                "deg": 172,
                "gust": 5.47
            },
            "visibility": 10000,
            "pop": 0.32,
            "rain": {
                "3h": 0.16
            },
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2023-11-13 21:00:00"
        }
    ],
    "city": {
        "id": 3448439,
        "name": "São Paulo",
        "coord": {
            "lat": -23.5489,
            "lon": -46.6388
        },
        "country": "BR",
        "population": 10021295,
        "timezone": -10800,
        "sunrise": 1699431407,
        "sunset": 1699478629
    }
}
''';
