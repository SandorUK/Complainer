# Introduction 
Complainer is a showcase proof-of-concept app for iOS to facilitate airline passenger claims for compensation under the EU regulation.

## App Concept

Main objective of the app:
Allow users who travelled to or from EU destinations to generate prepared claim they can send to their airline.

### App Flow Chart

PoC logic flow char is presented here.

![App Flow Chart](Complainer%20App%20FlowChart.png)

### App Draft UI

Draft UI prepared in Sketch and exported into Zeplin is presented below.

[App Draft UI - PDF File](Complainer.pdf)

# Getting Started
1.	Installation process
2.	Software dependencies
3.	API references

# Installation process
Use Xcode 13.4 or higher to open, run and test the project. You might want to remove or modify the signing settings to allow for the app to run on physical device.

# Software dependencies
The Xcode project contains references to third-party libraries managed via Swift Package manager. Make sure these are updated, especially if you are using CI/CD solutions to build the app.

## Build and Test
Complainer includes both unit and UI tests. These can be executed directly via Xcode IDE interface or in Xcode Cloud and similar CI/CD solutions.

# API references
To fetch historical flight data and help users find their flight we are using an API call to https://aviation-edge.com/ system.

The following developer key is a sensitive information and not to be distributed publicly `XXXXXXXXXXXXXX` (key was redacted).

## Flight Lookup

To lookup a flight based on the data provided by the user in the questionnaire form perform a `GET` call to the following URL (cURL example):

```
curl 'https://aviation-edge.com/v2/public/flightsHistory?key=XXXXXXXXXXXXXX&date_from=2022-06-18&date_to=2022-06-18&type=departure&code=BUD' \
  -H 'accept: application/json, text/javascript, */*; q=0.01' \

```

where
- `https://aviation-edge.com/v2/public/flightsHistory` - endpoint for historical data
- `date_from` - date to search FROM in format `YYYY-MM-dd`
- `date_to` - date to search TO in format `YYYY-MM-dd`
- `type` - type of search, should always be `departure`
- `code` - IATA `code` of the departure airport provided by the user (see Static Resources - this corresponds to the `code` field of the airport data model)


## Error handling

If API returns HTTP status 200 and data then app should process the data as required.

If any other error / http status or no data returned please display an error message as per app flow.

## Sample response

Below is the sample unabridged response from the API.
<details>
  <summary>Click to expand sample API response</summary>
  
```
[{
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2b",
        "delay": 9,
        "scheduledTime": "2022-06-18t05:00:00.000",
        "estimatedTime": "2022-06-18t04:55:00.000",
        "actualTime": "2022-06-18t05:08:00.000",
        "estimatedRunway": "2022-06-18t05:08:00.000",
        "actualRunway": "2022-06-18t05:08:00.000"
    },
    "arrival": {
        "iataCode": "zth",
        "icaoCode": "lgza",
        "scheduledTime": "2022-06-18t07:55:00.000",
        "estimatedTime": "2022-06-18t07:43:00.000"
    },
    "airline": {
        "name": "smartwings",
        "iataCode": "qs",
        "icaoCode": "tvs"
    },
    "flight": {
        "number": "5098",
        "iataNumber": "qs5098",
        "icaoNumber": "tvs5098"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2b",
        "delay": 8,
        "scheduledTime": "2022-06-18t06:00:00.000",
        "estimatedTime": "2022-06-18t06:00:00.000",
        "actualTime": "2022-06-18t06:08:00.000",
        "estimatedRunway": "2022-06-18t06:08:00.000",
        "actualRunway": "2022-06-18t06:08:00.000"
    },
    "arrival": {
        "iataCode": "got",
        "icaoCode": "esgg",
        "terminal": "t1",
        "baggage": "4",
        "gate": "15",
        "scheduledTime": "2022-06-18t08:05:00.000"
    },
    "airline": {
        "name": "ryanair",
        "iataCode": "fr",
        "icaoCode": "ryr"
    },
    "flight": {
        "number": "6748",
        "iataNumber": "fr6748",
        "icaoNumber": "ryr6748"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2a",
        "gate": "a2",
        "scheduledTime": "2022-06-18t06:00:00.000",
        "estimatedTime": "2022-06-18t06:00:00.000"
    },
    "arrival": {
        "iataCode": "muc",
        "icaoCode": "eddm",
        "terminal": "2",
        "gate": "g30",
        "scheduledTime": "2022-06-18t07:20:00.000"
    },
    "airline": {
        "name": "tap air portugal",
        "iataCode": "tp",
        "icaoCode": "tap"
    },
    "flight": {
        "number": "7977",
        "iataNumber": "tp7977",
        "icaoNumber": "tap7977"
    },
    "codeshared": {
        "airline": {
            "name": "lufthansa",
            "iataCode": "lh",
            "icaoCode": "dlh"
        },
        "flight": {
            "number": "1683",
            "iataNumber": "lh1683",
            "icaoNumber": "dlh1683"
        }
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2a",
        "gate": "a2",
        "scheduledTime": "2022-06-18t06:00:00.000",
        "estimatedTime": "2022-06-18t06:00:00.000"
    },
    "arrival": {
        "iataCode": "muc",
        "icaoCode": "eddm",
        "terminal": "2",
        "gate": "g30",
        "scheduledTime": "2022-06-18t07:20:00.000"
    },
    "airline": {
        "name": "united airlines",
        "iataCode": "ua",
        "icaoCode": "ual"
    },
    "flight": {
        "number": "9143",
        "iataNumber": "ua9143",
        "icaoNumber": "ual9143"
    },
    "codeshared": {
        "airline": {
            "name": "lufthansa",
            "iataCode": "lh",
            "icaoCode": "dlh"
        },
        "flight": {
            "number": "1683",
            "iataNumber": "lh1683",
            "icaoNumber": "dlh1683"
        }
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2a",
        "gate": "a2",
        "scheduledTime": "2022-06-18t06:00:00.000",
        "estimatedTime": "2022-06-18t06:00:00.000"
    },
    "arrival": {
        "iataCode": "muc",
        "icaoCode": "eddm",
        "terminal": "2",
        "gate": "g30",
        "scheduledTime": "2022-06-18t07:20:00.000"
    },
    "airline": {
        "name": "air canada",
        "iataCode": "ac",
        "icaoCode": "aca"
    },
    "flight": {
        "number": "9055",
        "iataNumber": "ac9055",
        "icaoNumber": "aca9055"
    },
    "codeshared": {
        "airline": {
            "name": "lufthansa",
            "iataCode": "lh",
            "icaoCode": "dlh"
        },
        "flight": {
            "number": "1683",
            "iataNumber": "lh1683",
            "icaoNumber": "dlh1683"
        }
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2a",
        "gate": "a2",
        "scheduledTime": "2022-06-18t06:00:00.000",
        "estimatedTime": "2022-06-18t06:00:00.000"
    },
    "arrival": {
        "iataCode": "muc",
        "icaoCode": "eddm",
        "terminal": "2",
        "gate": "g30",
        "scheduledTime": "2022-06-18t07:20:00.000"
    },
    "airline": {
        "name": "lufthansa",
        "iataCode": "lh",
        "icaoCode": "dlh"
    },
    "flight": {
        "number": "1683",
        "iataNumber": "lh1683",
        "icaoNumber": "dlh1683"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2b",
        "scheduledTime": "2022-06-18t06:00:00.000",
        "estimatedTime": "2022-06-18t06:00:00.000"
    },
    "arrival": {
        "iataCode": "bhx",
        "icaoCode": "egbb",
        "scheduledTime": "2022-06-18t07:50:00.000"
    },
    "airline": {
        "name": "wizz air",
        "iataCode": "w6",
        "icaoCode": "wzz"
    },
    "flight": {
        "number": "2217",
        "iataNumber": "w62217",
        "icaoNumber": "wzz2217"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2b",
        "delay": 15,
        "scheduledTime": "2022-06-18t06:10:00.000",
        "estimatedTime": "2022-06-18t06:10:00.000",
        "actualTime": "2022-06-18t06:24:00.000",
        "estimatedRunway": "2022-06-18t06:24:00.000",
        "actualRunway": "2022-06-18t06:24:00.000"
    },
    "arrival": {
        "iataCode": "crl",
        "icaoCode": "ebci",
        "scheduledTime": "2022-06-18t08:15:00.000",
        "estimatedTime": "2022-06-18t08:11:00.000"
    },
    "airline": {
        "name": "wizz air",
        "iataCode": "w6",
        "icaoCode": "wzz"
    },
    "flight": {
        "number": "2281",
        "iataNumber": "w62281",
        "icaoNumber": "wzz2281"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2b",
        "delay": 20,
        "scheduledTime": "2022-06-18t06:10:00.000",
        "estimatedTime": "2022-06-18t06:10:00.000",
        "actualTime": "2022-06-18t06:30:00.000",
        "estimatedRunway": "2022-06-18t06:30:00.000",
        "actualRunway": "2022-06-18t06:30:00.000"
    },
    "arrival": {
        "iataCode": "ber",
        "icaoCode": "eddb",
        "terminal": "2",
        "baggage": "c1",
        "gate": "z36",
        "scheduledTime": "2022-06-18t07:45:00.000",
        "estimatedTime": "2022-06-18t07:39:00.000"
    },
    "airline": {
        "name": "wizz air",
        "iataCode": "w6",
        "icaoCode": "wzz"
    },
    "flight": {
        "number": "2315",
        "iataNumber": "w62315",
        "icaoNumber": "wzz2315"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2b",
        "delay": 22,
        "scheduledTime": "2022-06-18t06:15:00.000",
        "estimatedTime": "2022-06-18t06:15:00.000",
        "actualTime": "2022-06-18t06:37:00.000",
        "estimatedRunway": "2022-06-18t06:37:00.000",
        "actualRunway": "2022-06-18t06:37:00.000"
    },
    "arrival": {
        "iataCode": "ber",
        "icaoCode": "eddb",
        "terminal": "2",
        "baggage": "c2",
        "gate": "a16",
        "delay": 3,
        "scheduledTime": "2022-06-18t07:45:00.000",
        "estimatedTime": "2022-06-18t07:47:00.000"
    },
    "airline": {
        "name": "ryanair",
        "iataCode": "fr",
        "icaoCode": "ryr"
    },
    "flight": {
        "number": "197",
        "iataNumber": "fr197",
        "icaoNumber": "ryr197"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2b",
        "delay": 19,
        "scheduledTime": "2022-06-18t06:15:00.000",
        "estimatedTime": "2022-06-18t06:15:00.000",
        "actualTime": "2022-06-18t06:34:00.000",
        "estimatedRunway": "2022-06-18t06:34:00.000",
        "actualRunway": "2022-06-18t06:34:00.000"
    },
    "arrival": {
        "iataCode": "edi",
        "icaoCode": "egph",
        "baggage": "1",
        "scheduledTime": "2022-06-18t08:15:00.000",
        "estimatedTime": "2022-06-18t08:13:00.000"
    },
    "airline": {
        "name": "wizz air",
        "iataCode": "w6",
        "icaoCode": "wzz"
    },
    "flight": {
        "number": "2225",
        "iataNumber": "w62225",
        "icaoNumber": "wzz2225"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2b",
        "delay": 12,
        "scheduledTime": "2022-06-18t06:20:00.000",
        "estimatedTime": "2022-06-18t06:20:00.000",
        "actualTime": "2022-06-18t06:32:00.000",
        "estimatedRunway": "2022-06-18t06:32:00.000",
        "actualRunway": "2022-06-18t06:32:00.000"
    },
    "arrival": {
        "iataCode": "stn",
        "icaoCode": "egss",
        "terminal": "1",
        "gate": "32",
        "scheduledTime": "2022-06-18t07:50:00.000",
        "estimatedTime": "2022-06-18t07:43:00.000"
    },
    "airline": {
        "name": "ryanair",
        "iataCode": "fr",
        "icaoCode": "ryr"
    },
    "flight": {
        "number": "8354",
        "iataNumber": "fr8354",
        "icaoNumber": "ryr8354"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2b",
        "delay": 29,
        "scheduledTime": "2022-06-18t06:20:00.000",
        "estimatedTime": "2022-06-18t06:20:00.000",
        "actualTime": "2022-06-18t06:48:00.000",
        "estimatedRunway": "2022-06-18t06:48:00.000",
        "actualRunway": "2022-06-18t06:48:00.000"
    },
    "arrival": {
        "iataCode": "ltn",
        "icaoCode": "eggw",
        "delay": 11,
        "scheduledTime": "2022-06-18t08:00:00.000",
        "estimatedTime": "2022-06-18t08:10:00.000"
    },
    "airline": {
        "name": "wizz air",
        "iataCode": "w6",
        "icaoCode": "wzz"
    },
    "flight": {
        "number": "2201",
        "iataNumber": "w62201",
        "icaoNumber": "wzz2201"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2b",
        "delay": 14,
        "scheduledTime": "2022-06-18t06:25:00.000",
        "estimatedTime": "2022-06-18t06:25:00.000",
        "actualTime": "2022-06-18t06:39:00.000",
        "estimatedRunway": "2022-06-18t06:39:00.000",
        "actualRunway": "2022-06-18t06:39:00.000"
    },
    "arrival": {
        "iataCode": "brs",
        "icaoCode": "eggd",
        "scheduledTime": "2022-06-18t08:05:00.000",
        "estimatedTime": "2022-06-18t08:04:00.000"
    },
    "airline": {
        "name": "ryanair",
        "iataCode": "fr",
        "icaoCode": "ryr"
    },
    "flight": {
        "number": "8207",
        "iataNumber": "fr8207",
        "icaoNumber": "ryr8207"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2b",
        "delay": 17,
        "scheduledTime": "2022-06-18t06:25:00.000",
        "estimatedTime": "2022-06-18t06:25:00.000",
        "actualTime": "2022-06-18t06:41:00.000",
        "estimatedRunway": "2022-06-18t06:41:00.000",
        "actualRunway": "2022-06-18t06:41:00.000"
    },
    "arrival": {
        "iataCode": "cta",
        "icaoCode": "licc",
        "scheduledTime": "2022-06-18t08:40:00.000",
        "estimatedTime": "2022-06-18t08:21:00.000"
    },
    "airline": {
        "name": "wizz air",
        "iataCode": "w6",
        "icaoCode": "wzz"
    },
    "flight": {
        "number": "2353",
        "iataNumber": "w62353",
        "icaoNumber": "wzz2353"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2a",
        "gate": "a4",
        "delay": 25,
        "scheduledTime": "2022-06-18t06:30:00.000",
        "estimatedTime": "2022-06-18t06:30:00.000",
        "actualTime": "2022-06-18t06:54:00.000",
        "estimatedRunway": "2022-06-18t06:54:00.000",
        "actualRunway": "2022-06-18t06:54:00.000"
    },
    "arrival": {
        "iataCode": "fra",
        "icaoCode": "eddf",
        "terminal": "1",
        "delay": 3,
        "scheduledTime": "2022-06-18t08:15:00.000",
        "estimatedTime": "2022-06-18t08:17:00.000"
    },
    "airline": {
        "name": "air canada",
        "iataCode": "ac",
        "icaoCode": "aca"
    },
    "flight": {
        "number": "9023",
        "iataNumber": "ac9023",
        "icaoNumber": "aca9023"
    },
    "codeshared": {
        "airline": {
            "name": "lufthansa",
            "iataCode": "lh",
            "icaoCode": "dlh"
        },
        "flight": {
            "number": "1343",
            "iataNumber": "lh1343",
            "icaoNumber": "dlh1343"
        }
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2a",
        "gate": "a4",
        "delay": 25,
        "scheduledTime": "2022-06-18t06:30:00.000",
        "estimatedTime": "2022-06-18t06:30:00.000",
        "actualTime": "2022-06-18t06:54:00.000",
        "estimatedRunway": "2022-06-18t06:54:00.000",
        "actualRunway": "2022-06-18t06:54:00.000"
    },
    "arrival": {
        "iataCode": "fra",
        "icaoCode": "eddf",
        "terminal": "1",
        "delay": 3,
        "scheduledTime": "2022-06-18t08:15:00.000",
        "estimatedTime": "2022-06-18t08:17:00.000"
    },
    "airline": {
        "name": "etihad airways",
        "iataCode": "ey",
        "icaoCode": "etd"
    },
    "flight": {
        "number": "3766",
        "iataNumber": "ey3766",
        "icaoNumber": "etd3766"
    },
    "codeshared": {
        "airline": {
            "name": "lufthansa",
            "iataCode": "lh",
            "icaoCode": "dlh"
        },
        "flight": {
            "number": "1343",
            "iataNumber": "lh1343",
            "icaoNumber": "dlh1343"
        }
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2a",
        "gate": "a4",
        "delay": 25,
        "scheduledTime": "2022-06-18t06:30:00.000",
        "estimatedTime": "2022-06-18t06:30:00.000",
        "actualTime": "2022-06-18t06:54:00.000",
        "estimatedRunway": "2022-06-18t06:54:00.000",
        "actualRunway": "2022-06-18t06:54:00.000"
    },
    "arrival": {
        "iataCode": "fra",
        "icaoCode": "eddf",
        "terminal": "1",
        "delay": 3,
        "scheduledTime": "2022-06-18t08:15:00.000",
        "estimatedTime": "2022-06-18t08:17:00.000"
    },
    "airline": {
        "name": "ana",
        "iataCode": "nh",
        "icaoCode": "ana"
    },
    "flight": {
        "number": "5466",
        "iataNumber": "nh5466",
        "icaoNumber": "ana5466"
    },
    "codeshared": {
        "airline": {
            "name": "lufthansa",
            "iataCode": "lh",
            "icaoCode": "dlh"
        },
        "flight": {
            "number": "1343",
            "iataNumber": "lh1343",
            "icaoNumber": "dlh1343"
        }
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2a",
        "gate": "a4",
        "delay": 25,
        "scheduledTime": "2022-06-18t06:30:00.000",
        "estimatedTime": "2022-06-18t06:30:00.000",
        "actualTime": "2022-06-18t06:54:00.000",
        "estimatedRunway": "2022-06-18t06:54:00.000",
        "actualRunway": "2022-06-18t06:54:00.000"
    },
    "arrival": {
        "iataCode": "fra",
        "icaoCode": "eddf",
        "terminal": "1",
        "delay": 3,
        "scheduledTime": "2022-06-18t08:15:00.000",
        "estimatedTime": "2022-06-18t08:17:00.000"
    },
    "airline": {
        "name": "sas",
        "iataCode": "sk",
        "icaoCode": "sas"
    },
    "flight": {
        "number": "3561",
        "iataNumber": "sk3561",
        "icaoNumber": "sas3561"
    },
    "codeshared": {
        "airline": {
            "name": "lufthansa",
            "iataCode": "lh",
            "icaoCode": "dlh"
        },
        "flight": {
            "number": "1343",
            "iataNumber": "lh1343",
            "icaoNumber": "dlh1343"
        }
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2a",
        "gate": "a4",
        "delay": 25,
        "scheduledTime": "2022-06-18t06:30:00.000",
        "estimatedTime": "2022-06-18t06:30:00.000",
        "actualTime": "2022-06-18t06:54:00.000",
        "estimatedRunway": "2022-06-18t06:54:00.000",
        "actualRunway": "2022-06-18t06:54:00.000"
    },
    "arrival": {
        "iataCode": "fra",
        "icaoCode": "eddf",
        "terminal": "1",
        "delay": 3,
        "scheduledTime": "2022-06-18t08:15:00.000",
        "estimatedTime": "2022-06-18t08:17:00.000"
    },
    "airline": {
        "name": "brussels airlines",
        "iataCode": "sn",
        "icaoCode": "bel"
    },
    "flight": {
        "number": "7148",
        "iataNumber": "sn7148",
        "icaoNumber": "bel7148"
    },
    "codeshared": {
        "airline": {
            "name": "lufthansa",
            "iataCode": "lh",
            "icaoCode": "dlh"
        },
        "flight": {
            "number": "1343",
            "iataNumber": "lh1343",
            "icaoNumber": "dlh1343"
        }
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2a",
        "gate": "a4",
        "delay": 25,
        "scheduledTime": "2022-06-18t06:30:00.000",
        "estimatedTime": "2022-06-18t06:30:00.000",
        "actualTime": "2022-06-18t06:54:00.000",
        "estimatedRunway": "2022-06-18t06:54:00.000",
        "actualRunway": "2022-06-18t06:54:00.000"
    },
    "arrival": {
        "iataCode": "fra",
        "icaoCode": "eddf",
        "terminal": "1",
        "delay": 3,
        "scheduledTime": "2022-06-18t08:15:00.000",
        "estimatedTime": "2022-06-18t08:17:00.000"
    },
    "airline": {
        "name": "singapore airlines",
        "iataCode": "sq",
        "icaoCode": "sia"
    },
    "flight": {
        "number": "2141",
        "iataNumber": "sq2141",
        "icaoNumber": "sia2141"
    },
    "codeshared": {
        "airline": {
            "name": "lufthansa",
            "iataCode": "lh",
            "icaoCode": "dlh"
        },
        "flight": {
            "number": "1343",
            "iataNumber": "lh1343",
            "icaoNumber": "dlh1343"
        }
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2a",
        "gate": "a4",
        "delay": 25,
        "scheduledTime": "2022-06-18t06:30:00.000",
        "estimatedTime": "2022-06-18t06:30:00.000",
        "actualTime": "2022-06-18t06:54:00.000",
        "estimatedRunway": "2022-06-18t06:54:00.000",
        "actualRunway": "2022-06-18t06:54:00.000"
    },
    "arrival": {
        "iataCode": "fra",
        "icaoCode": "eddf",
        "terminal": "1",
        "delay": 3,
        "scheduledTime": "2022-06-18t08:15:00.000",
        "estimatedTime": "2022-06-18t08:17:00.000"
    },
    "airline": {
        "name": "tap air portugal",
        "iataCode": "tp",
        "icaoCode": "tap"
    },
    "flight": {
        "number": "7967",
        "iataNumber": "tp7967",
        "icaoNumber": "tap7967"
    },
    "codeshared": {
        "airline": {
            "name": "lufthansa",
            "iataCode": "lh",
            "icaoCode": "dlh"
        },
        "flight": {
            "number": "1343",
            "iataNumber": "lh1343",
            "icaoNumber": "dlh1343"
        }
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2a",
        "gate": "a4",
        "delay": 25,
        "scheduledTime": "2022-06-18t06:30:00.000",
        "estimatedTime": "2022-06-18t06:30:00.000",
        "actualTime": "2022-06-18t06:54:00.000",
        "estimatedRunway": "2022-06-18t06:54:00.000",
        "actualRunway": "2022-06-18t06:54:00.000"
    },
    "arrival": {
        "iataCode": "fra",
        "icaoCode": "eddf",
        "terminal": "1",
        "delay": 3,
        "scheduledTime": "2022-06-18t08:15:00.000",
        "estimatedTime": "2022-06-18t08:17:00.000"
    },
    "airline": {
        "name": "united airlines",
        "iataCode": "ua",
        "icaoCode": "ual"
    },
    "flight": {
        "number": "9023",
        "iataNumber": "ua9023",
        "icaoNumber": "ual9023"
    },
    "codeshared": {
        "airline": {
            "name": "lufthansa",
            "iataCode": "lh",
            "icaoCode": "dlh"
        },
        "flight": {
            "number": "1343",
            "iataNumber": "lh1343",
            "icaoNumber": "dlh1343"
        }
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2a",
        "gate": "a4",
        "delay": 25,
        "scheduledTime": "2022-06-18t06:30:00.000",
        "estimatedTime": "2022-06-18t06:30:00.000",
        "actualTime": "2022-06-18t06:54:00.000",
        "estimatedRunway": "2022-06-18t06:54:00.000",
        "actualRunway": "2022-06-18t06:54:00.000"
    },
    "arrival": {
        "iataCode": "fra",
        "icaoCode": "eddf",
        "terminal": "1",
        "delay": 3,
        "scheduledTime": "2022-06-18t08:15:00.000",
        "estimatedTime": "2022-06-18t08:17:00.000"
    },
    "airline": {
        "name": "lufthansa",
        "iataCode": "lh",
        "icaoCode": "dlh"
    },
    "flight": {
        "number": "1343",
        "iataNumber": "lh1343",
        "icaoNumber": "dlh1343"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2b",
        "scheduledTime": "2022-06-18t06:30:00.000",
        "estimatedTime": "2022-06-18t06:30:00.000"
    },
    "arrival": {
        "iataCode": "opo",
        "icaoCode": "lppr",
        "scheduledTime": "2022-06-18t09:15:00.000"
    },
    "airline": {
        "name": "wizz air",
        "iataCode": "w6",
        "icaoCode": "wzz"
    },
    "flight": {
        "number": "2395",
        "iataNumber": "w62395",
        "icaoNumber": "wzz2395"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2b",
        "delay": 10,
        "scheduledTime": "2022-06-18t06:35:00.000",
        "estimatedTime": "2022-06-18t06:35:00.000",
        "actualTime": "2022-06-18t06:44:00.000",
        "estimatedRunway": "2022-06-18t06:44:00.000",
        "actualRunway": "2022-06-18t06:44:00.000"
    },
    "arrival": {
        "iataCode": "nap",
        "icaoCode": "lirn",
        "gate": "a18",
        "scheduledTime": "2022-06-18t08:10:00.000",
        "estimatedTime": "2022-06-18t08:04:00.000"
    },
    "airline": {
        "name": "ryanair",
        "iataCode": "fr",
        "icaoCode": "ryr"
    },
    "flight": {
        "number": "4090",
        "iataNumber": "fr4090",
        "icaoNumber": "ryr4090"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2a",
        "gate": "a8",
        "delay": 27,
        "scheduledTime": "2022-06-18t06:35:00.000",
        "estimatedTime": "2022-06-18t06:35:00.000",
        "actualTime": "2022-06-18t07:02:00.000",
        "estimatedRunway": "2022-06-18t07:02:00.000",
        "actualRunway": "2022-06-18t07:02:00.000"
    },
    "arrival": {
        "iataCode": "ams",
        "icaoCode": "eham",
        "terminal": "3",
        "baggage": "15",
        "gate": "c08",
        "delay": 7,
        "scheduledTime": "2022-06-18t08:40:00.000",
        "estimatedTime": "2022-06-18t08:47:00.000"
    },
    "airline": {
        "name": "delta air lines",
        "iataCode": "dl",
        "icaoCode": "dal"
    },
    "flight": {
        "number": "9694",
        "iataNumber": "dl9694",
        "icaoNumber": "dal9694"
    },
    "codeshared": {
        "airline": {
            "name": "klm",
            "iataCode": "kl",
            "icaoCode": "klm"
        },
        "flight": {
            "number": "1972",
            "iataNumber": "kl1972",
            "icaoNumber": "klm1972"
        }
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2a",
        "gate": "a8",
        "delay": 27,
        "scheduledTime": "2022-06-18t06:35:00.000",
        "estimatedTime": "2022-06-18t06:35:00.000",
        "actualTime": "2022-06-18t07:02:00.000",
        "estimatedRunway": "2022-06-18t07:02:00.000",
        "actualRunway": "2022-06-18t07:02:00.000"
    },
    "arrival": {
        "iataCode": "ams",
        "icaoCode": "eham",
        "terminal": "3",
        "baggage": "15",
        "gate": "c08",
        "delay": 7,
        "scheduledTime": "2022-06-18t08:40:00.000",
        "estimatedTime": "2022-06-18t08:47:00.000"
    },
    "airline": {
        "name": "xiamen airlines",
        "iataCode": "mf",
        "icaoCode": "cxa"
    },
    "flight": {
        "number": "9630",
        "iataNumber": "mf9630",
        "icaoNumber": "cxa9630"
    },
    "codeshared": {
        "airline": {
            "name": "klm",
            "iataCode": "kl",
            "icaoCode": "klm"
        },
        "flight": {
            "number": "1972",
            "iataNumber": "kl1972",
            "icaoNumber": "klm1972"
        }
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2a",
        "gate": "a8",
        "delay": 27,
        "scheduledTime": "2022-06-18t06:35:00.000",
        "estimatedTime": "2022-06-18t06:35:00.000",
        "actualTime": "2022-06-18t07:02:00.000",
        "estimatedRunway": "2022-06-18t07:02:00.000",
        "actualRunway": "2022-06-18t07:02:00.000"
    },
    "arrival": {
        "iataCode": "ams",
        "icaoCode": "eham",
        "terminal": "3",
        "baggage": "15",
        "gate": "c08",
        "delay": 7,
        "scheduledTime": "2022-06-18t08:40:00.000",
        "estimatedTime": "2022-06-18t08:47:00.000"
    },
    "airline": {
        "name": "klm",
        "iataCode": "kl",
        "icaoCode": "klm"
    },
    "flight": {
        "number": "1972",
        "iataNumber": "kl1972",
        "icaoNumber": "klm1972"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2b",
        "delay": 13,
        "scheduledTime": "2022-06-18t06:40:00.000",
        "estimatedTime": "2022-06-18t06:40:00.000",
        "actualTime": "2022-06-18t06:53:00.000",
        "estimatedRunway": "2022-06-18t06:53:00.000",
        "actualRunway": "2022-06-18t06:53:00.000"
    },
    "arrival": {
        "iataCode": "pfo",
        "icaoCode": "lcph",
        "gate": "b17",
        "scheduledTime": "2022-06-18t10:20:00.000",
        "estimatedTime": "2022-06-18t10:15:00.000"
    },
    "airline": {
        "name": "ryanair",
        "iataCode": "fr",
        "icaoCode": "ryr"
    },
    "flight": {
        "number": "3330",
        "iataNumber": "fr3330",
        "icaoNumber": "ryr3330"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2b",
        "delay": 24,
        "scheduledTime": "2022-06-18t06:50:00.000",
        "estimatedTime": "2022-06-18t06:50:00.000",
        "actualTime": "2022-06-18t07:13:00.000",
        "estimatedRunway": "2022-06-18t07:13:00.000",
        "actualRunway": "2022-06-18t07:13:00.000"
    },
    "arrival": {
        "iataCode": "bgy",
        "icaoCode": "lime",
        "gate": "a22",
        "delay": 5,
        "scheduledTime": "2022-06-18t08:25:00.000",
        "estimatedTime": "2022-06-18t08:30:00.000"
    },
    "airline": {
        "name": "ryanair",
        "iataCode": "fr",
        "icaoCode": "ryr"
    },
    "flight": {
        "number": "3165",
        "iataNumber": "fr3165",
        "icaoNumber": "ryr3165"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2b",
        "delay": 50,
        "scheduledTime": "2022-06-18t06:50:00.000",
        "estimatedTime": "2022-06-18t07:40:00.000"
    },
    "arrival": {
        "iataCode": "waw",
        "icaoCode": "epwa",
        "baggage": "6",
        "scheduledTime": "2022-06-18t08:05:00.000"
    },
    "airline": {
        "name": "wizz air",
        "iataCode": "w6",
        "icaoCode": "wzz"
    },
    "flight": {
        "number": "2467",
        "iataNumber": "w62467",
        "icaoNumber": "wzz2467"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2b",
        "delay": 24,
        "scheduledTime": "2022-06-18t06:55:00.000",
        "estimatedTime": "2022-06-18t06:55:00.000",
        "actualTime": "2022-06-18t07:19:00.000",
        "estimatedRunway": "2022-06-18t07:19:00.000",
        "actualRunway": "2022-06-18t07:19:00.000"
    },
    "arrival": {
        "iataCode": "tlv",
        "icaoCode": "llbg",
        "terminal": "1",
        "delay": 1,
        "scheduledTime": "2022-06-18t11:10:00.000",
        "estimatedTime": "2022-06-18t11:10:00.000"
    },
    "airline": {
        "name": "wizz air",
        "iataCode": "w6",
        "icaoCode": "wzz"
    },
    "flight": {
        "number": "2325",
        "iataNumber": "w62325",
        "icaoNumber": "wzz2325"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2b",
        "delay": 21,
        "scheduledTime": "2022-06-18t07:00:00.000",
        "estimatedTime": "2022-06-18t07:00:00.000",
        "actualTime": "2022-06-18t07:21:00.000",
        "estimatedRunway": "2022-06-18t07:21:00.000",
        "actualRunway": "2022-06-18t07:21:00.000"
    },
    "arrival": {
        "iataCode": "tlv",
        "icaoCode": "llbg",
        "terminal": "1",
        "gate": "b20",
        "scheduledTime": "2022-06-18t11:20:00.000",
        "estimatedTime": "2022-06-18t11:17:00.000"
    },
    "airline": {
        "name": "ryanair",
        "iataCode": "fr",
        "icaoCode": "ryr"
    },
    "flight": {
        "number": "6754",
        "iataNumber": "fr6754",
        "icaoNumber": "ryr6754"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2a",
        "gate": "a5",
        "scheduledTime": "2022-06-18t07:00:00.000",
        "estimatedTime": "2022-06-18t07:00:00.000"
    },
    "arrival": {
        "iataCode": "vie",
        "icaoCode": "loww",
        "terminal": "3",
        "scheduledTime": "2022-06-18t07:45:00.000"
    },
    "airline": {
        "name": "air canada",
        "iataCode": "ac",
        "icaoCode": "aca"
    },
    "flight": {
        "number": "6197",
        "iataNumber": "ac6197",
        "icaoNumber": "aca6197"
    },
    "codeshared": {
        "airline": {
            "name": "austrian",
            "iataCode": "os",
            "icaoCode": "aua"
        },
        "flight": {
            "number": "718",
            "iataNumber": "os718",
            "icaoNumber": "aua718"
        }
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2a",
        "gate": "a5",
        "scheduledTime": "2022-06-18t07:00:00.000",
        "estimatedTime": "2022-06-18t07:00:00.000"
    },
    "arrival": {
        "iataCode": "vie",
        "icaoCode": "loww",
        "terminal": "3",
        "scheduledTime": "2022-06-18t07:45:00.000"
    },
    "airline": {
        "name": "air malta",
        "iataCode": "km",
        "icaoCode": "amc"
    },
    "flight": {
        "number": "2201",
        "iataNumber": "km2201",
        "icaoNumber": "amc2201"
    },
    "codeshared": {
        "airline": {
            "name": "austrian",
            "iataCode": "os",
            "icaoCode": "aua"
        },
        "flight": {
            "number": "718",
            "iataNumber": "os718",
            "icaoNumber": "aua718"
        }
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2a",
        "gate": "a5",
        "scheduledTime": "2022-06-18t07:00:00.000",
        "estimatedTime": "2022-06-18t07:00:00.000"
    },
    "arrival": {
        "iataCode": "vie",
        "icaoCode": "loww",
        "terminal": "3",
        "scheduledTime": "2022-06-18t07:45:00.000"
    },
    "airline": {
        "name": "luxair",
        "iataCode": "lg",
        "icaoCode": "lgl"
    },
    "flight": {
        "number": "1718",
        "iataNumber": "lg1718",
        "icaoNumber": "lgl1718"
    },
    "codeshared": {
        "airline": {
            "name": "austrian",
            "iataCode": "os",
            "icaoCode": "aua"
        },
        "flight": {
            "number": "718",
            "iataNumber": "os718",
            "icaoNumber": "aua718"
        }
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2a",
        "gate": "a5",
        "scheduledTime": "2022-06-18t07:00:00.000",
        "estimatedTime": "2022-06-18t07:00:00.000"
    },
    "arrival": {
        "iataCode": "vie",
        "icaoCode": "loww",
        "terminal": "3",
        "scheduledTime": "2022-06-18t07:45:00.000"
    },
    "airline": {
        "name": "united airlines",
        "iataCode": "ua",
        "icaoCode": "ual"
    },
    "flight": {
        "number": "9824",
        "iataNumber": "ua9824",
        "icaoNumber": "ual9824"
    },
    "codeshared": {
        "airline": {
            "name": "austrian",
            "iataCode": "os",
            "icaoCode": "aua"
        },
        "flight": {
            "number": "718",
            "iataNumber": "os718",
            "icaoNumber": "aua718"
        }
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2a",
        "gate": "a5",
        "scheduledTime": "2022-06-18t07:00:00.000",
        "estimatedTime": "2022-06-18t07:00:00.000"
    },
    "arrival": {
        "iataCode": "vie",
        "icaoCode": "loww",
        "terminal": "3",
        "scheduledTime": "2022-06-18t07:45:00.000"
    },
    "airline": {
        "name": "austrian",
        "iataCode": "os",
        "icaoCode": "aua"
    },
    "flight": {
        "number": "718",
        "iataNumber": "os718",
        "icaoNumber": "aua718"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2b",
        "delay": 37,
        "scheduledTime": "2022-06-18t07:10:00.000",
        "estimatedTime": "2022-06-18t07:10:00.000",
        "actualTime": "2022-06-18t07:47:00.000",
        "estimatedRunway": "2022-06-18t07:47:00.000",
        "actualRunway": "2022-06-18t07:47:00.000"
    },
    "arrival": {
        "iataCode": "lhr",
        "icaoCode": "egll",
        "terminal": "3",
        "delay": 18,
        "scheduledTime": "2022-06-18t08:55:00.000",
        "estimatedTime": "2022-06-18t09:12:00.000"
    },
    "airline": {
        "name": "iberia",
        "iataCode": "ib",
        "icaoCode": "ibe"
    },
    "flight": {
        "number": "7516",
        "iataNumber": "ib7516",
        "icaoNumber": "ibe7516"
    },
    "codeshared": {
        "airline": {
            "name": "finnair",
            "iataCode": "ay",
            "icaoCode": "fin"
        },
        "flight": {
            "number": "865",
            "iataNumber": "ay865",
            "icaoNumber": "fin865"
        }
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2b",
        "delay": 37,
        "scheduledTime": "2022-06-18t07:10:00.000",
        "estimatedTime": "2022-06-18t07:10:00.000",
        "actualTime": "2022-06-18t07:47:00.000",
        "estimatedRunway": "2022-06-18t07:47:00.000",
        "actualRunway": "2022-06-18t07:47:00.000"
    },
    "arrival": {
        "iataCode": "lhr",
        "icaoCode": "egll",
        "terminal": "3",
        "delay": 18,
        "scheduledTime": "2022-06-18t08:55:00.000",
        "estimatedTime": "2022-06-18t09:12:00.000"
    },
    "airline": {
        "name": "jet linx aviation",
        "iataCode": "jl",
        "icaoCode": "jtl"
    },
    "flight": {
        "number": "7122",
        "iataNumber": "jl7122",
        "icaoNumber": "jtl7122"
    },
    "codeshared": {
        "airline": {
            "name": "finnair",
            "iataCode": "ay",
            "icaoCode": "fin"
        },
        "flight": {
            "number": "865",
            "iataNumber": "ay865",
            "icaoNumber": "fin865"
        }
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2b",
        "delay": 37,
        "scheduledTime": "2022-06-18t07:10:00.000",
        "estimatedTime": "2022-06-18t07:10:00.000",
        "actualTime": "2022-06-18t07:47:00.000",
        "estimatedRunway": "2022-06-18t07:47:00.000",
        "actualRunway": "2022-06-18t07:47:00.000"
    },
    "arrival": {
        "iataCode": "lhr",
        "icaoCode": "egll",
        "terminal": "3",
        "delay": 18,
        "scheduledTime": "2022-06-18t08:55:00.000",
        "estimatedTime": "2022-06-18t09:12:00.000"
    },
    "airline": {
        "name": "qantas",
        "iataCode": "qf",
        "icaoCode": "qfa"
    },
    "flight": {
        "number": "3503",
        "iataNumber": "qf3503",
        "icaoNumber": "qfa3503"
    },
    "codeshared": {
        "airline": {
            "name": "finnair",
            "iataCode": "ay",
            "icaoCode": "fin"
        },
        "flight": {
            "number": "865",
            "iataNumber": "ay865",
            "icaoNumber": "fin865"
        }
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2b",
        "delay": 37,
        "scheduledTime": "2022-06-18t07:10:00.000",
        "estimatedTime": "2022-06-18t07:10:00.000",
        "actualTime": "2022-06-18t07:47:00.000",
        "estimatedRunway": "2022-06-18t07:47:00.000",
        "actualRunway": "2022-06-18t07:47:00.000"
    },
    "arrival": {
        "iataCode": "lhr",
        "icaoCode": "egll",
        "terminal": "3",
        "delay": 18,
        "scheduledTime": "2022-06-18t08:55:00.000",
        "estimatedTime": "2022-06-18t09:12:00.000"
    },
    "airline": {
        "name": "american airlines",
        "iataCode": "aa",
        "icaoCode": "aal"
    },
    "flight": {
        "number": "6600",
        "iataNumber": "aa6600",
        "icaoNumber": "aal6600"
    },
    "codeshared": {
        "airline": {
            "name": "finnair",
            "iataCode": "ay",
            "icaoCode": "fin"
        },
        "flight": {
            "number": "865",
            "iataNumber": "ay865",
            "icaoNumber": "fin865"
        }
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2b",
        "delay": 37,
        "scheduledTime": "2022-06-18t07:10:00.000",
        "estimatedTime": "2022-06-18t07:10:00.000",
        "actualTime": "2022-06-18t07:47:00.000",
        "estimatedRunway": "2022-06-18t07:47:00.000",
        "actualRunway": "2022-06-18t07:47:00.000"
    },
    "arrival": {
        "iataCode": "lhr",
        "icaoCode": "egll",
        "terminal": "3",
        "delay": 18,
        "scheduledTime": "2022-06-18t08:55:00.000",
        "estimatedTime": "2022-06-18t09:12:00.000"
    },
    "airline": {
        "name": "finnair",
        "iataCode": "ay",
        "icaoCode": "fin"
    },
    "flight": {
        "number": "865",
        "iataNumber": "ay865",
        "icaoNumber": "fin865"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2b",
        "delay": 19,
        "scheduledTime": "2022-06-18t07:25:00.000",
        "estimatedTime": "2022-06-18t07:25:00.000",
        "actualTime": "2022-06-18t07:43:00.000",
        "estimatedRunway": "2022-06-18t07:43:00.000",
        "actualRunway": "2022-06-18t07:43:00.000"
    },
    "arrival": {
        "iataCode": "alc",
        "icaoCode": "leal",
        "baggage": "10b",
        "scheduledTime": "2022-06-18t10:40:00.000",
        "estimatedTime": "2022-06-18t10:32:00.000"
    },
    "airline": {
        "name": "wizz air",
        "iataCode": "w6",
        "icaoCode": "wzz"
    },
    "flight": {
        "number": "2387",
        "iataNumber": "w62387",
        "icaoNumber": "wzz2387"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2b",
        "delay": 10,
        "scheduledTime": "2022-06-18t07:30:00.000",
        "estimatedTime": "2022-06-18t07:40:00.000"
    },
    "arrival": {
        "iataCode": "rho",
        "icaoCode": "lgrp",
        "scheduledTime": "2022-06-18t10:50:00.000"
    },
    "airline": {
        "name": "wizz air",
        "iataCode": "w6",
        "icaoCode": "wzz"
    },
    "flight": {
        "number": "2449",
        "iataNumber": "w62449",
        "icaoNumber": "wzz2449"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2b",
        "delay": 16,
        "scheduledTime": "2022-06-18t08:05:00.000",
        "estimatedTime": "2022-06-18t08:05:00.000",
        "actualTime": "2022-06-18t08:21:00.000",
        "estimatedRunway": "2022-06-18t08:21:00.000",
        "actualRunway": "2022-06-18t08:21:00.000"
    },
    "arrival": {
        "iataCode": "ein",
        "icaoCode": "eheh",
        "scheduledTime": "2022-06-18t10:15:00.000",
        "estimatedTime": "2022-06-18t10:02:00.000"
    },
    "airline": {
        "name": "wizz air",
        "iataCode": "w6",
        "icaoCode": "wzz"
    },
    "flight": {
        "number": "2273",
        "iataNumber": "w62273",
        "icaoNumber": "wzz2273"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2b",
        "delay": 17,
        "scheduledTime": "2022-06-18t08:30:00.000",
        "estimatedTime": "2022-06-18t08:35:00.000",
        "actualTime": "2022-06-18t08:46:00.000",
        "estimatedRunway": "2022-06-18t08:46:00.000",
        "actualRunway": "2022-06-18t08:46:00.000"
    },
    "arrival": {
        "iataCode": "gva",
        "icaoCode": "lsgg",
        "terminal": "1",
        "baggage": "3",
        "delay": 1,
        "scheduledTime": "2022-06-18t10:25:00.000",
        "estimatedTime": "2022-06-18t10:25:00.000"
    },
    "airline": {
        "name": "easyjet",
        "iataCode": "u2",
        "icaoCode": "ezy"
    },
    "flight": {
        "number": "1334",
        "iataNumber": "u21334",
        "icaoNumber": "ezy1334"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2a",
        "gate": "a2",
        "delay": 11,
        "scheduledTime": "2022-06-18t08:40:00.000",
        "estimatedTime": "2022-06-18t08:40:00.000",
        "actualTime": "2022-06-18t08:51:00.000",
        "estimatedRunway": "2022-06-18t08:51:00.000",
        "actualRunway": "2022-06-18t08:51:00.000"
    },
    "arrival": {
        "iataCode": "muc",
        "icaoCode": "eddm",
        "terminal": "2",
        "gate": "k12",
        "scheduledTime": "2022-06-18t09:55:00.000",
        "estimatedTime": "2022-06-18t09:40:00.000"
    },
    "airline": {
        "name": "air canada",
        "iataCode": "ac",
        "icaoCode": "aca"
    },
    "flight": {
        "number": "9055",
        "iataNumber": "ac9055",
        "icaoNumber": "aca9055"
    },
    "codeshared": {
        "airline": {
            "name": "lufthansa",
            "iataCode": "lh",
            "icaoCode": "dlh"
        },
        "flight": {
            "number": "1675",
            "iataNumber": "lh1675",
            "icaoNumber": "dlh1675"
        }
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2a",
        "gate": "a2",
        "delay": 11,
        "scheduledTime": "2022-06-18t08:40:00.000",
        "estimatedTime": "2022-06-18t08:40:00.000",
        "actualTime": "2022-06-18t08:51:00.000",
        "estimatedRunway": "2022-06-18t08:51:00.000",
        "actualRunway": "2022-06-18t08:51:00.000"
    },
    "arrival": {
        "iataCode": "muc",
        "icaoCode": "eddm",
        "terminal": "2",
        "gate": "k12",
        "scheduledTime": "2022-06-18t09:55:00.000",
        "estimatedTime": "2022-06-18t09:40:00.000"
    },
    "airline": {
        "name": "tap air portugal",
        "iataCode": "tp",
        "icaoCode": "tap"
    },
    "flight": {
        "number": "7981",
        "iataNumber": "tp7981",
        "icaoNumber": "tap7981"
    },
    "codeshared": {
        "airline": {
            "name": "lufthansa",
            "iataCode": "lh",
            "icaoCode": "dlh"
        },
        "flight": {
            "number": "1675",
            "iataNumber": "lh1675",
            "icaoNumber": "dlh1675"
        }
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2a",
        "gate": "a2",
        "delay": 11,
        "scheduledTime": "2022-06-18t08:40:00.000",
        "estimatedTime": "2022-06-18t08:40:00.000",
        "actualTime": "2022-06-18t08:51:00.000",
        "estimatedRunway": "2022-06-18t08:51:00.000",
        "actualRunway": "2022-06-18t08:51:00.000"
    },
    "arrival": {
        "iataCode": "muc",
        "icaoCode": "eddm",
        "terminal": "2",
        "gate": "k12",
        "scheduledTime": "2022-06-18t09:55:00.000",
        "estimatedTime": "2022-06-18t09:40:00.000"
    },
    "airline": {
        "name": "united airlines",
        "iataCode": "ua",
        "icaoCode": "ual"
    },
    "flight": {
        "number": "8824",
        "iataNumber": "ua8824",
        "icaoNumber": "ual8824"
    },
    "codeshared": {
        "airline": {
            "name": "lufthansa",
            "iataCode": "lh",
            "icaoCode": "dlh"
        },
        "flight": {
            "number": "1675",
            "iataNumber": "lh1675",
            "icaoNumber": "dlh1675"
        }
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2a",
        "gate": "a2",
        "delay": 11,
        "scheduledTime": "2022-06-18t08:40:00.000",
        "estimatedTime": "2022-06-18t08:40:00.000",
        "actualTime": "2022-06-18t08:51:00.000",
        "estimatedRunway": "2022-06-18t08:51:00.000",
        "actualRunway": "2022-06-18t08:51:00.000"
    },
    "arrival": {
        "iataCode": "muc",
        "icaoCode": "eddm",
        "terminal": "2",
        "gate": "k12",
        "scheduledTime": "2022-06-18t09:55:00.000",
        "estimatedTime": "2022-06-18t09:40:00.000"
    },
    "airline": {
        "name": "lufthansa",
        "iataCode": "lh",
        "icaoCode": "dlh"
    },
    "flight": {
        "number": "1675",
        "iataNumber": "lh1675",
        "icaoNumber": "dlh1675"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2b",
        "scheduledTime": "2022-06-18t08:50:00.000",
        "estimatedTime": "2022-06-18t08:50:00.000"
    },
    "arrival": {
        "iataCode": "bll",
        "icaoCode": "ekbi",
        "gate": "a25",
        "scheduledTime": "2022-06-18t10:50:00.000"
    },
    "airline": {
        "name": "ryanair",
        "iataCode": "fr",
        "icaoCode": "ryr"
    },
    "flight": {
        "number": "8745",
        "iataNumber": "fr8745",
        "icaoNumber": "ryr8745"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2a",
        "gate": "b09",
        "scheduledTime": "2022-06-18t09:00:00.000",
        "estimatedTime": "2022-06-18t09:00:00.000"
    },
    "arrival": {
        "iataCode": "ist",
        "icaoCode": "ltfm",
        "gate": "f",
        "scheduledTime": "2022-06-18t12:10:00.000"
    },
    "airline": {
        "name": "singapore airlines",
        "iataCode": "sq",
        "icaoCode": "sia"
    },
    "flight": {
        "number": "6286",
        "iataNumber": "sq6286",
        "icaoNumber": "sia6286"
    },
    "codeshared": {
        "airline": {
            "name": "turkish airlines",
            "iataCode": "tk",
            "icaoCode": "thy"
        },
        "flight": {
            "number": "1036",
            "iataNumber": "tk1036",
            "icaoNumber": "thy1036"
        }
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2a",
        "gate": "b09",
        "scheduledTime": "2022-06-18t09:00:00.000",
        "estimatedTime": "2022-06-18t09:00:00.000"
    },
    "arrival": {
        "iataCode": "ist",
        "icaoCode": "ltfm",
        "gate": "f",
        "scheduledTime": "2022-06-18t12:10:00.000"
    },
    "airline": {
        "name": "turkish airlines",
        "iataCode": "tk",
        "icaoCode": "thy"
    },
    "flight": {
        "number": "1036",
        "iataNumber": "tk1036",
        "icaoNumber": "thy1036"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "scheduledTime": "2022-06-18t09:00:00.000"
    },
    "arrival": {
        "iataCode": "pvg",
        "icaoCode": "zspd",
        "scheduledTime": "2022-06-19t01:25:00.000"
    },
    "airline": {
        "name": "shanghai airlines",
        "iataCode": "fm",
        "icaoCode": "csh"
    },
    "flight": {
        "number": "7188",
        "iataNumber": "fm7188",
        "icaoNumber": "csh7188"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2a",
        "gate": "a5",
        "delay": 20,
        "scheduledTime": "2022-06-18t09:40:00.000",
        "estimatedTime": "2022-06-18t09:40:00.000",
        "actualTime": "2022-06-18t09:59:00.000",
        "estimatedRunway": "2022-06-18t09:59:00.000",
        "actualRunway": "2022-06-18t09:59:00.000"
    },
    "arrival": {
        "iataCode": "zrh",
        "icaoCode": "lszh",
        "terminal": "1",
        "delay": 1,
        "scheduledTime": "2022-06-18t11:20:00.000",
        "estimatedTime": "2022-06-18t11:21:00.000"
    },
    "airline": {
        "name": "air canada",
        "iataCode": "ac",
        "icaoCode": "aca"
    },
    "flight": {
        "number": "6831",
        "iataNumber": "ac6831",
        "icaoNumber": "aca6831"
    },
    "codeshared": {
        "airline": {
            "name": "helvetic airways",
            "iataCode": "2l",
            "icaoCode": "oaw"
        },
        "flight": {
            "number": "2251",
            "iataNumber": "2l2251",
            "icaoNumber": "oaw2251"
        }
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2a",
        "gate": "a5",
        "delay": 20,
        "scheduledTime": "2022-06-18t09:40:00.000",
        "estimatedTime": "2022-06-18t09:40:00.000",
        "actualTime": "2022-06-18t09:59:00.000",
        "estimatedRunway": "2022-06-18t09:59:00.000",
        "actualRunway": "2022-06-18t09:59:00.000"
    },
    "arrival": {
        "iataCode": "zrh",
        "icaoCode": "lszh",
        "terminal": "1",
        "delay": 1,
        "scheduledTime": "2022-06-18t11:20:00.000",
        "estimatedTime": "2022-06-18t11:21:00.000"
    },
    "airline": {
        "name": "tap air portugal",
        "iataCode": "tp",
        "icaoCode": "tap"
    },
    "flight": {
        "number": "8199",
        "iataNumber": "tp8199",
        "icaoNumber": "tap8199"
    },
    "codeshared": {
        "airline": {
            "name": "helvetic airways",
            "iataCode": "2l",
            "icaoCode": "oaw"
        },
        "flight": {
            "number": "2251",
            "iataNumber": "2l2251",
            "icaoNumber": "oaw2251"
        }
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2a",
        "gate": "a5",
        "delay": 20,
        "scheduledTime": "2022-06-18t09:40:00.000",
        "estimatedTime": "2022-06-18t09:40:00.000",
        "actualTime": "2022-06-18t09:59:00.000",
        "estimatedRunway": "2022-06-18t09:59:00.000",
        "actualRunway": "2022-06-18t09:59:00.000"
    },
    "arrival": {
        "iataCode": "zrh",
        "icaoCode": "lszh",
        "terminal": "1",
        "delay": 1,
        "scheduledTime": "2022-06-18t11:20:00.000",
        "estimatedTime": "2022-06-18t11:21:00.000"
    },
    "airline": {
        "name": "helvetic airways",
        "iataCode": "2l",
        "icaoCode": "oaw"
    },
    "flight": {
        "number": "2251",
        "iataNumber": "2l2251",
        "icaoNumber": "oaw2251"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2a",
        "delay": 17,
        "scheduledTime": "2022-06-18t09:50:00.000",
        "estimatedTime": "2022-06-18t09:50:00.000",
        "actualTime": "2022-06-18t10:07:00.000",
        "estimatedRunway": "2022-06-18t10:07:00.000",
        "actualRunway": "2022-06-18t10:07:00.000"
    },
    "arrival": {
        "iataCode": "waw",
        "icaoCode": "epwa",
        "baggage": "2",
        "delay": 3,
        "scheduledTime": "2022-06-18t11:10:00.000",
        "estimatedTime": "2022-06-18t11:12:00.000"
    },
    "airline": {
        "name": "tap air portugal",
        "iataCode": "tp",
        "icaoCode": "tap"
    },
    "flight": {
        "number": "7105",
        "iataNumber": "tp7105",
        "icaoNumber": "tap7105"
    },
    "codeshared": {
        "airline": {
            "name": "lot - polish airlines",
            "iataCode": "lo",
            "icaoCode": "lot"
        },
        "flight": {
            "number": "534",
            "iataNumber": "lo534",
            "icaoNumber": "lot534"
        }
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2a",
        "delay": 17,
        "scheduledTime": "2022-06-18t09:50:00.000",
        "estimatedTime": "2022-06-18t09:50:00.000",
        "actualTime": "2022-06-18t10:07:00.000",
        "estimatedRunway": "2022-06-18t10:07:00.000",
        "actualRunway": "2022-06-18t10:07:00.000"
    },
    "arrival": {
        "iataCode": "waw",
        "icaoCode": "epwa",
        "baggage": "2",
        "delay": 3,
        "scheduledTime": "2022-06-18t11:10:00.000",
        "estimatedTime": "2022-06-18t11:12:00.000"
    },
    "airline": {
        "name": "lot - polish airlines",
        "iataCode": "lo",
        "icaoCode": "lot"
    },
    "flight": {
        "number": "534",
        "iataNumber": "lo534",
        "icaoNumber": "lot534"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2b",
        "delay": 18,
        "scheduledTime": "2022-06-18t10:00:00.000",
        "estimatedTime": "2022-06-18t10:18:00.000"
    },
    "arrival": {
        "iataCode": "cdg",
        "icaoCode": "lfpg",
        "terminal": "2b",
        "scheduledTime": "2022-06-18t12:25:00.000"
    },
    "airline": {
        "name": "easyjet",
        "iataCode": "u2",
        "icaoCode": "ezy"
    },
    "flight": {
        "number": "3854",
        "iataNumber": "u23854",
        "icaoNumber": "ezy3854"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2b",
        "delay": 23,
        "scheduledTime": "2022-06-18t10:05:00.000",
        "estimatedTime": "2022-06-18t10:05:00.000",
        "actualTime": "2022-06-18t10:27:00.000",
        "estimatedRunway": "2022-06-18t10:27:00.000",
        "actualRunway": "2022-06-18t10:27:00.000"
    },
    "arrival": {
        "iataCode": "tsf",
        "icaoCode": "liph",
        "gate": "a22",
        "delay": 4,
        "scheduledTime": "2022-06-18t11:30:00.000",
        "estimatedTime": "2022-06-18t11:33:00.000"
    },
    "airline": {
        "name": "ryanair",
        "iataCode": "fr",
        "icaoCode": "ryr"
    },
    "flight": {
        "number": "5045",
        "iataNumber": "fr5045",
        "icaoNumber": "ryr5045"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2b",
        "delay": 13,
        "scheduledTime": "2022-06-18t10:20:00.000",
        "estimatedTime": "2022-06-18t10:33:00.000"
    },
    "arrival": {
        "iataCode": "blq",
        "icaoCode": "lipe",
        "scheduledTime": "2022-06-18t11:50:00.000"
    },
    "airline": {
        "name": "wizz air",
        "iataCode": "w6",
        "icaoCode": "wzz"
    },
    "flight": {
        "number": "2355",
        "iataNumber": "w62355",
        "icaoNumber": "wzz2355"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2b",
        "scheduledTime": "2022-06-18t10:25:00.000",
        "estimatedTime": "2022-06-18t10:25:00.000"
    },
    "arrival": {
        "iataCode": "stn",
        "icaoCode": "egss",
        "terminal": "1",
        "gate": "37",
        "scheduledTime": "2022-06-18t11:55:00.000"
    },
    "airline": {
        "name": "ryanair",
        "iataCode": "fr",
        "icaoCode": "ryr"
    },
    "flight": {
        "number": "8446",
        "iataNumber": "fr8446",
        "icaoNumber": "ryr8446"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2b",
        "delay": 105,
        "scheduledTime": "2022-06-18t10:35:00.000",
        "estimatedTime": "2022-06-18t12:20:00.000"
    },
    "arrival": {
        "iataCode": "nyo",
        "icaoCode": "eskn",
        "scheduledTime": "2022-06-18t12:50:00.000"
    },
    "airline": {
        "name": "wizz air",
        "iataCode": "w6",
        "icaoCode": "wzz"
    },
    "flight": {
        "number": "2403",
        "iataNumber": "w62403",
        "icaoNumber": "wzz2403"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2b",
        "delay": 22,
        "scheduledTime": "2022-06-18t10:40:00.000",
        "estimatedTime": "2022-06-18t10:40:00.000",
        "actualTime": "2022-06-18t11:01:00.000",
        "estimatedRunway": "2022-06-18t11:01:00.000",
        "actualRunway": "2022-06-18t11:01:00.000"
    },
    "arrival": {
        "iataCode": "bri",
        "icaoCode": "libd",
        "baggage": "2",
        "gate": "a18",
        "scheduledTime": "2022-06-18t12:10:00.000",
        "estimatedTime": "2022-06-18t12:08:00.000"
    },
    "airline": {
        "name": "ryanair",
        "iataCode": "fr",
        "icaoCode": "ryr"
    },
    "flight": {
        "number": "5190",
        "iataNumber": "fr5190",
        "icaoNumber": "ryr5190"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2b",
        "delay": 28,
        "scheduledTime": "2022-06-18t10:45:00.000",
        "estimatedTime": "2022-06-18t10:45:00.000",
        "actualTime": "2022-06-18t11:12:00.000",
        "estimatedRunway": "2022-06-18t11:12:00.000",
        "actualRunway": "2022-06-18t11:12:00.000"
    },
    "arrival": {
        "iataCode": "jmk",
        "icaoCode": "lgmk",
        "gate": "a12",
        "delay": 4,
        "scheduledTime": "2022-06-18t13:55:00.000",
        "estimatedTime": "2022-06-18t13:59:00.000"
    },
    "airline": {
        "name": "ryanair",
        "iataCode": "fr",
        "icaoCode": "ryr"
    },
    "flight": {
        "number": "1910",
        "iataNumber": "fr1910",
        "icaoNumber": "ryr1910"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2b",
        "delay": 34,
        "scheduledTime": "2022-06-18t10:55:00.000",
        "estimatedTime": "2022-06-18t11:10:00.000",
        "actualTime": "2022-06-18t11:29:00.000",
        "estimatedRunway": "2022-06-18t11:29:00.000",
        "actualRunway": "2022-06-18t11:29:00.000"
    },
    "arrival": {
        "iataCode": "mad",
        "icaoCode": "lemd",
        "terminal": "1",
        "baggage": "11",
        "delay": 6,
        "scheduledTime": "2022-06-18t14:10:00.000",
        "estimatedTime": "2022-06-18t14:16:00.000"
    },
    "airline": {
        "name": "ryanair",
        "iataCode": "fr",
        "icaoCode": "ryr"
    },
    "flight": {
        "number": "8367",
        "iataNumber": "fr8367",
        "icaoNumber": "ryr8367"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2a",
        "gate": "a5",
        "delay": 26,
        "scheduledTime": "2022-06-18t11:05:00.000",
        "estimatedTime": "2022-06-18t11:05:00.000",
        "actualTime": "2022-06-18t11:30:00.000",
        "estimatedRunway": "2022-06-18t11:30:00.000",
        "actualRunway": "2022-06-18t11:30:00.000"
    },
    "arrival": {
        "iataCode": "fra",
        "icaoCode": "eddf",
        "terminal": "1",
        "gate": "a1",
        "delay": 1,
        "scheduledTime": "2022-06-18t12:50:00.000",
        "estimatedTime": "2022-06-18t12:50:00.000"
    },
    "airline": {
        "name": "air canada",
        "iataCode": "ac",
        "icaoCode": "aca"
    },
    "flight": {
        "number": "9039",
        "iataNumber": "ac9039",
        "icaoNumber": "aca9039"
    },
    "codeshared": {
        "airline": {
            "name": "lufthansa",
            "iataCode": "lh",
            "icaoCode": "dlh"
        },
        "flight": {
            "number": "1337",
            "iataNumber": "lh1337",
            "icaoNumber": "dlh1337"
        }
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2a",
        "gate": "a5",
        "delay": 26,
        "scheduledTime": "2022-06-18t11:05:00.000",
        "estimatedTime": "2022-06-18t11:05:00.000",
        "actualTime": "2022-06-18t11:30:00.000",
        "estimatedRunway": "2022-06-18t11:30:00.000",
        "actualRunway": "2022-06-18t11:30:00.000"
    },
    "arrival": {
        "iataCode": "fra",
        "icaoCode": "eddf",
        "terminal": "1",
        "gate": "a1",
        "delay": 1,
        "scheduledTime": "2022-06-18t12:50:00.000",
        "estimatedTime": "2022-06-18t12:50:00.000"
    },
    "airline": {
        "name": "brussels airlines",
        "iataCode": "sn",
        "icaoCode": "bel"
    },
    "flight": {
        "number": "7142",
        "iataNumber": "sn7142",
        "icaoNumber": "bel7142"
    },
    "codeshared": {
        "airline": {
            "name": "lufthansa",
            "iataCode": "lh",
            "icaoCode": "dlh"
        },
        "flight": {
            "number": "1337",
            "iataNumber": "lh1337",
            "icaoNumber": "dlh1337"
        }
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2a",
        "gate": "a5",
        "delay": 26,
        "scheduledTime": "2022-06-18t11:05:00.000",
        "estimatedTime": "2022-06-18t11:05:00.000",
        "actualTime": "2022-06-18t11:30:00.000",
        "estimatedRunway": "2022-06-18t11:30:00.000",
        "actualRunway": "2022-06-18t11:30:00.000"
    },
    "arrival": {
        "iataCode": "fra",
        "icaoCode": "eddf",
        "terminal": "1",
        "gate": "a1",
        "delay": 1,
        "scheduledTime": "2022-06-18t12:50:00.000",
        "estimatedTime": "2022-06-18t12:50:00.000"
    },
    "airline": {
        "name": "thai airways international",
        "iataCode": "tg",
        "icaoCode": "tha"
    },
    "flight": {
        "number": "7611",
        "iataNumber": "tg7611",
        "icaoNumber": "tha7611"
    },
    "codeshared": {
        "airline": {
            "name": "lufthansa",
            "iataCode": "lh",
            "icaoCode": "dlh"
        },
        "flight": {
            "number": "1337",
            "iataNumber": "lh1337",
            "icaoNumber": "dlh1337"
        }
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2a",
        "gate": "a5",
        "delay": 26,
        "scheduledTime": "2022-06-18t11:05:00.000",
        "estimatedTime": "2022-06-18t11:05:00.000",
        "actualTime": "2022-06-18t11:30:00.000",
        "estimatedRunway": "2022-06-18t11:30:00.000",
        "actualRunway": "2022-06-18t11:30:00.000"
    },
    "arrival": {
        "iataCode": "fra",
        "icaoCode": "eddf",
        "terminal": "1",
        "gate": "a1",
        "delay": 1,
        "scheduledTime": "2022-06-18t12:50:00.000",
        "estimatedTime": "2022-06-18t12:50:00.000"
    },
    "airline": {
        "name": "tap air portugal",
        "iataCode": "tp",
        "icaoCode": "tap"
    },
    "flight": {
        "number": "7519",
        "iataNumber": "tp7519",
        "icaoNumber": "tap7519"
    },
    "codeshared": {
        "airline": {
            "name": "lufthansa",
            "iataCode": "lh",
            "icaoCode": "dlh"
        },
        "flight": {
            "number": "1337",
            "iataNumber": "lh1337",
            "icaoNumber": "dlh1337"
        }
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2a",
        "gate": "a5",
        "delay": 26,
        "scheduledTime": "2022-06-18t11:05:00.000",
        "estimatedTime": "2022-06-18t11:05:00.000",
        "actualTime": "2022-06-18t11:30:00.000",
        "estimatedRunway": "2022-06-18t11:30:00.000",
        "actualRunway": "2022-06-18t11:30:00.000"
    },
    "arrival": {
        "iataCode": "fra",
        "icaoCode": "eddf",
        "terminal": "1",
        "gate": "a1",
        "delay": 1,
        "scheduledTime": "2022-06-18t12:50:00.000",
        "estimatedTime": "2022-06-18t12:50:00.000"
    },
    "airline": {
        "name": "united airlines",
        "iataCode": "ua",
        "icaoCode": "ual"
    },
    "flight": {
        "number": "9537",
        "iataNumber": "ua9537",
        "icaoNumber": "ual9537"
    },
    "codeshared": {
        "airline": {
            "name": "lufthansa",
            "iataCode": "lh",
            "icaoCode": "dlh"
        },
        "flight": {
            "number": "1337",
            "iataNumber": "lh1337",
            "icaoNumber": "dlh1337"
        }
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2a",
        "gate": "a5",
        "delay": 26,
        "scheduledTime": "2022-06-18t11:05:00.000",
        "estimatedTime": "2022-06-18t11:05:00.000",
        "actualTime": "2022-06-18t11:30:00.000",
        "estimatedRunway": "2022-06-18t11:30:00.000",
        "actualRunway": "2022-06-18t11:30:00.000"
    },
    "arrival": {
        "iataCode": "fra",
        "icaoCode": "eddf",
        "terminal": "1",
        "gate": "a1",
        "delay": 1,
        "scheduledTime": "2022-06-18t12:50:00.000",
        "estimatedTime": "2022-06-18t12:50:00.000"
    },
    "airline": {
        "name": "lufthansa",
        "iataCode": "lh",
        "icaoCode": "dlh"
    },
    "flight": {
        "number": "1337",
        "iataNumber": "lh1337",
        "icaoNumber": "dlh1337"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2b",
        "delay": 269,
        "scheduledTime": "2022-06-18t11:05:00.000",
        "estimatedTime": "2022-06-18t15:34:00.000"
    },
    "arrival": {
        "iataCode": "lgw",
        "icaoCode": "egkk",
        "terminal": "n",
        "scheduledTime": "2022-06-18t12:45:00.000"
    },
    "airline": {
        "name": "easyjet",
        "iataCode": "u2",
        "icaoCode": "ezy"
    },
    "flight": {
        "number": "8424",
        "iataNumber": "u28424",
        "icaoNumber": "ezy8424"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2b",
        "delay": 6,
        "scheduledTime": "2022-06-18t11:15:00.000",
        "estimatedTime": "2022-06-18t11:15:00.000",
        "actualTime": "2022-06-18t11:20:00.000",
        "estimatedRunway": "2022-06-18t11:20:00.000",
        "actualRunway": "2022-06-18t11:20:00.000"
    },
    "arrival": {
        "iataCode": "cfu",
        "icaoCode": "lgkr",
        "gate": "a14",
        "scheduledTime": "2022-06-18t13:55:00.000",
        "estimatedTime": "2022-06-18t13:37:00.000"
    },
    "airline": {
        "name": "ryanair",
        "iataCode": "fr",
        "icaoCode": "ryr"
    },
    "flight": {
        "number": "8054",
        "iataNumber": "fr8054",
        "icaoNumber": "ryr8054"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2a",
        "gate": "a2",
        "delay": 45,
        "scheduledTime": "2022-06-18t11:25:00.000",
        "estimatedTime": "2022-06-18t11:40:00.000",
        "actualTime": "2022-06-18t12:09:00.000",
        "estimatedRunway": "2022-06-18t12:09:00.000",
        "actualRunway": "2022-06-18t12:09:00.000"
    },
    "arrival": {
        "iataCode": "vie",
        "icaoCode": "loww",
        "terminal": "3",
        "delay": 27,
        "scheduledTime": "2022-06-18t12:15:00.000",
        "estimatedTime": "2022-06-18t12:42:00.000"
    },
    "airline": {
        "name": "tap air portugal",
        "iataCode": "tp",
        "icaoCode": "tap"
    },
    "flight": {
        "number": "8712",
        "iataNumber": "tp8712",
        "icaoNumber": "tap8712"
    },
    "codeshared": {
        "airline": {
            "name": "austrian",
            "iataCode": "os",
            "icaoCode": "aua"
        },
        "flight": {
            "number": "714",
            "iataNumber": "os714",
            "icaoNumber": "aua714"
        }
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2a",
        "gate": "a2",
        "delay": 45,
        "scheduledTime": "2022-06-18t11:25:00.000",
        "estimatedTime": "2022-06-18t11:40:00.000",
        "actualTime": "2022-06-18t12:09:00.000",
        "estimatedRunway": "2022-06-18t12:09:00.000",
        "actualRunway": "2022-06-18t12:09:00.000"
    },
    "arrival": {
        "iataCode": "vie",
        "icaoCode": "loww",
        "terminal": "3",
        "delay": 27,
        "scheduledTime": "2022-06-18t12:15:00.000",
        "estimatedTime": "2022-06-18t12:42:00.000"
    },
    "airline": {
        "name": "austrian",
        "iataCode": "os",
        "icaoCode": "aua"
    },
    "flight": {
        "number": "714",
        "iataNumber": "os714",
        "icaoNumber": "aua714"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2b",
        "delay": 20,
        "scheduledTime": "2022-06-18t11:25:00.000",
        "estimatedTime": "2022-06-18t11:40:00.000",
        "actualTime": "2022-06-18t11:45:00.000",
        "estimatedRunway": "2022-06-18t11:45:00.000",
        "actualRunway": "2022-06-18t11:45:00.000"
    },
    "arrival": {
        "iataCode": "bsl",
        "icaoCode": "lfsb",
        "baggage": "3",
        "scheduledTime": "2022-06-18t13:10:00.000",
        "estimatedTime": "2022-06-18t13:09:00.000"
    },
    "airline": {
        "name": "wizz air",
        "iataCode": "w6",
        "icaoCode": "wzz"
    },
    "flight": {
        "number": "2269",
        "iataNumber": "w62269",
        "icaoNumber": "wzz2269"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2a",
        "gate": "a4",
        "delay": 22,
        "scheduledTime": "2022-06-18t11:35:00.000",
        "estimatedTime": "2022-06-18t11:47:00.000",
        "actualTime": "2022-06-18t11:57:00.000",
        "estimatedRunway": "2022-06-18t11:57:00.000",
        "actualRunway": "2022-06-18t11:57:00.000"
    },
    "arrival": {
        "iataCode": "ams",
        "icaoCode": "eham",
        "terminal": "2",
        "baggage": "9",
        "gate": "d60",
        "delay": 4,
        "scheduledTime": "2022-06-18t13:40:00.000",
        "estimatedTime": "2022-06-18t13:44:00.000"
    },
    "airline": {
        "name": "delta air lines",
        "iataCode": "dl",
        "icaoCode": "dal"
    },
    "flight": {
        "number": "9286",
        "iataNumber": "dl9286",
        "icaoNumber": "dal9286"
    },
    "codeshared": {
        "airline": {
            "name": "klm",
            "iataCode": "kl",
            "icaoCode": "klm"
        },
        "flight": {
            "number": "1974",
            "iataNumber": "kl1974",
            "icaoNumber": "klm1974"
        }
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2a",
        "gate": "a4",
        "delay": 22,
        "scheduledTime": "2022-06-18t11:35:00.000",
        "estimatedTime": "2022-06-18t11:47:00.000",
        "actualTime": "2022-06-18t11:57:00.000",
        "estimatedRunway": "2022-06-18t11:57:00.000",
        "actualRunway": "2022-06-18t11:57:00.000"
    },
    "arrival": {
        "iataCode": "ams",
        "icaoCode": "eham",
        "terminal": "2",
        "baggage": "9",
        "gate": "d60",
        "delay": 4,
        "scheduledTime": "2022-06-18t13:40:00.000",
        "estimatedTime": "2022-06-18t13:44:00.000"
    },
    "airline": {
        "name": "xiamen airlines",
        "iataCode": "mf",
        "icaoCode": "cxa"
    },
    "flight": {
        "number": "9824",
        "iataNumber": "mf9824",
        "icaoNumber": "cxa9824"
    },
    "codeshared": {
        "airline": {
            "name": "klm",
            "iataCode": "kl",
            "icaoCode": "klm"
        },
        "flight": {
            "number": "1974",
            "iataNumber": "kl1974",
            "icaoNumber": "klm1974"
        }
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2a",
        "gate": "a4",
        "delay": 22,
        "scheduledTime": "2022-06-18t11:35:00.000",
        "estimatedTime": "2022-06-18t11:47:00.000",
        "actualTime": "2022-06-18t11:57:00.000",
        "estimatedRunway": "2022-06-18t11:57:00.000",
        "actualRunway": "2022-06-18t11:57:00.000"
    },
    "arrival": {
        "iataCode": "ams",
        "icaoCode": "eham",
        "terminal": "2",
        "baggage": "9",
        "gate": "d60",
        "delay": 4,
        "scheduledTime": "2022-06-18t13:40:00.000",
        "estimatedTime": "2022-06-18t13:44:00.000"
    },
    "airline": {
        "name": "klm",
        "iataCode": "kl",
        "icaoCode": "klm"
    },
    "flight": {
        "number": "1974",
        "iataNumber": "kl1974",
        "icaoNumber": "klm1974"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2b",
        "delay": 50,
        "scheduledTime": "2022-06-18t11:35:00.000",
        "estimatedTime": "2022-06-18t12:25:00.000"
    },
    "arrival": {
        "iataCode": "ayt",
        "icaoCode": "ltai",
        "terminal": "1",
        "scheduledTime": "2022-06-18t15:00:00.000"
    },
    "airline": {
        "name": "sunexpress",
        "iataCode": "xq",
        "icaoCode": "sxs"
    },
    "flight": {
        "number": "521",
        "iataNumber": "xq521",
        "icaoNumber": "sxs521"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2b",
        "scheduledTime": "2022-06-18t12:00:00.000",
        "estimatedTime": "2022-06-18t11:47:00.000",
        "actualTime": "2022-06-18t11:58:00.000",
        "estimatedRunway": "2022-06-18t11:58:00.000",
        "actualRunway": "2022-06-18t11:58:00.000"
    },
    "arrival": {
        "iataCode": "hel",
        "icaoCode": "efhk",
        "terminal": "2",
        "baggage": "10",
        "scheduledTime": "2022-06-18t15:20:00.000",
        "estimatedTime": "2022-06-18t15:07:00.000"
    },
    "airline": {
        "name": "british airways",
        "iataCode": "ba",
        "icaoCode": "baw"
    },
    "flight": {
        "number": "6064",
        "iataNumber": "ba6064",
        "icaoNumber": "baw6064"
    },
    "codeshared": {
        "airline": {
            "name": "finnair",
            "iataCode": "ay",
            "icaoCode": "fin"
        },
        "flight": {
            "number": "1252",
            "iataNumber": "ay1252",
            "icaoNumber": "fin1252"
        }
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2b",
        "scheduledTime": "2022-06-18t12:00:00.000",
        "estimatedTime": "2022-06-18t11:47:00.000",
        "actualTime": "2022-06-18t11:58:00.000",
        "estimatedRunway": "2022-06-18t11:58:00.000",
        "actualRunway": "2022-06-18t11:58:00.000"
    },
    "arrival": {
        "iataCode": "hel",
        "icaoCode": "efhk",
        "terminal": "2",
        "baggage": "10",
        "scheduledTime": "2022-06-18t15:20:00.000",
        "estimatedTime": "2022-06-18t15:07:00.000"
    },
    "airline": {
        "name": "jet linx aviation",
        "iataCode": "jl",
        "icaoCode": "jtl"
    },
    "flight": {
        "number": "6858",
        "iataNumber": "jl6858",
        "icaoNumber": "jtl6858"
    },
    "codeshared": {
        "airline": {
            "name": "finnair",
            "iataCode": "ay",
            "icaoCode": "fin"
        },
        "flight": {
            "number": "1252",
            "iataNumber": "ay1252",
            "icaoNumber": "fin1252"
        }
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2b",
        "scheduledTime": "2022-06-18t12:00:00.000",
        "estimatedTime": "2022-06-18t11:47:00.000",
        "actualTime": "2022-06-18t11:58:00.000",
        "estimatedRunway": "2022-06-18t11:58:00.000",
        "actualRunway": "2022-06-18t11:58:00.000"
    },
    "arrival": {
        "iataCode": "hel",
        "icaoCode": "efhk",
        "terminal": "2",
        "baggage": "10",
        "scheduledTime": "2022-06-18t15:20:00.000",
        "estimatedTime": "2022-06-18t15:07:00.000"
    },
    "airline": {
        "name": "qatar airways",
        "iataCode": "qr",
        "icaoCode": "qtr"
    },
    "flight": {
        "number": "6147",
        "iataNumber": "qr6147",
        "icaoNumber": "qtr6147"
    },
    "codeshared": {
        "airline": {
            "name": "finnair",
            "iataCode": "ay",
            "icaoCode": "fin"
        },
        "flight": {
            "number": "1252",
            "iataNumber": "ay1252",
            "icaoNumber": "fin1252"
        }
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2b",
        "scheduledTime": "2022-06-18t12:00:00.000",
        "estimatedTime": "2022-06-18t11:47:00.000",
        "actualTime": "2022-06-18t11:58:00.000",
        "estimatedRunway": "2022-06-18t11:58:00.000",
        "actualRunway": "2022-06-18t11:58:00.000"
    },
    "arrival": {
        "iataCode": "hel",
        "icaoCode": "efhk",
        "terminal": "2",
        "baggage": "10",
        "scheduledTime": "2022-06-18t15:20:00.000",
        "estimatedTime": "2022-06-18t15:07:00.000"
    },
    "airline": {
        "name": "finnair",
        "iataCode": "ay",
        "icaoCode": "fin"
    },
    "flight": {
        "number": "1252",
        "iataNumber": "ay1252",
        "icaoNumber": "fin1252"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2b",
        "delay": 34,
        "scheduledTime": "2022-06-18t12:10:00.000",
        "estimatedTime": "2022-06-18t12:20:00.000",
        "actualTime": "2022-06-18t12:44:00.000",
        "estimatedRunway": "2022-06-18t12:44:00.000",
        "actualRunway": "2022-06-18t12:44:00.000"
    },
    "arrival": {
        "iataCode": "her",
        "icaoCode": "lgir",
        "delay": 12,
        "scheduledTime": "2022-06-18t15:30:00.000",
        "estimatedTime": "2022-06-18t15:41:00.000"
    },
    "airline": {
        "name": "wizz air",
        "iataCode": "w6",
        "icaoCode": "wzz"
    },
    "flight": {
        "number": "2443",
        "iataNumber": "w62443",
        "icaoNumber": "wzz2443"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2a",
        "gate": "a18",
        "delay": 9,
        "scheduledTime": "2022-06-18t12:15:00.000",
        "estimatedTime": "2022-06-18t12:25:00.000",
        "actualTime": "2022-06-18t12:24:00.000",
        "estimatedRunway": "2022-06-18t12:24:00.000",
        "actualRunway": "2022-06-18t12:24:00.000"
    },
    "arrival": {
        "iataCode": "cdg",
        "icaoCode": "lfpg",
        "terminal": "2f",
        "baggage": "21",
        "scheduledTime": "2022-06-18t14:40:00.000",
        "estimatedTime": "2022-06-18t14:20:00.000"
    },
    "airline": {
        "name": "delta air lines",
        "iataCode": "dl",
        "icaoCode": "dal"
    },
    "flight": {
        "number": "8720",
        "iataNumber": "dl8720",
        "icaoNumber": "dal8720"
    },
    "codeshared": {
        "airline": {
            "name": "air france",
            "iataCode": "af",
            "icaoCode": "afr"
        },
        "flight": {
            "number": "1295",
            "iataNumber": "af1295",
            "icaoNumber": "afr1295"
        }
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2a",
        "gate": "a18",
        "delay": 9,
        "scheduledTime": "2022-06-18t12:15:00.000",
        "estimatedTime": "2022-06-18t12:25:00.000",
        "actualTime": "2022-06-18t12:24:00.000",
        "estimatedRunway": "2022-06-18t12:24:00.000",
        "actualRunway": "2022-06-18t12:24:00.000"
    },
    "arrival": {
        "iataCode": "cdg",
        "icaoCode": "lfpg",
        "terminal": "2f",
        "baggage": "21",
        "scheduledTime": "2022-06-18t14:40:00.000",
        "estimatedTime": "2022-06-18t14:20:00.000"
    },
    "airline": {
        "name": "kenya airways",
        "iataCode": "kq",
        "icaoCode": "kqa"
    },
    "flight": {
        "number": "3803",
        "iataNumber": "kq3803",
        "icaoNumber": "kqa3803"
    },
    "codeshared": {
        "airline": {
            "name": "air france",
            "iataCode": "af",
            "icaoCode": "afr"
        },
        "flight": {
            "number": "1295",
            "iataNumber": "af1295",
            "icaoNumber": "afr1295"
        }
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2a",
        "gate": "a18",
        "delay": 9,
        "scheduledTime": "2022-06-18t12:15:00.000",
        "estimatedTime": "2022-06-18t12:25:00.000",
        "actualTime": "2022-06-18t12:24:00.000",
        "estimatedRunway": "2022-06-18t12:24:00.000",
        "actualRunway": "2022-06-18t12:24:00.000"
    },
    "arrival": {
        "iataCode": "cdg",
        "icaoCode": "lfpg",
        "terminal": "2f",
        "baggage": "21",
        "scheduledTime": "2022-06-18t14:40:00.000",
        "estimatedTime": "2022-06-18t14:20:00.000"
    },
    "airline": {
        "name": "air austral",
        "iataCode": "uu",
        "icaoCode": "reu"
    },
    "flight": {
        "number": "8295",
        "iataNumber": "uu8295",
        "icaoNumber": "reu8295"
    },
    "codeshared": {
        "airline": {
            "name": "air france",
            "iataCode": "af",
            "icaoCode": "afr"
        },
        "flight": {
            "number": "1295",
            "iataNumber": "af1295",
            "icaoNumber": "afr1295"
        }
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2a",
        "gate": "a18",
        "delay": 9,
        "scheduledTime": "2022-06-18t12:15:00.000",
        "estimatedTime": "2022-06-18t12:25:00.000",
        "actualTime": "2022-06-18t12:24:00.000",
        "estimatedRunway": "2022-06-18t12:24:00.000",
        "actualRunway": "2022-06-18t12:24:00.000"
    },
    "arrival": {
        "iataCode": "cdg",
        "icaoCode": "lfpg",
        "terminal": "2f",
        "baggage": "21",
        "scheduledTime": "2022-06-18t14:40:00.000",
        "estimatedTime": "2022-06-18t14:20:00.000"
    },
    "airline": {
        "name": "air france",
        "iataCode": "af",
        "icaoCode": "afr"
    },
    "flight": {
        "number": "1295",
        "iataNumber": "af1295",
        "icaoNumber": "afr1295"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2b",
        "delay": 18,
        "scheduledTime": "2022-06-18t12:15:00.000",
        "estimatedTime": "2022-06-18t12:15:00.000",
        "actualTime": "2022-06-18t12:33:00.000",
        "estimatedRunway": "2022-06-18t12:33:00.000",
        "actualRunway": "2022-06-18t12:33:00.000"
    },
    "arrival": {
        "iataCode": "lhr",
        "icaoCode": "egll",
        "terminal": "3",
        "scheduledTime": "2022-06-18t14:00:00.000",
        "estimatedTime": "2022-06-18t13:48:00.000"
    },
    "airline": {
        "name": "iberia",
        "iataCode": "ib",
        "icaoCode": "ibe"
    },
    "flight": {
        "number": "7518",
        "iataNumber": "ib7518",
        "icaoNumber": "ibe7518"
    },
    "codeshared": {
        "airline": {
            "name": "finnair",
            "iataCode": "ay",
            "icaoCode": "fin"
        },
        "flight": {
            "number": "867",
            "iataNumber": "ay867",
            "icaoNumber": "fin867"
        }
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2b",
        "delay": 18,
        "scheduledTime": "2022-06-18t12:15:00.000",
        "estimatedTime": "2022-06-18t12:15:00.000",
        "actualTime": "2022-06-18t12:33:00.000",
        "estimatedRunway": "2022-06-18t12:33:00.000",
        "actualRunway": "2022-06-18t12:33:00.000"
    },
    "arrival": {
        "iataCode": "lhr",
        "icaoCode": "egll",
        "terminal": "3",
        "scheduledTime": "2022-06-18t14:00:00.000",
        "estimatedTime": "2022-06-18t13:48:00.000"
    },
    "airline": {
        "name": "jet linx aviation",
        "iataCode": "jl",
        "icaoCode": "jtl"
    },
    "flight": {
        "number": "7124",
        "iataNumber": "jl7124",
        "icaoNumber": "jtl7124"
    },
    "codeshared": {
        "airline": {
            "name": "finnair",
            "iataCode": "ay",
            "icaoCode": "fin"
        },
        "flight": {
            "number": "867",
            "iataNumber": "ay867",
            "icaoNumber": "fin867"
        }
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2b",
        "delay": 18,
        "scheduledTime": "2022-06-18t12:15:00.000",
        "estimatedTime": "2022-06-18t12:15:00.000",
        "actualTime": "2022-06-18t12:33:00.000",
        "estimatedRunway": "2022-06-18t12:33:00.000",
        "actualRunway": "2022-06-18t12:33:00.000"
    },
    "arrival": {
        "iataCode": "lhr",
        "icaoCode": "egll",
        "terminal": "3",
        "scheduledTime": "2022-06-18t14:00:00.000",
        "estimatedTime": "2022-06-18t13:48:00.000"
    },
    "airline": {
        "name": "qantas",
        "iataCode": "qf",
        "icaoCode": "qfa"
    },
    "flight": {
        "number": "3545",
        "iataNumber": "qf3545",
        "icaoNumber": "qfa3545"
    },
    "codeshared": {
        "airline": {
            "name": "finnair",
            "iataCode": "ay",
            "icaoCode": "fin"
        },
        "flight": {
            "number": "867",
            "iataNumber": "ay867",
            "icaoNumber": "fin867"
        }
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2b",
        "delay": 18,
        "scheduledTime": "2022-06-18t12:15:00.000",
        "estimatedTime": "2022-06-18t12:15:00.000",
        "actualTime": "2022-06-18t12:33:00.000",
        "estimatedRunway": "2022-06-18t12:33:00.000",
        "actualRunway": "2022-06-18t12:33:00.000"
    },
    "arrival": {
        "iataCode": "lhr",
        "icaoCode": "egll",
        "terminal": "3",
        "scheduledTime": "2022-06-18t14:00:00.000",
        "estimatedTime": "2022-06-18t13:48:00.000"
    },
    "airline": {
        "name": "american airlines",
        "iataCode": "aa",
        "icaoCode": "aal"
    },
    "flight": {
        "number": "6602",
        "iataNumber": "aa6602",
        "icaoNumber": "aal6602"
    },
    "codeshared": {
        "airline": {
            "name": "finnair",
            "iataCode": "ay",
            "icaoCode": "fin"
        },
        "flight": {
            "number": "867",
            "iataNumber": "ay867",
            "icaoNumber": "fin867"
        }
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2b",
        "delay": 18,
        "scheduledTime": "2022-06-18t12:15:00.000",
        "estimatedTime": "2022-06-18t12:15:00.000",
        "actualTime": "2022-06-18t12:33:00.000",
        "estimatedRunway": "2022-06-18t12:33:00.000",
        "actualRunway": "2022-06-18t12:33:00.000"
    },
    "arrival": {
        "iataCode": "lhr",
        "icaoCode": "egll",
        "terminal": "3",
        "scheduledTime": "2022-06-18t14:00:00.000",
        "estimatedTime": "2022-06-18t13:48:00.000"
    },
    "airline": {
        "name": "finnair",
        "iataCode": "ay",
        "icaoCode": "fin"
    },
    "flight": {
        "number": "867",
        "iataNumber": "ay867",
        "icaoNumber": "fin867"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2b",
        "delay": 46,
        "scheduledTime": "2022-06-18t12:15:00.000",
        "estimatedTime": "2022-06-18t12:15:00.000",
        "actualTime": "2022-06-18t13:00:00.000",
        "estimatedRunway": "2022-06-18t13:00:00.000",
        "actualRunway": "2022-06-18t13:00:00.000"
    },
    "arrival": {
        "iataCode": "cia",
        "icaoCode": "lira",
        "baggage": "3",
        "gate": "a22",
        "scheduledTime": "2022-06-18t13:50:00.000"
    },
    "airline": {
        "name": "ryanair",
        "iataCode": "fr",
        "icaoCode": "ryr"
    },
    "flight": {
        "number": "8417",
        "iataNumber": "fr8417",
        "icaoNumber": "ryr8417"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2b",
        "scheduledTime": "2022-06-18t12:25:00.000",
        "estimatedTime": "2022-06-18t12:25:00.000"
    },
    "arrival": {
        "iataCode": "ayt",
        "icaoCode": "ltai",
        "scheduledTime": "2022-06-18t15:45:00.000"
    },
    "airline": {
        "name": "smartwings",
        "iataCode": "qs",
        "icaoCode": "tvs"
    },
    "flight": {
        "number": "5300",
        "iataNumber": "qs5300",
        "icaoNumber": "tvs5300"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2b",
        "delay": 215,
        "scheduledTime": "2022-06-18t12:25:00.000",
        "estimatedTime": "2022-06-18t16:00:00.000"
    },
    "arrival": {
        "iataCode": "lis",
        "icaoCode": "lppt",
        "terminal": "1",
        "scheduledTime": "2022-06-18t15:10:00.000"
    },
    "airline": {
        "name": "ryanair",
        "iataCode": "fr",
        "icaoCode": "ryr"
    },
    "flight": {
        "number": "8859",
        "iataNumber": "fr8859",
        "icaoNumber": "ryr8859"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2b",
        "delay": 31,
        "scheduledTime": "2022-06-18t12:35:00.000",
        "estimatedTime": "2022-06-18t12:45:00.000",
        "actualTime": "2022-06-18t13:06:00.000",
        "estimatedRunway": "2022-06-18t13:06:00.000",
        "actualRunway": "2022-06-18t13:06:00.000"
    },
    "arrival": {
        "iataCode": "got",
        "icaoCode": "esgg",
        "terminal": "t1",
        "baggage": "1",
        "gate": "19",
        "delay": 12,
        "scheduledTime": "2022-06-18t14:45:00.000",
        "estimatedTime": "2022-06-18t14:56:00.000"
    },
    "airline": {
        "name": "wizz air",
        "iataCode": "w6",
        "icaoCode": "wzz"
    },
    "flight": {
        "number": "2405",
        "iataNumber": "w62405",
        "icaoNumber": "wzz2405"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2b",
        "delay": 44,
        "scheduledTime": "2022-06-18t12:45:00.000",
        "estimatedTime": "2022-06-18t13:15:00.000",
        "actualTime": "2022-06-18t13:28:00.000",
        "estimatedRunway": "2022-06-18t13:28:00.000",
        "actualRunway": "2022-06-18t13:28:00.000"
    },
    "arrival": {
        "iataCode": "krk",
        "icaoCode": "epkk",
        "terminal": "t",
        "delay": 12,
        "scheduledTime": "2022-06-18t13:45:00.000",
        "estimatedTime": "2022-06-18t13:56:00.000"
    },
    "airline": {
        "name": "ryanair",
        "iataCode": "fr",
        "icaoCode": "ryr"
    },
    "flight": {
        "number": "1288",
        "iataNumber": "fr1288",
        "icaoNumber": "ryr1288"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2b",
        "delay": 27,
        "scheduledTime": "2022-06-18t12:45:00.000",
        "estimatedTime": "2022-06-18t12:47:00.000",
        "actualTime": "2022-06-18t13:11:00.000",
        "estimatedRunway": "2022-06-18t13:11:00.000",
        "actualRunway": "2022-06-18t13:11:00.000"
    },
    "arrival": {
        "iataCode": "bsl",
        "icaoCode": "lfsb",
        "baggage": "7",
        "delay": 7,
        "scheduledTime": "2022-06-18t14:30:00.000",
        "estimatedTime": "2022-06-18t14:37:00.000"
    },
    "airline": {
        "name": "easyjet",
        "iataCode": "u2",
        "icaoCode": "ezy"
    },
    "flight": {
        "number": "1234",
        "iataNumber": "u21234",
        "icaoNumber": "ezy1234"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2a",
        "delay": 26,
        "scheduledTime": "2022-06-18t12:50:00.000",
        "estimatedTime": "2022-06-18t12:55:00.000",
        "actualTime": "2022-06-18t13:16:00.000",
        "estimatedRunway": "2022-06-18t13:16:00.000",
        "actualRunway": "2022-06-18t13:16:00.000"
    },
    "arrival": {
        "iataCode": "waw",
        "icaoCode": "epwa",
        "baggage": "4",
        "delay": 2,
        "scheduledTime": "2022-06-18t14:10:00.000",
        "estimatedTime": "2022-06-18t14:11:00.000"
    },
    "airline": {
        "name": "lot - polish airlines",
        "iataCode": "lo",
        "icaoCode": "lot"
    },
    "flight": {
        "number": "536",
        "iataNumber": "lo536",
        "icaoNumber": "lot536"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2b",
        "delay": 24,
        "scheduledTime": "2022-06-18t13:00:00.000",
        "estimatedTime": "2022-06-18t13:00:00.000",
        "actualTime": "2022-06-18t13:24:00.000",
        "estimatedRunway": "2022-06-18t13:24:00.000",
        "actualRunway": "2022-06-18t13:24:00.000"
    },
    "arrival": {
        "iataCode": "ltn",
        "icaoCode": "eggw",
        "delay": 6,
        "scheduledTime": "2022-06-18t14:40:00.000",
        "estimatedTime": "2022-06-18t14:45:00.000"
    },
    "airline": {
        "name": "wizz air",
        "iataCode": "w6",
        "icaoCode": "wzz"
    },
    "flight": {
        "number": "2205",
        "iataNumber": "w62205",
        "icaoNumber": "wzz2205"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2a",
        "delay": 49,
        "scheduledTime": "2022-06-18t13:20:00.000",
        "estimatedTime": "2022-06-18t13:50:00.000",
        "actualTime": "2022-06-18t14:09:00.000",
        "estimatedRunway": "2022-06-18t14:09:00.000",
        "actualRunway": "2022-06-18t14:09:00.000"
    },
    "arrival": {
        "iataCode": "saw",
        "icaoCode": "ltfj",
        "scheduledTime": "2022-06-18t16:20:00.000"
    },
    "airline": {
        "name": "pegasus",
        "iataCode": "pc",
        "icaoCode": "pgt"
    },
    "flight": {
        "number": "332",
        "iataNumber": "pc332",
        "icaoNumber": "pgt332"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2a",
        "gate": "a2",
        "delay": 26,
        "scheduledTime": "2022-06-18t13:25:00.000",
        "estimatedTime": "2022-06-18t13:30:00.000",
        "actualTime": "2022-06-18t13:50:00.000",
        "estimatedRunway": "2022-06-18t13:50:00.000",
        "actualRunway": "2022-06-18t13:50:00.000"
    },
    "arrival": {
        "iataCode": "muc",
        "icaoCode": "eddm",
        "terminal": "2",
        "gate": "g48",
        "delay": 6,
        "scheduledTime": "2022-06-18t14:40:00.000",
        "estimatedTime": "2022-06-18t14:45:00.000"
    },
    "airline": {
        "name": "air canada",
        "iataCode": "ac",
        "icaoCode": "aca"
    },
    "flight": {
        "number": "9133",
        "iataNumber": "ac9133",
        "icaoNumber": "aca9133"
    },
    "codeshared": {
        "airline": {
            "name": "lufthansa",
            "iataCode": "lh",
            "icaoCode": "dlh"
        },
        "flight": {
            "number": "1677",
            "iataNumber": "lh1677",
            "icaoNumber": "dlh1677"
        }
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2a",
        "gate": "a2",
        "delay": 26,
        "scheduledTime": "2022-06-18t13:25:00.000",
        "estimatedTime": "2022-06-18t13:30:00.000",
        "actualTime": "2022-06-18t13:50:00.000",
        "estimatedRunway": "2022-06-18t13:50:00.000",
        "actualRunway": "2022-06-18t13:50:00.000"
    },
    "arrival": {
        "iataCode": "muc",
        "icaoCode": "eddm",
        "terminal": "2",
        "gate": "g48",
        "delay": 6,
        "scheduledTime": "2022-06-18t14:40:00.000",
        "estimatedTime": "2022-06-18t14:45:00.000"
    },
    "airline": {
        "name": "sas",
        "iataCode": "sk",
        "icaoCode": "sas"
    },
    "flight": {
        "number": "3565",
        "iataNumber": "sk3565",
        "icaoNumber": "sas3565"
    },
    "codeshared": {
        "airline": {
            "name": "lufthansa",
            "iataCode": "lh",
            "icaoCode": "dlh"
        },
        "flight": {
            "number": "1677",
            "iataNumber": "lh1677",
            "icaoNumber": "dlh1677"
        }
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2a",
        "gate": "a2",
        "delay": 26,
        "scheduledTime": "2022-06-18t13:25:00.000",
        "estimatedTime": "2022-06-18t13:30:00.000",
        "actualTime": "2022-06-18t13:50:00.000",
        "estimatedRunway": "2022-06-18t13:50:00.000",
        "actualRunway": "2022-06-18t13:50:00.000"
    },
    "arrival": {
        "iataCode": "muc",
        "icaoCode": "eddm",
        "terminal": "2",
        "gate": "g48",
        "delay": 6,
        "scheduledTime": "2022-06-18t14:40:00.000",
        "estimatedTime": "2022-06-18t14:45:00.000"
    },
    "airline": {
        "name": "united airlines",
        "iataCode": "ua",
        "icaoCode": "ual"
    },
    "flight": {
        "number": "9037",
        "iataNumber": "ua9037",
        "icaoNumber": "ual9037"
    },
    "codeshared": {
        "airline": {
            "name": "lufthansa",
            "iataCode": "lh",
            "icaoCode": "dlh"
        },
        "flight": {
            "number": "1677",
            "iataNumber": "lh1677",
            "icaoNumber": "dlh1677"
        }
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2a",
        "gate": "a2",
        "delay": 26,
        "scheduledTime": "2022-06-18t13:25:00.000",
        "estimatedTime": "2022-06-18t13:30:00.000",
        "actualTime": "2022-06-18t13:50:00.000",
        "estimatedRunway": "2022-06-18t13:50:00.000",
        "actualRunway": "2022-06-18t13:50:00.000"
    },
    "arrival": {
        "iataCode": "muc",
        "icaoCode": "eddm",
        "terminal": "2",
        "gate": "g48",
        "delay": 6,
        "scheduledTime": "2022-06-18t14:40:00.000",
        "estimatedTime": "2022-06-18t14:45:00.000"
    },
    "airline": {
        "name": "lufthansa",
        "iataCode": "lh",
        "icaoCode": "dlh"
    },
    "flight": {
        "number": "1677",
        "iataNumber": "lh1677",
        "icaoNumber": "dlh1677"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2b",
        "delay": 31,
        "scheduledTime": "2022-06-18t13:35:00.000",
        "estimatedTime": "2022-06-18t13:35:00.000",
        "actualTime": "2022-06-18t14:06:00.000",
        "estimatedRunway": "2022-06-18t14:06:00.000",
        "actualRunway": "2022-06-18t14:06:00.000"
    },
    "arrival": {
        "iataCode": "cta",
        "icaoCode": "licc",
        "delay": 6,
        "scheduledTime": "2022-06-18t15:40:00.000",
        "estimatedTime": "2022-06-18t15:45:00.000"
    },
    "airline": {
        "name": "ryanair",
        "iataCode": "fr",
        "icaoCode": "ryr"
    },
    "flight": {
        "number": "6278",
        "iataNumber": "fr6278",
        "icaoNumber": "ryr6278"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2b",
        "delay": 55,
        "scheduledTime": "2022-06-18t13:35:00.000",
        "estimatedTime": "2022-06-18t14:30:00.000"
    },
    "arrival": {
        "iataCode": "cfu",
        "icaoCode": "lgkr",
        "scheduledTime": "2022-06-18t16:20:00.000"
    },
    "airline": {
        "name": "wizz air",
        "iataCode": "w6",
        "icaoCode": "wzz"
    },
    "flight": {
        "number": "2445",
        "iataNumber": "w62445",
        "icaoNumber": "wzz2445"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2b",
        "delay": 14,
        "scheduledTime": "2022-06-18t13:40:00.000",
        "estimatedTime": "2022-06-18t13:40:00.000",
        "actualTime": "2022-06-18t13:54:00.000",
        "estimatedRunway": "2022-06-18t13:54:00.000",
        "actualRunway": "2022-06-18t13:54:00.000"
    },
    "arrival": {
        "iataCode": "prg",
        "icaoCode": "lkpr",
        "terminal": "2",
        "baggage": "21",
        "scheduledTime": "2022-06-18t14:50:00.000",
        "estimatedTime": "2022-06-18t14:49:00.000"
    },
    "airline": {
        "name": "ryanair",
        "iataCode": "fr",
        "icaoCode": "ryr"
    },
    "flight": {
        "number": "4144",
        "iataNumber": "fr4144",
        "icaoNumber": "ryr4144"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2b",
        "delay": 18,
        "scheduledTime": "2022-06-18t13:45:00.000",
        "estimatedTime": "2022-06-18t13:45:00.000",
        "actualTime": "2022-06-18t14:02:00.000",
        "estimatedRunway": "2022-06-18t14:02:00.000",
        "actualRunway": "2022-06-18t14:02:00.000"
    },
    "arrival": {
        "iataCode": "kiv",
        "icaoCode": "lukk",
        "scheduledTime": "2022-06-18t16:15:00.000",
        "estimatedTime": "2022-06-18t16:09:00.000"
    },
    "airline": {
        "name": "wizz air",
        "iataCode": "w6",
        "icaoCode": "wzz"
    },
    "flight": {
        "number": "2293",
        "iataNumber": "w62293",
        "icaoNumber": "wzz2293"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2a",
        "gate": "a5",
        "delay": 23,
        "scheduledTime": "2022-06-18t14:00:00.000",
        "estimatedTime": "2022-06-18t14:10:00.000",
        "actualTime": "2022-06-18t14:23:00.000",
        "estimatedRunway": "2022-06-18t14:23:00.000",
        "actualRunway": "2022-06-18t14:23:00.000"
    },
    "arrival": {
        "iataCode": "ams",
        "icaoCode": "eham",
        "terminal": "2",
        "baggage": "13",
        "gate": "a04",
        "delay": 1,
        "scheduledTime": "2022-06-18t16:10:00.000",
        "estimatedTime": "2022-06-18t16:11:00.000"
    },
    "airline": {
        "name": "delta air lines",
        "iataCode": "dl",
        "icaoCode": "dal"
    },
    "flight": {
        "number": "9696",
        "iataNumber": "dl9696",
        "icaoNumber": "dal9696"
    },
    "codeshared": {
        "airline": {
            "name": "klm",
            "iataCode": "kl",
            "icaoCode": "klm"
        },
        "flight": {
            "number": "1976",
            "iataNumber": "kl1976",
            "icaoNumber": "klm1976"
        }
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2a",
        "gate": "a5",
        "delay": 23,
        "scheduledTime": "2022-06-18t14:00:00.000",
        "estimatedTime": "2022-06-18t14:10:00.000",
        "actualTime": "2022-06-18t14:23:00.000",
        "estimatedRunway": "2022-06-18t14:23:00.000",
        "actualRunway": "2022-06-18t14:23:00.000"
    },
    "arrival": {
        "iataCode": "ams",
        "icaoCode": "eham",
        "terminal": "2",
        "baggage": "13",
        "gate": "a04",
        "delay": 1,
        "scheduledTime": "2022-06-18t16:10:00.000",
        "estimatedTime": "2022-06-18t16:11:00.000"
    },
    "airline": {
        "name": "xiamen airlines",
        "iataCode": "mf",
        "icaoCode": "cxa"
    },
    "flight": {
        "number": "9632",
        "iataNumber": "mf9632",
        "icaoNumber": "cxa9632"
    },
    "codeshared": {
        "airline": {
            "name": "klm",
            "iataCode": "kl",
            "icaoCode": "klm"
        },
        "flight": {
            "number": "1976",
            "iataNumber": "kl1976",
            "icaoNumber": "klm1976"
        }
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2a",
        "gate": "a5",
        "delay": 23,
        "scheduledTime": "2022-06-18t14:00:00.000",
        "estimatedTime": "2022-06-18t14:10:00.000",
        "actualTime": "2022-06-18t14:23:00.000",
        "estimatedRunway": "2022-06-18t14:23:00.000",
        "actualRunway": "2022-06-18t14:23:00.000"
    },
    "arrival": {
        "iataCode": "ams",
        "icaoCode": "eham",
        "terminal": "2",
        "baggage": "13",
        "gate": "a04",
        "delay": 1,
        "scheduledTime": "2022-06-18t16:10:00.000",
        "estimatedTime": "2022-06-18t16:11:00.000"
    },
    "airline": {
        "name": "klm",
        "iataCode": "kl",
        "icaoCode": "klm"
    },
    "flight": {
        "number": "1976",
        "iataNumber": "kl1976",
        "icaoNumber": "klm1976"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2a",
        "gate": "b12",
        "delay": 28,
        "scheduledTime": "2022-06-18t14:05:00.000",
        "estimatedTime": "2022-06-18t14:05:00.000",
        "actualTime": "2022-06-18t14:33:00.000",
        "estimatedRunway": "2022-06-18t14:33:00.000",
        "actualRunway": "2022-06-18t14:33:00.000"
    },
    "arrival": {
        "iataCode": "ist",
        "icaoCode": "ltfm",
        "gate": "f",
        "delay": 1,
        "scheduledTime": "2022-06-18t17:10:00.000",
        "estimatedTime": "2022-06-18t17:11:00.000"
    },
    "airline": {
        "name": "lot - polish airlines",
        "iataCode": "lo",
        "icaoCode": "lot"
    },
    "flight": {
        "number": "5141",
        "iataNumber": "lo5141",
        "icaoNumber": "lot5141"
    },
    "codeshared": {
        "airline": {
            "name": "turkish airlines",
            "iataCode": "tk",
            "icaoCode": "thy"
        },
        "flight": {
            "number": "1034",
            "iataNumber": "tk1034",
            "icaoNumber": "thy1034"
        }
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2a",
        "gate": "b12",
        "delay": 28,
        "scheduledTime": "2022-06-18t14:05:00.000",
        "estimatedTime": "2022-06-18t14:05:00.000",
        "actualTime": "2022-06-18t14:33:00.000",
        "estimatedRunway": "2022-06-18t14:33:00.000",
        "actualRunway": "2022-06-18t14:33:00.000"
    },
    "arrival": {
        "iataCode": "ist",
        "icaoCode": "ltfm",
        "gate": "f",
        "delay": 1,
        "scheduledTime": "2022-06-18t17:10:00.000",
        "estimatedTime": "2022-06-18t17:11:00.000"
    },
    "airline": {
        "name": "turkish airlines",
        "iataCode": "tk",
        "icaoCode": "thy"
    },
    "flight": {
        "number": "1034",
        "iataNumber": "tk1034",
        "icaoNumber": "thy1034"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2b",
        "delay": 25,
        "scheduledTime": "2022-06-18t14:10:00.000",
        "estimatedTime": "2022-06-18t14:20:00.000",
        "actualTime": "2022-06-18t14:35:00.000",
        "estimatedRunway": "2022-06-18t14:35:00.000",
        "actualRunway": "2022-06-18t14:35:00.000"
    },
    "arrival": {
        "iataCode": "adb",
        "icaoCode": "ltbj",
        "terminal": "i",
        "baggage": "5",
        "scheduledTime": "2022-06-18t17:20:00.000",
        "estimatedTime": "2022-06-18t17:16:00.000"
    },
    "airline": {
        "name": "sunexpress",
        "iataCode": "xq",
        "icaoCode": "sxs"
    },
    "flight": {
        "number": "857",
        "iataNumber": "xq857",
        "icaoNumber": "sxs857"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2a",
        "delay": 60,
        "scheduledTime": "2022-06-18t14:15:00.000",
        "estimatedTime": "2022-06-18t15:15:00.000"
    },
    "arrival": {
        "iataCode": "rix",
        "icaoCode": "evra",
        "scheduledTime": "2022-06-18t17:15:00.000"
    },
    "airline": {
        "name": "air baltic",
        "iataCode": "bt",
        "icaoCode": "bti"
    },
    "flight": {
        "number": "492",
        "iataNumber": "bt492",
        "icaoNumber": "bti492"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2b",
        "delay": 40,
        "scheduledTime": "2022-06-18t14:20:00.000",
        "estimatedTime": "2022-06-18t15:00:00.000"
    },
    "arrival": {
        "iataCode": "osl",
        "icaoCode": "engm",
        "scheduledTime": "2022-06-18t16:50:00.000"
    },
    "airline": {
        "name": "norwegian air shuttle aoc",
        "iataCode": "dy",
        "icaoCode": "noz"
    },
    "flight": {
        "number": "1551",
        "iataNumber": "dy1551",
        "icaoNumber": "noz1551"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2b",
        "delay": 23,
        "scheduledTime": "2022-06-18t14:25:00.000",
        "estimatedTime": "2022-06-18t14:48:00.000"
    },
    "arrival": {
        "iataCode": "stn",
        "icaoCode": "egss",
        "gate": "87",
        "scheduledTime": "2022-06-18t15:55:00.000"
    },
    "airline": {
        "name": "ryanair",
        "iataCode": "fr",
        "icaoCode": "ryr"
    },
    "flight": {
        "number": "1659",
        "iataNumber": "fr1659",
        "icaoNumber": "ryr1659"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2a",
        "gate": "a2",
        "delay": 15,
        "scheduledTime": "2022-06-18t14:35:00.000",
        "estimatedTime": "2022-06-18t14:50:00.000"
    },
    "arrival": {
        "iataCode": "fra",
        "icaoCode": "eddf",
        "terminal": "1",
        "gate": "a19",
        "scheduledTime": "2022-06-18t16:15:00.000"
    },
    "airline": {
        "name": "ana",
        "iataCode": "nh",
        "icaoCode": "ana"
    },
    "flight": {
        "number": "5468",
        "iataNumber": "nh5468",
        "icaoNumber": "ana5468"
    },
    "codeshared": {
        "airline": {
            "name": "lufthansa",
            "iataCode": "lh",
            "icaoCode": "dlh"
        },
        "flight": {
            "number": "1339",
            "iataNumber": "lh1339",
            "icaoNumber": "dlh1339"
        }
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2a",
        "gate": "a2",
        "delay": 15,
        "scheduledTime": "2022-06-18t14:35:00.000",
        "estimatedTime": "2022-06-18t14:50:00.000"
    },
    "arrival": {
        "iataCode": "fra",
        "icaoCode": "eddf",
        "terminal": "1",
        "gate": "a19",
        "scheduledTime": "2022-06-18t16:15:00.000"
    },
    "airline": {
        "name": "tap air portugal",
        "iataCode": "tp",
        "icaoCode": "tap"
    },
    "flight": {
        "number": "7973",
        "iataNumber": "tp7973",
        "icaoNumber": "tap7973"
    },
    "codeshared": {
        "airline": {
            "name": "lufthansa",
            "iataCode": "lh",
            "icaoCode": "dlh"
        },
        "flight": {
            "number": "1339",
            "iataNumber": "lh1339",
            "icaoNumber": "dlh1339"
        }
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2a",
        "gate": "a2",
        "delay": 15,
        "scheduledTime": "2022-06-18t14:35:00.000",
        "estimatedTime": "2022-06-18t14:50:00.000"
    },
    "arrival": {
        "iataCode": "fra",
        "icaoCode": "eddf",
        "terminal": "1",
        "gate": "a19",
        "scheduledTime": "2022-06-18t16:15:00.000"
    },
    "airline": {
        "name": "united airlines",
        "iataCode": "ua",
        "icaoCode": "ual"
    },
    "flight": {
        "number": "9514",
        "iataNumber": "ua9514",
        "icaoNumber": "ual9514"
    },
    "codeshared": {
        "airline": {
            "name": "lufthansa",
            "iataCode": "lh",
            "icaoCode": "dlh"
        },
        "flight": {
            "number": "1339",
            "iataNumber": "lh1339",
            "icaoNumber": "dlh1339"
        }
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2a",
        "gate": "a2",
        "delay": 15,
        "scheduledTime": "2022-06-18t14:35:00.000",
        "estimatedTime": "2022-06-18t14:50:00.000"
    },
    "arrival": {
        "iataCode": "fra",
        "icaoCode": "eddf",
        "terminal": "1",
        "gate": "a19",
        "scheduledTime": "2022-06-18t16:15:00.000"
    },
    "airline": {
        "name": "lufthansa",
        "iataCode": "lh",
        "icaoCode": "dlh"
    },
    "flight": {
        "number": "1339",
        "iataNumber": "lh1339",
        "icaoNumber": "dlh1339"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2b",
        "delay": 8,
        "scheduledTime": "2022-06-18t14:35:00.000",
        "estimatedTime": "2022-06-18t14:35:00.000",
        "actualTime": "2022-06-18t14:43:00.000",
        "estimatedRunway": "2022-06-18t14:43:00.000",
        "actualRunway": "2022-06-18t14:43:00.000"
    },
    "arrival": {
        "iataCode": "tgd",
        "icaoCode": "lypg",
        "scheduledTime": "2022-06-18t15:55:00.000",
        "estimatedTime": "2022-06-18t15:39:00.000"
    },
    "airline": {
        "name": "wizz air",
        "iataCode": "w6",
        "icaoCode": "wzz"
    },
    "flight": {
        "number": "2231",
        "iataNumber": "w62231",
        "icaoNumber": "wzz2231"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2b",
        "delay": 51,
        "scheduledTime": "2022-06-18t14:40:00.000",
        "estimatedTime": "2022-06-18t15:31:00.000"
    },
    "arrival": {
        "iataCode": "skg",
        "icaoCode": "lgts",
        "gate": "a15",
        "scheduledTime": "2022-06-18t17:15:00.000"
    },
    "airline": {
        "name": "ryanair",
        "iataCode": "fr",
        "icaoCode": "ryr"
    },
    "flight": {
        "number": "5250",
        "iataNumber": "fr5250",
        "icaoNumber": "ryr5250"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2a",
        "gate": "a4",
        "delay": 25,
        "scheduledTime": "2022-06-18t14:40:00.000",
        "estimatedTime": "2022-06-18t15:05:00.000"
    },
    "arrival": {
        "iataCode": "zrh",
        "icaoCode": "lszh",
        "terminal": "1",
        "scheduledTime": "2022-06-18t16:20:00.000"
    },
    "airline": {
        "name": "tap air portugal",
        "iataCode": "tp",
        "icaoCode": "tap"
    },
    "flight": {
        "number": "8197",
        "iataNumber": "tp8197",
        "icaoNumber": "tap8197"
    },
    "codeshared": {
        "airline": {
            "name": "helvetic airways",
            "iataCode": "2l",
            "icaoCode": "oaw"
        },
        "flight": {
            "number": "2255",
            "iataNumber": "2l2255",
            "icaoNumber": "oaw2255"
        }
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2a",
        "gate": "a4",
        "delay": 25,
        "scheduledTime": "2022-06-18t14:40:00.000",
        "estimatedTime": "2022-06-18t15:05:00.000"
    },
    "arrival": {
        "iataCode": "zrh",
        "icaoCode": "lszh",
        "terminal": "1",
        "scheduledTime": "2022-06-18t16:20:00.000"
    },
    "airline": {
        "name": "helvetic airways",
        "iataCode": "2l",
        "icaoCode": "oaw"
    },
    "flight": {
        "number": "2255",
        "iataNumber": "2l2255",
        "icaoNumber": "oaw2255"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2b",
        "delay": 45,
        "scheduledTime": "2022-06-18t14:55:00.000",
        "estimatedTime": "2022-06-18t15:40:00.000"
    },
    "arrival": {
        "iataCode": "nap",
        "icaoCode": "lirn",
        "scheduledTime": "2022-06-18t16:40:00.000"
    },
    "airline": {
        "name": "wizz air",
        "iataCode": "w6",
        "icaoCode": "wzz"
    },
    "flight": {
        "number": "2359",
        "iataNumber": "w62359",
        "icaoNumber": "wzz2359"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2b",
        "delay": 14,
        "scheduledTime": "2022-06-18t15:10:00.000",
        "estimatedTime": "2022-06-18t15:10:00.000",
        "actualTime": "2022-06-18t15:23:00.000",
        "estimatedRunway": "2022-06-18t15:23:00.000",
        "actualRunway": "2022-06-18t15:23:00.000"
    },
    "arrival": {
        "iataCode": "skg",
        "icaoCode": "lgts",
        "scheduledTime": "2022-06-18t17:50:00.000",
        "estimatedTime": "2022-06-18t17:34:00.000"
    },
    "airline": {
        "name": "wizz air",
        "iataCode": "w6",
        "icaoCode": "wzz"
    },
    "flight": {
        "number": "2447",
        "iataNumber": "w62447",
        "icaoNumber": "wzz2447"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2b",
        "delay": 4,
        "scheduledTime": "2022-06-18t15:15:00.000",
        "estimatedTime": "2022-06-18t15:15:00.000",
        "actualTime": "2022-06-18t15:19:00.000",
        "estimatedRunway": "2022-06-18t15:19:00.000",
        "actualRunway": "2022-06-18t15:19:00.000"
    },
    "arrival": {
        "iataCode": "prg",
        "icaoCode": "lkpr",
        "terminal": "2",
        "baggage": "21",
        "scheduledTime": "2022-06-18t16:25:00.000",
        "estimatedTime": "2022-06-18t16:13:00.000"
    },
    "airline": {
        "name": "ryanair",
        "iataCode": "fr",
        "icaoCode": "ryr"
    },
    "flight": {
        "number": "4091",
        "iataNumber": "fr4091",
        "icaoNumber": "ryr4091"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2b",
        "delay": 45,
        "scheduledTime": "2022-06-18t15:20:00.000",
        "estimatedTime": "2022-06-18t16:05:00.000"
    },
    "arrival": {
        "iataCode": "sof",
        "icaoCode": "lbsf",
        "terminal": "2",
        "scheduledTime": "2022-06-18t17:40:00.000"
    },
    "airline": {
        "name": "ryanair",
        "iataCode": "fr",
        "icaoCode": "ryr"
    },
    "flight": {
        "number": "5570",
        "iataNumber": "fr5570",
        "icaoNumber": "ryr5570"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2b",
        "scheduledTime": "2022-06-18t15:30:00.000",
        "estimatedTime": "2022-06-18t15:30:00.000"
    },
    "arrival": {
        "iataCode": "cph",
        "icaoCode": "ekch",
        "terminal": "2",
        "scheduledTime": "2022-06-18t17:25:00.000"
    },
    "airline": {
        "name": "ryanair",
        "iataCode": "fr",
        "icaoCode": "ryr"
    },
    "flight": {
        "number": "605",
        "iataNumber": "fr605",
        "icaoNumber": "ryr605"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2b",
        "delay": 75,
        "scheduledTime": "2022-06-18t15:30:00.000",
        "estimatedTime": "2022-06-18t16:45:00.000"
    },
    "arrival": {
        "iataCode": "kef",
        "icaoCode": "bikf",
        "scheduledTime": "2022-06-18t18:15:00.000"
    },
    "airline": {
        "name": "wizz air",
        "iataCode": "w6",
        "icaoCode": "wzz"
    },
    "flight": {
        "number": "2427",
        "iataNumber": "w62427",
        "icaoNumber": "wzz2427"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2b",
        "scheduledTime": "2022-06-18t15:35:00.000",
        "estimatedTime": "2022-06-18t15:35:00.000"
    },
    "arrival": {
        "iataCode": "ayt",
        "icaoCode": "ltai",
        "terminal": "1",
        "scheduledTime": "2022-06-18t19:05:00.000"
    },
    "airline": {
        "name": "skyup airlines",
        "iataCode": "pq",
        "icaoCode": "sqp"
    },
    "flight": {
        "number": "618",
        "iataNumber": "pq618",
        "icaoNumber": "sqp618"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2a",
        "scheduledTime": "2022-06-18t15:40:00.000",
        "estimatedTime": "2022-06-18t15:40:00.000"
    },
    "arrival": {
        "iataCode": "hrg",
        "icaoCode": "hegn",
        "terminal": "2",
        "scheduledTime": "2022-06-18t19:25:00.000"
    },
    "airline": {
        "name": "egyptair",
        "iataCode": "ms",
        "icaoCode": "msr"
    },
    "flight": {
        "number": "752",
        "iataNumber": "ms752",
        "icaoNumber": "msr752"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2b",
        "delay": 20,
        "scheduledTime": "2022-06-18t16:00:00.000",
        "estimatedTime": "2022-06-18t16:00:00.000",
        "actualTime": "2022-06-18t16:19:00.000",
        "estimatedRunway": "2022-06-18t16:19:00.000",
        "actualRunway": "2022-06-18t16:19:00.000"
    },
    "arrival": {
        "iataCode": "amm",
        "icaoCode": "ojai",
        "gate": "b20",
        "delay": 3,
        "scheduledTime": "2022-06-18t20:20:00.000",
        "estimatedTime": "2022-06-18t20:23:00.000"
    },
    "airline": {
        "name": "ryanair",
        "iataCode": "fr",
        "icaoCode": "ryr"
    },
    "flight": {
        "number": "5097",
        "iataNumber": "fr5097",
        "icaoNumber": "ryr5097"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2b",
        "delay": 27,
        "scheduledTime": "2022-06-18t16:10:00.000",
        "estimatedTime": "2022-06-18t16:10:00.000",
        "actualTime": "2022-06-18t16:36:00.000",
        "estimatedRunway": "2022-06-18t16:36:00.000",
        "actualRunway": "2022-06-18t16:36:00.000"
    },
    "arrival": {
        "iataCode": "tlv",
        "icaoCode": "llbg",
        "terminal": "1",
        "delay": 7,
        "scheduledTime": "2022-06-18t20:25:00.000",
        "estimatedTime": "2022-06-18t20:31:00.000"
    },
    "airline": {
        "name": "wizz air",
        "iataCode": "w6",
        "icaoCode": "wzz"
    },
    "flight": {
        "number": "2327",
        "iataNumber": "w62327",
        "icaoNumber": "wzz2327"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2b",
        "delay": 150,
        "scheduledTime": "2022-06-18t16:20:00.000",
        "estimatedTime": "2022-06-18t18:50:00.000"
    },
    "arrival": {
        "iataCode": "agp",
        "icaoCode": "lemg",
        "scheduledTime": "2022-06-18t20:05:00.000"
    },
    "airline": {
        "name": "wizz air",
        "iataCode": "w6",
        "icaoCode": "wzz"
    },
    "flight": {
        "number": "2389",
        "iataNumber": "w62389",
        "icaoNumber": "wzz2389"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2b",
        "delay": 18,
        "scheduledTime": "2022-06-18t16:25:00.000",
        "estimatedTime": "2022-06-18t16:25:00.000",
        "actualTime": "2022-06-18t16:42:00.000",
        "estimatedRunway": "2022-06-18t16:42:00.000",
        "actualRunway": "2022-06-18t16:42:00.000"
    },
    "arrival": {
        "iataCode": "dub",
        "icaoCode": "eidw",
        "terminal": "1",
        "gate": "110",
        "delay": 4,
        "scheduledTime": "2022-06-18t18:30:00.000",
        "estimatedTime": "2022-06-18t18:33:00.000"
    },
    "airline": {
        "name": "ryanair",
        "iataCode": "fr",
        "icaoCode": "ryr"
    },
    "flight": {
        "number": "1024",
        "iataNumber": "fr1024",
        "icaoNumber": "ryr1024"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2b",
        "delay": 6,
        "scheduledTime": "2022-06-18t16:25:00.000",
        "estimatedTime": "2022-06-18t16:25:00.000",
        "actualTime": "2022-06-18t16:31:00.000",
        "estimatedRunway": "2022-06-18t16:31:00.000",
        "actualRunway": "2022-06-18t16:31:00.000"
    },
    "arrival": {
        "iataCode": "agp",
        "icaoCode": "lemg",
        "scheduledTime": "2022-06-18t20:00:00.000",
        "estimatedTime": "2022-06-18t19:46:00.000"
    },
    "airline": {
        "name": "ryanair",
        "iataCode": "fr",
        "icaoCode": "ryr"
    },
    "flight": {
        "number": "2273",
        "iataNumber": "fr2273",
        "icaoNumber": "ryr2273"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2b",
        "delay": 15,
        "scheduledTime": "2022-06-18t16:35:00.000",
        "estimatedTime": "2022-06-18t16:35:00.000",
        "actualTime": "2022-06-18t16:50:00.000",
        "estimatedRunway": "2022-06-18t16:50:00.000",
        "actualRunway": "2022-06-18t16:50:00.000"
    },
    "arrival": {
        "iataCode": "doh",
        "icaoCode": "othh",
        "scheduledTime": "2022-06-18t22:45:00.000",
        "estimatedTime": "2022-06-18t22:41:00.000"
    },
    "airline": {
        "name": "srilankan airlines",
        "iataCode": "ul",
        "icaoCode": "alk"
    },
    "flight": {
        "number": "3105",
        "iataNumber": "ul3105",
        "icaoNumber": "alk3105"
    },
    "codeshared": {
        "airline": {
            "name": "qatar airways",
            "iataCode": "qr",
            "icaoCode": "qtr"
        },
        "flight": {
            "number": "200",
            "iataNumber": "qr200",
            "icaoNumber": "qtr200"
        }
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2b",
        "delay": 15,
        "scheduledTime": "2022-06-18t16:35:00.000",
        "estimatedTime": "2022-06-18t16:35:00.000",
        "actualTime": "2022-06-18t16:50:00.000",
        "estimatedRunway": "2022-06-18t16:50:00.000",
        "actualRunway": "2022-06-18t16:50:00.000"
    },
    "arrival": {
        "iataCode": "doh",
        "icaoCode": "othh",
        "scheduledTime": "2022-06-18t22:45:00.000",
        "estimatedTime": "2022-06-18t22:41:00.000"
    },
    "airline": {
        "name": "finnair",
        "iataCode": "ay",
        "icaoCode": "fin"
    },
    "flight": {
        "number": "6703",
        "iataNumber": "ay6703",
        "icaoNumber": "fin6703"
    },
    "codeshared": {
        "airline": {
            "name": "qatar airways",
            "iataCode": "qr",
            "icaoCode": "qtr"
        },
        "flight": {
            "number": "200",
            "iataNumber": "qr200",
            "icaoNumber": "qtr200"
        }
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2b",
        "delay": 15,
        "scheduledTime": "2022-06-18t16:35:00.000",
        "estimatedTime": "2022-06-18t16:35:00.000",
        "actualTime": "2022-06-18t16:50:00.000",
        "estimatedRunway": "2022-06-18t16:50:00.000",
        "actualRunway": "2022-06-18t16:50:00.000"
    },
    "arrival": {
        "iataCode": "doh",
        "icaoCode": "othh",
        "scheduledTime": "2022-06-18t22:45:00.000",
        "estimatedTime": "2022-06-18t22:41:00.000"
    },
    "airline": {
        "name": "qatar airways",
        "iataCode": "qr",
        "icaoCode": "qtr"
    },
    "flight": {
        "number": "200",
        "iataNumber": "qr200",
        "icaoNumber": "qtr200"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "delay": 11,
        "scheduledTime": "2022-06-18t07:45:00.000",
        "estimatedTime": "2022-06-18t07:55:00.000",
        "actualTime": "2022-06-18t07:56:00.000",
        "estimatedRunway": "2022-06-18t07:56:00.000",
        "actualRunway": "2022-06-18t07:56:00.000"
    },
    "arrival": {
        "iataCode": "arw",
        "icaoCode": "lrar",
        "scheduledTime": "2022-06-18t09:33:00.000",
        "estimatedTime": "2022-06-18t09:31:00.000"
    },
    "airline": {
        "name": "jetstream",
        "iataCode": "",
        "icaoCode": "jsh"
    },
    "flight": {
        "number": "900",
        "iataNumber": "",
        "icaoNumber": "jsh900"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "delay": 17,
        "scheduledTime": "2022-06-18t08:20:00.000",
        "estimatedTime": "2022-06-18t08:30:00.000",
        "actualTime": "2022-06-18t08:37:00.000",
        "estimatedRunway": "2022-06-18t08:37:00.000",
        "actualRunway": "2022-06-18t08:37:00.000"
    },
    "arrival": {
        "iataCode": "bjv",
        "icaoCode": "ltfe",
        "delay": 11,
        "scheduledTime": "2022-06-18t11:23:00.000",
        "estimatedTime": "2022-06-18t11:34:00.000"
    },
    "airline": {
        "name": "jetstream",
        "iataCode": "",
        "icaoCode": "jsh"
    },
    "flight": {
        "number": "200",
        "iataNumber": "",
        "icaoNumber": "jsh200"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2b",
        "scheduledTime": "2022-06-18t16:40:00.000",
        "estimatedTime": "2022-06-18t16:40:00.000"
    },
    "arrival": {
        "iataCode": "stn",
        "icaoCode": "egss",
        "gate": "46",
        "scheduledTime": "2022-06-18t18:10:00.000"
    },
    "airline": {
        "name": "ryanair",
        "iataCode": "fr",
        "icaoCode": "ryr"
    },
    "flight": {
        "number": "3718",
        "iataNumber": "fr3718",
        "icaoNumber": "ryr3718"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2a",
        "gate": "a2",
        "delay": 12,
        "scheduledTime": "2022-06-18t16:50:00.000",
        "estimatedTime": "2022-06-18t16:50:00.000",
        "actualTime": "2022-06-18t17:02:00.000",
        "estimatedRunway": "2022-06-18t17:02:00.000",
        "actualRunway": "2022-06-18t17:02:00.000"
    },
    "arrival": {
        "iataCode": "vie",
        "icaoCode": "loww",
        "terminal": "3",
        "baggage": "05",
        "scheduledTime": "2022-06-18t17:40:00.000",
        "estimatedTime": "2022-06-18t17:34:00.000",
        "actualTime": "2022-06-18t17:32:00.000",
        "estimatedRunway": "2022-06-18t17:32:00.000",
        "actualRunway": "2022-06-18t17:32:00.000"
    },
    "airline": {
        "name": "luxair",
        "iataCode": "lg",
        "icaoCode": "lgl"
    },
    "flight": {
        "number": "1722",
        "iataNumber": "lg1722",
        "icaoNumber": "lgl1722"
    },
    "codeshared": {
        "airline": {
            "name": "austrian",
            "iataCode": "os",
            "icaoCode": "aua"
        },
        "flight": {
            "number": "722",
            "iataNumber": "os722",
            "icaoNumber": "aua722"
        }
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2a",
        "gate": "a2",
        "delay": 12,
        "scheduledTime": "2022-06-18t16:50:00.000",
        "estimatedTime": "2022-06-18t16:50:00.000",
        "actualTime": "2022-06-18t17:02:00.000",
        "estimatedRunway": "2022-06-18t17:02:00.000",
        "actualRunway": "2022-06-18t17:02:00.000"
    },
    "arrival": {
        "iataCode": "vie",
        "icaoCode": "loww",
        "terminal": "3",
        "baggage": "05",
        "scheduledTime": "2022-06-18t17:40:00.000",
        "estimatedTime": "2022-06-18t17:34:00.000",
        "actualTime": "2022-06-18t17:32:00.000",
        "estimatedRunway": "2022-06-18t17:32:00.000",
        "actualRunway": "2022-06-18t17:32:00.000"
    },
    "airline": {
        "name": "tap air portugal",
        "iataCode": "tp",
        "icaoCode": "tap"
    },
    "flight": {
        "number": "8734",
        "iataNumber": "tp8734",
        "icaoNumber": "tap8734"
    },
    "codeshared": {
        "airline": {
            "name": "austrian",
            "iataCode": "os",
            "icaoCode": "aua"
        },
        "flight": {
            "number": "722",
            "iataNumber": "os722",
            "icaoNumber": "aua722"
        }
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2a",
        "gate": "a2",
        "delay": 12,
        "scheduledTime": "2022-06-18t16:50:00.000",
        "estimatedTime": "2022-06-18t16:50:00.000",
        "actualTime": "2022-06-18t17:02:00.000",
        "estimatedRunway": "2022-06-18t17:02:00.000",
        "actualRunway": "2022-06-18t17:02:00.000"
    },
    "arrival": {
        "iataCode": "vie",
        "icaoCode": "loww",
        "terminal": "3",
        "baggage": "05",
        "scheduledTime": "2022-06-18t17:40:00.000",
        "estimatedTime": "2022-06-18t17:34:00.000",
        "actualTime": "2022-06-18t17:32:00.000",
        "estimatedRunway": "2022-06-18t17:32:00.000",
        "actualRunway": "2022-06-18t17:32:00.000"
    },
    "airline": {
        "name": "austrian",
        "iataCode": "os",
        "icaoCode": "aua"
    },
    "flight": {
        "number": "722",
        "iataNumber": "os722",
        "icaoNumber": "aua722"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "delay": 10,
        "scheduledTime": "2022-06-18t14:30:00.000",
        "estimatedTime": "2022-06-18t14:40:00.000"
    },
    "arrival": {
        "iataCode": "tiv",
        "icaoCode": "lytv",
        "scheduledTime": "2022-06-18t15:34:00.000"
    },
    "airline": {
        "name": "jetstream",
        "iataCode": "",
        "icaoCode": "jsh"
    },
    "flight": {
        "number": "700",
        "iataNumber": "",
        "icaoNumber": "jsh700"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2b",
        "delay": 4,
        "scheduledTime": "2022-06-18t17:00:00.000",
        "estimatedTime": "2022-06-18t17:00:00.000",
        "actualTime": "2022-06-18t17:04:00.000",
        "estimatedRunway": "2022-06-18t17:04:00.000",
        "actualRunway": "2022-06-18t17:04:00.000"
    },
    "arrival": {
        "iataCode": "pmi",
        "icaoCode": "lepa",
        "baggage": "12",
        "scheduledTime": "2022-06-18t19:40:00.000",
        "estimatedTime": "2022-06-18t19:08:00.000"
    },
    "airline": {
        "name": "smartwings",
        "iataCode": "qs",
        "icaoCode": "tvs"
    },
    "flight": {
        "number": "5152",
        "iataNumber": "qs5152",
        "icaoNumber": "tvs5152"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2a",
        "gate": "a8",
        "delay": 15,
        "scheduledTime": "2022-06-18t17:05:00.000",
        "estimatedTime": "2022-06-18t17:05:00.000",
        "actualTime": "2022-06-18t17:20:00.000",
        "estimatedRunway": "2022-06-18t17:20:00.000",
        "actualRunway": "2022-06-18t17:20:00.000"
    },
    "arrival": {
        "iataCode": "ams",
        "icaoCode": "eham",
        "terminal": "2",
        "baggage": "11",
        "gate": "d83",
        "scheduledTime": "2022-06-18t19:15:00.000",
        "estimatedTime": "2022-06-18t19:01:00.000"
    },
    "airline": {
        "name": "xiamen airlines",
        "iataCode": "mf",
        "icaoCode": "cxa"
    },
    "flight": {
        "number": "9776",
        "iataNumber": "mf9776",
        "icaoNumber": "cxa9776"
    },
    "codeshared": {
        "airline": {
            "name": "klm",
            "iataCode": "kl",
            "icaoCode": "klm"
        },
        "flight": {
            "number": "1978",
            "iataNumber": "kl1978",
            "icaoNumber": "klm1978"
        }
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2a",
        "gate": "a8",
        "delay": 15,
        "scheduledTime": "2022-06-18t17:05:00.000",
        "estimatedTime": "2022-06-18t17:05:00.000",
        "actualTime": "2022-06-18t17:20:00.000",
        "estimatedRunway": "2022-06-18t17:20:00.000",
        "actualRunway": "2022-06-18t17:20:00.000"
    },
    "arrival": {
        "iataCode": "ams",
        "icaoCode": "eham",
        "terminal": "2",
        "baggage": "11",
        "gate": "d83",
        "scheduledTime": "2022-06-18t19:15:00.000",
        "estimatedTime": "2022-06-18t19:01:00.000"
    },
    "airline": {
        "name": "klm",
        "iataCode": "kl",
        "icaoCode": "klm"
    },
    "flight": {
        "number": "1978",
        "iataNumber": "kl1978",
        "icaoNumber": "klm1978"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2a",
        "gate": "a5",
        "delay": 60,
        "scheduledTime": "2022-06-18t17:30:00.000",
        "estimatedTime": "2022-06-18t18:30:00.000"
    },
    "arrival": {
        "iataCode": "muc",
        "icaoCode": "eddm",
        "terminal": "2",
        "gate": "g42",
        "scheduledTime": "2022-06-18t18:45:00.000"
    },
    "airline": {
        "name": "tap air portugal",
        "iataCode": "tp",
        "icaoCode": "tap"
    },
    "flight": {
        "number": "7975",
        "iataNumber": "tp7975",
        "icaoNumber": "tap7975"
    },
    "codeshared": {
        "airline": {
            "name": "air dolomiti",
            "iataCode": "en",
            "icaoCode": "dla"
        },
        "flight": {
            "number": "1679",
            "iataNumber": "en1679",
            "icaoNumber": "dla1679"
        }
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2a",
        "gate": "a5",
        "delay": 60,
        "scheduledTime": "2022-06-18t17:30:00.000",
        "estimatedTime": "2022-06-18t18:30:00.000"
    },
    "arrival": {
        "iataCode": "muc",
        "icaoCode": "eddm",
        "terminal": "2",
        "gate": "g42",
        "scheduledTime": "2022-06-18t18:45:00.000"
    },
    "airline": {
        "name": "air dolomiti",
        "iataCode": "en",
        "icaoCode": "dla"
    },
    "flight": {
        "number": "1679",
        "iataNumber": "en1679",
        "icaoNumber": "dla1679"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "delay": 10,
        "scheduledTime": "2022-06-18t07:40:00.000",
        "estimatedTime": "2022-06-18t07:50:00.000",
        "actualTime": "2022-06-18t07:49:00.000",
        "estimatedRunway": "2022-06-18t07:49:00.000",
        "actualRunway": "2022-06-18t07:49:00.000"
    },
    "arrival": {
        "iataCode": "ibz",
        "icaoCode": "leib",
        "scheduledTime": "2022-06-18t10:21:00.000",
        "estimatedTime": "2022-06-18t10:17:00.000"
    },
    "airline": {
        "name": "vistajet",
        "iataCode": "",
        "icaoCode": "vjt"
    },
    "flight": {
        "number": "683",
        "iataNumber": "",
        "icaoNumber": "vjt683"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "delay": 13,
        "scheduledTime": "2022-06-18t10:10:00.000",
        "estimatedTime": "2022-06-18t10:20:00.000",
        "actualTime": "2022-06-18t10:22:00.000",
        "estimatedRunway": "2022-06-18t10:22:00.000",
        "actualRunway": "2022-06-18t10:22:00.000"
    },
    "arrival": {
        "iataCode": "ayt",
        "icaoCode": "ltai",
        "delay": 7,
        "scheduledTime": "2022-06-18t13:20:00.000",
        "estimatedTime": "2022-06-18t13:27:00.000"
    },
    "airline": {
        "name": "pegasus",
        "iataCode": "pc",
        "icaoCode": "pgt"
    },
    "flight": {
        "number": "6002",
        "iataNumber": "pc6002",
        "icaoNumber": "pgt6002"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2b",
        "delay": 195,
        "scheduledTime": "2022-06-18t17:50:00.000",
        "estimatedTime": "2022-06-18t21:05:00.000"
    },
    "arrival": {
        "iataCode": "lhr",
        "icaoCode": "egll",
        "terminal": "3",
        "scheduledTime": "2022-06-18t19:30:00.000"
    },
    "airline": {
        "name": "qantas",
        "iataCode": "qf",
        "icaoCode": "qfa"
    },
    "flight": {
        "number": "3505",
        "iataNumber": "qf3505",
        "icaoNumber": "qfa3505"
    },
    "codeshared": {
        "airline": {
            "name": "finnair",
            "iataCode": "ay",
            "icaoCode": "fin"
        },
        "flight": {
            "number": "875",
            "iataNumber": "ay875",
            "icaoNumber": "fin875"
        }
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2b",
        "delay": 195,
        "scheduledTime": "2022-06-18t17:50:00.000",
        "estimatedTime": "2022-06-18t21:05:00.000"
    },
    "arrival": {
        "iataCode": "lhr",
        "icaoCode": "egll",
        "terminal": "3",
        "scheduledTime": "2022-06-18t19:30:00.000"
    },
    "airline": {
        "name": "finnair",
        "iataCode": "ay",
        "icaoCode": "fin"
    },
    "flight": {
        "number": "875",
        "iataNumber": "ay875",
        "icaoNumber": "fin875"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2b",
        "delay": 24,
        "scheduledTime": "2022-06-18t17:55:00.000",
        "estimatedTime": "2022-06-18t17:55:00.000",
        "actualTime": "2022-06-18t18:18:00.000",
        "estimatedRunway": "2022-06-18t18:18:00.000",
        "actualRunway": "2022-06-18t18:18:00.000"
    },
    "arrival": {
        "iataCode": "lpl",
        "icaoCode": "eggp",
        "delay": 3,
        "scheduledTime": "2022-06-18t19:50:00.000",
        "estimatedTime": "2022-06-18t19:52:00.000"
    },
    "airline": {
        "name": "wizz air",
        "iataCode": "w6",
        "icaoCode": "wzz"
    },
    "flight": {
        "number": "2211",
        "iataNumber": "w62211",
        "icaoNumber": "wzz2211"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2b",
        "delay": 12,
        "scheduledTime": "2022-06-18t18:00:00.000",
        "estimatedTime": "2022-06-18t18:00:00.000",
        "actualTime": "2022-06-18t18:12:00.000",
        "estimatedRunway": "2022-06-18t18:12:00.000",
        "actualRunway": "2022-06-18t18:12:00.000"
    },
    "arrival": {
        "iataCode": "pmi",
        "icaoCode": "lepa",
        "baggage": "19",
        "gate": "a12",
        "scheduledTime": "2022-06-18t20:35:00.000",
        "estimatedTime": "2022-06-18t20:29:00.000"
    },
    "airline": {
        "name": "ryanair",
        "iataCode": "fr",
        "icaoCode": "ryr"
    },
    "flight": {
        "number": "4595",
        "iataNumber": "fr4595",
        "icaoNumber": "ryr4595"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2b",
        "delay": 35,
        "scheduledTime": "2022-06-18t18:05:00.000",
        "estimatedTime": "2022-06-18t18:40:00.000"
    },
    "arrival": {
        "iataCode": "ltn",
        "icaoCode": "eggw",
        "scheduledTime": "2022-06-18t19:45:00.000"
    },
    "airline": {
        "name": "wizz air",
        "iataCode": "w6",
        "icaoCode": "wzz"
    },
    "flight": {
        "number": "2207",
        "iataNumber": "w62207",
        "icaoNumber": "wzz2207"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2a",
        "delay": 30,
        "scheduledTime": "2022-06-18t18:15:00.000",
        "estimatedTime": "2022-06-18t18:45:00.000"
    },
    "arrival": {
        "iataCode": "ath",
        "icaoCode": "lgav",
        "scheduledTime": "2022-06-18t21:10:00.000"
    },
    "airline": {
        "name": "air baltic",
        "iataCode": "bt",
        "icaoCode": "bti"
    },
    "flight": {
        "number": "5411",
        "iataNumber": "bt5411",
        "icaoNumber": "bti5411"
    },
    "codeshared": {
        "airline": {
            "name": "aegean airlines",
            "iataCode": "a3",
            "icaoCode": "aee"
        },
        "flight": {
            "number": "879",
            "iataNumber": "a3879",
            "icaoNumber": "aee879"
        }
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2a",
        "delay": 30,
        "scheduledTime": "2022-06-18t18:15:00.000",
        "estimatedTime": "2022-06-18t18:45:00.000"
    },
    "arrival": {
        "iataCode": "ath",
        "icaoCode": "lgav",
        "scheduledTime": "2022-06-18t21:10:00.000"
    },
    "airline": {
        "name": "lot - polish airlines",
        "iataCode": "lo",
        "icaoCode": "lot"
    },
    "flight": {
        "number": "5605",
        "iataNumber": "lo5605",
        "icaoNumber": "lot5605"
    },
    "codeshared": {
        "airline": {
            "name": "aegean airlines",
            "iataCode": "a3",
            "icaoCode": "aee"
        },
        "flight": {
            "number": "879",
            "iataNumber": "a3879",
            "icaoNumber": "aee879"
        }
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2a",
        "delay": 30,
        "scheduledTime": "2022-06-18t18:15:00.000",
        "estimatedTime": "2022-06-18t18:45:00.000"
    },
    "arrival": {
        "iataCode": "ath",
        "icaoCode": "lgav",
        "scheduledTime": "2022-06-18t21:10:00.000"
    },
    "airline": {
        "name": "aegean airlines",
        "iataCode": "a3",
        "icaoCode": "aee"
    },
    "flight": {
        "number": "879",
        "iataNumber": "a3879",
        "icaoNumber": "aee879"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2b",
        "delay": 16,
        "scheduledTime": "2022-06-18t18:15:00.000",
        "estimatedTime": "2022-06-18t18:15:00.000",
        "actualTime": "2022-06-18t18:31:00.000",
        "estimatedRunway": "2022-06-18t18:31:00.000",
        "actualRunway": "2022-06-18t18:31:00.000"
    },
    "arrival": {
        "iataCode": "bcn",
        "icaoCode": "lebl",
        "terminal": "2",
        "baggage": "26",
        "scheduledTime": "2022-06-18t20:55:00.000",
        "estimatedTime": "2022-06-18t20:44:00.000"
    },
    "airline": {
        "name": "wizz air",
        "iataCode": "w6",
        "icaoCode": "wzz"
    },
    "flight": {
        "number": "2377",
        "iataNumber": "w62377",
        "icaoNumber": "wzz2377"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2b",
        "delay": 11,
        "scheduledTime": "2022-06-18t18:25:00.000",
        "estimatedTime": "2022-06-18t18:25:00.000",
        "actualTime": "2022-06-18t18:35:00.000",
        "estimatedRunway": "2022-06-18t18:35:00.000",
        "actualRunway": "2022-06-18t18:35:00.000"
    },
    "arrival": {
        "iataCode": "aho",
        "icaoCode": "liea",
        "gate": "a16",
        "scheduledTime": "2022-06-18t20:30:00.000",
        "estimatedTime": "2022-06-18t20:18:00.000"
    },
    "airline": {
        "name": "ryanair",
        "iataCode": "fr",
        "icaoCode": "ryr"
    },
    "flight": {
        "number": "4752",
        "iataNumber": "fr4752",
        "icaoNumber": "ryr4752"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2b",
        "delay": 30,
        "scheduledTime": "2022-06-18t18:30:00.000",
        "estimatedTime": "2022-06-18t19:00:00.000"
    },
    "arrival": {
        "iataCode": "crl",
        "icaoCode": "ebci",
        "scheduledTime": "2022-06-18t20:30:00.000"
    },
    "airline": {
        "name": "ryanair",
        "iataCode": "fr",
        "icaoCode": "ryr"
    },
    "flight": {
        "number": "8415",
        "iataNumber": "fr8415",
        "icaoNumber": "ryr8415"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2a",
        "delay": 26,
        "scheduledTime": "2022-06-18t18:30:00.000",
        "estimatedTime": "2022-06-18t18:30:00.000",
        "actualTime": "2022-06-18t18:56:00.000",
        "estimatedRunway": "2022-06-18t18:56:00.000",
        "actualRunway": "2022-06-18t18:56:00.000"
    },
    "arrival": {
        "iataCode": "waw",
        "icaoCode": "epwa",
        "baggage": "4",
        "delay": 1,
        "scheduledTime": "2022-06-18t19:50:00.000",
        "estimatedTime": "2022-06-18t19:50:00.000"
    },
    "airline": {
        "name": "lot - polish airlines",
        "iataCode": "lo",
        "icaoCode": "lot"
    },
    "flight": {
        "number": "538",
        "iataNumber": "lo538",
        "icaoNumber": "lot538"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2b",
        "delay": 42,
        "scheduledTime": "2022-06-18t18:30:00.000",
        "estimatedTime": "2022-06-18t18:59:00.000",
        "actualTime": "2022-06-18t19:12:00.000",
        "estimatedRunway": "2022-06-18t19:12:00.000",
        "actualRunway": "2022-06-18t19:12:00.000"
    },
    "arrival": {
        "iataCode": "ory",
        "icaoCode": "lfpo",
        "terminal": "orly",
        "baggage": "04",
        "delay": 27,
        "scheduledTime": "2022-06-18t20:45:00.000",
        "estimatedTime": "2022-06-18t21:12:00.000"
    },
    "airline": {
        "name": "wizz air",
        "iataCode": "w6",
        "icaoCode": "wzz"
    },
    "flight": {
        "number": "2367",
        "iataNumber": "w62367",
        "icaoNumber": "wzz2367"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2b",
        "delay": 46,
        "scheduledTime": "2022-06-18t18:35:00.000",
        "estimatedTime": "2022-06-18t19:21:00.000"
    },
    "arrival": {
        "iataCode": "dxb",
        "icaoCode": "omdb",
        "terminal": "3",
        "baggage": "309",
        "scheduledTime": "2022-06-19t01:55:00.000"
    },
    "airline": {
        "name": "emirates",
        "iataCode": "ek",
        "icaoCode": "uae"
    },
    "flight": {
        "number": "2025",
        "iataNumber": "ek2025",
        "icaoNumber": "uae2025"
    },
    "codeshared": {
        "airline": {
            "name": "flydubai",
            "iataCode": "fz",
            "icaoCode": "fdb"
        },
        "flight": {
            "number": "1408",
            "iataNumber": "fz1408",
            "icaoNumber": "fdb1408"
        }
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2b",
        "delay": 46,
        "scheduledTime": "2022-06-18t18:35:00.000",
        "estimatedTime": "2022-06-18t19:21:00.000"
    },
    "arrival": {
        "iataCode": "dxb",
        "icaoCode": "omdb",
        "terminal": "3",
        "baggage": "309",
        "scheduledTime": "2022-06-19t01:55:00.000"
    },
    "airline": {
        "name": "flydubai",
        "iataCode": "fz",
        "icaoCode": "fdb"
    },
    "flight": {
        "number": "1408",
        "iataNumber": "fz1408",
        "icaoNumber": "fdb1408"
    }
}, {
    "type": "departure",
    "status": "cancelled",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2a",
        "gate": "a2",
        "scheduledTime": "2022-06-18t18:55:00.000",
        "estimatedTime": "2022-06-18t18:55:00.000"
    },
    "arrival": {
        "iataCode": "fra",
        "icaoCode": "eddf",
        "terminal": "1",
        "scheduledTime": "2022-06-18t20:35:00.000"
    },
    "airline": {
        "name": "ethiopian airlines",
        "iataCode": "et",
        "icaoCode": "eth"
    },
    "flight": {
        "number": "1554",
        "iataNumber": "et1554",
        "icaoNumber": "eth1554"
    },
    "codeshared": {
        "airline": {
            "name": "lufthansa",
            "iataCode": "lh",
            "icaoCode": "dlh"
        },
        "flight": {
            "number": "1341",
            "iataNumber": "lh1341",
            "icaoNumber": "dlh1341"
        }
    }
}, {
    "type": "departure",
    "status": "cancelled",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2a",
        "gate": "a2",
        "scheduledTime": "2022-06-18t18:55:00.000",
        "estimatedTime": "2022-06-18t18:55:00.000"
    },
    "arrival": {
        "iataCode": "fra",
        "icaoCode": "eddf",
        "terminal": "1",
        "scheduledTime": "2022-06-18t20:35:00.000"
    },
    "airline": {
        "name": "brussels airlines",
        "iataCode": "sn",
        "icaoCode": "bel"
    },
    "flight": {
        "number": "7146",
        "iataNumber": "sn7146",
        "icaoNumber": "bel7146"
    },
    "codeshared": {
        "airline": {
            "name": "lufthansa",
            "iataCode": "lh",
            "icaoCode": "dlh"
        },
        "flight": {
            "number": "1341",
            "iataNumber": "lh1341",
            "icaoNumber": "dlh1341"
        }
    }
}, {
    "type": "departure",
    "status": "cancelled",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2a",
        "gate": "a2",
        "scheduledTime": "2022-06-18t18:55:00.000",
        "estimatedTime": "2022-06-18t18:55:00.000"
    },
    "arrival": {
        "iataCode": "fra",
        "icaoCode": "eddf",
        "terminal": "1",
        "scheduledTime": "2022-06-18t20:35:00.000"
    },
    "airline": {
        "name": "singapore airlines",
        "iataCode": "sq",
        "icaoCode": "sia"
    },
    "flight": {
        "number": "2147",
        "iataNumber": "sq2147",
        "icaoNumber": "sia2147"
    },
    "codeshared": {
        "airline": {
            "name": "lufthansa",
            "iataCode": "lh",
            "icaoCode": "dlh"
        },
        "flight": {
            "number": "1341",
            "iataNumber": "lh1341",
            "icaoNumber": "dlh1341"
        }
    }
}, {
    "type": "departure",
    "status": "cancelled",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2a",
        "gate": "a2",
        "scheduledTime": "2022-06-18t18:55:00.000",
        "estimatedTime": "2022-06-18t18:55:00.000"
    },
    "arrival": {
        "iataCode": "fra",
        "icaoCode": "eddf",
        "terminal": "1",
        "scheduledTime": "2022-06-18t20:35:00.000"
    },
    "airline": {
        "name": "tap air portugal",
        "iataCode": "tp",
        "icaoCode": "tap"
    },
    "flight": {
        "number": "7971",
        "iataNumber": "tp7971",
        "icaoNumber": "tap7971"
    },
    "codeshared": {
        "airline": {
            "name": "lufthansa",
            "iataCode": "lh",
            "icaoCode": "dlh"
        },
        "flight": {
            "number": "1341",
            "iataNumber": "lh1341",
            "icaoNumber": "dlh1341"
        }
    }
}, {
    "type": "departure",
    "status": "cancelled",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2a",
        "gate": "a2",
        "scheduledTime": "2022-06-18t18:55:00.000",
        "estimatedTime": "2022-06-18t18:55:00.000"
    },
    "arrival": {
        "iataCode": "fra",
        "icaoCode": "eddf",
        "terminal": "1",
        "scheduledTime": "2022-06-18t20:35:00.000"
    },
    "airline": {
        "name": "lufthansa",
        "iataCode": "lh",
        "icaoCode": "dlh"
    },
    "flight": {
        "number": "1341",
        "iataNumber": "lh1341",
        "icaoNumber": "dlh1341"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2b",
        "delay": 17,
        "scheduledTime": "2022-06-18t19:00:00.000",
        "estimatedTime": "2022-06-18t19:00:00.000",
        "actualTime": "2022-06-18t19:16:00.000",
        "estimatedRunway": "2022-06-18t19:16:00.000",
        "actualRunway": "2022-06-18t19:16:00.000"
    },
    "arrival": {
        "iataCode": "hel",
        "icaoCode": "efhk",
        "terminal": "2",
        "baggage": "12",
        "delay": 1,
        "scheduledTime": "2022-06-18t22:20:00.000",
        "estimatedTime": "2022-06-18t22:20:00.000"
    },
    "airline": {
        "name": "finnair",
        "iataCode": "ay",
        "icaoCode": "fin"
    },
    "flight": {
        "number": "1256",
        "iataNumber": "ay1256",
        "icaoNumber": "fin1256"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2b",
        "delay": 26,
        "scheduledTime": "2022-06-18t19:05:00.000",
        "estimatedTime": "2022-06-18t19:21:00.000",
        "actualTime": "2022-06-18t19:31:00.000",
        "estimatedRunway": "2022-06-18t19:31:00.000",
        "actualRunway": "2022-06-18t19:31:00.000"
    },
    "arrival": {
        "iataCode": "amm",
        "icaoCode": "ojai",
        "gate": "216",
        "delay": 6,
        "scheduledTime": "2022-06-18t23:25:00.000",
        "estimatedTime": "2022-06-18t23:30:00.000"
    },
    "airline": {
        "name": "wizz air",
        "iataCode": "w6",
        "icaoCode": "wzz"
    },
    "flight": {
        "number": "2373",
        "iataNumber": "w62373",
        "icaoNumber": "wzz2373"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2b",
        "delay": 35,
        "scheduledTime": "2022-06-18t19:30:00.000",
        "estimatedTime": "2022-06-18t20:05:00.000"
    },
    "arrival": {
        "iataCode": "ibz",
        "icaoCode": "leib",
        "terminal": "1",
        "baggage": "06",
        "scheduledTime": "2022-06-18t22:25:00.000"
    },
    "airline": {
        "name": "wizz air",
        "iataCode": "w6",
        "icaoCode": "wzz"
    },
    "flight": {
        "number": "2381",
        "iataNumber": "w62381",
        "icaoNumber": "wzz2381"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2b",
        "delay": 85,
        "scheduledTime": "2022-06-18t19:30:00.000",
        "estimatedTime": "2022-06-18t20:55:00.000"
    },
    "arrival": {
        "iataCode": "fco",
        "icaoCode": "lirf",
        "terminal": "1",
        "baggage": "24",
        "scheduledTime": "2022-06-18t21:20:00.000"
    },
    "airline": {
        "name": "wizz air",
        "iataCode": "w6",
        "icaoCode": "wzz"
    },
    "flight": {
        "number": "2341",
        "iataNumber": "w62341",
        "icaoNumber": "wzz2341"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2b",
        "delay": 25,
        "scheduledTime": "2022-06-18t19:35:00.000",
        "estimatedTime": "2022-06-18t20:00:00.000"
    },
    "arrival": {
        "iataCode": "lgw",
        "icaoCode": "egkk",
        "terminal": "s",
        "scheduledTime": "2022-06-18t21:15:00.000"
    },
    "airline": {
        "name": "wizz air",
        "iataCode": "w6",
        "icaoCode": "wzz"
    },
    "flight": {
        "number": "2221",
        "iataNumber": "w62221",
        "icaoNumber": "wzz2221"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2b",
        "delay": 21,
        "scheduledTime": "2022-06-18t19:40:00.000",
        "estimatedTime": "2022-06-18t19:40:00.000",
        "actualTime": "2022-06-18t20:00:00.000",
        "estimatedRunway": "2022-06-18t20:00:00.000",
        "actualRunway": "2022-06-18t20:00:00.000"
    },
    "arrival": {
        "iataCode": "mxp",
        "icaoCode": "limc",
        "terminal": "1",
        "scheduledTime": "2022-06-18t21:25:00.000",
        "estimatedTime": "2022-06-18t21:18:00.000"
    },
    "airline": {
        "name": "wizz air",
        "iataCode": "w6",
        "icaoCode": "wzz"
    },
    "flight": {
        "number": "2335",
        "iataNumber": "w62335",
        "icaoNumber": "wzz2335"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2b",
        "delay": 55,
        "scheduledTime": "2022-06-18t20:00:00.000",
        "estimatedTime": "2022-06-18t20:55:00.000"
    },
    "arrival": {
        "iataCode": "trn",
        "icaoCode": "limf",
        "scheduledTime": "2022-06-18t21:45:00.000"
    },
    "airline": {
        "name": "ryanair",
        "iataCode": "fr",
        "icaoCode": "ryr"
    },
    "flight": {
        "number": "5922",
        "iataNumber": "fr5922",
        "icaoNumber": "ryr5922"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2b",
        "delay": 65,
        "scheduledTime": "2022-06-18t20:05:00.000",
        "estimatedTime": "2022-06-18t21:10:00.000"
    },
    "arrival": {
        "iataCode": "rmi",
        "icaoCode": "lipr",
        "scheduledTime": "2022-06-18t21:35:00.000"
    },
    "airline": {
        "name": "ryanair",
        "iataCode": "fr",
        "icaoCode": "ryr"
    },
    "flight": {
        "number": "5254",
        "iataNumber": "fr5254",
        "icaoNumber": "ryr5254"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2b",
        "delay": 14,
        "scheduledTime": "2022-06-18t20:15:00.000",
        "estimatedTime": "2022-06-18t20:15:00.000",
        "actualTime": "2022-06-18t20:28:00.000",
        "estimatedRunway": "2022-06-18t20:28:00.000",
        "actualRunway": "2022-06-18t20:28:00.000"
    },
    "arrival": {
        "iataCode": "bcn",
        "icaoCode": "lebl",
        "terminal": "2",
        "baggage": "23",
        "gate": "a18",
        "scheduledTime": "2022-06-18t22:50:00.000",
        "estimatedTime": "2022-06-18t22:43:00.000"
    },
    "airline": {
        "name": "ryanair",
        "iataCode": "fr",
        "icaoCode": "ryr"
    },
    "flight": {
        "number": "8393",
        "iataNumber": "fr8393",
        "icaoNumber": "ryr8393"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2a",
        "delay": 8,
        "scheduledTime": "2022-06-18t20:25:00.000",
        "estimatedTime": "2022-06-18t20:25:00.000",
        "actualTime": "2022-06-18t20:33:00.000",
        "estimatedRunway": "2022-06-18t20:33:00.000",
        "actualRunway": "2022-06-18t20:33:00.000"
    },
    "arrival": {
        "iataCode": "ist",
        "icaoCode": "ltfm",
        "scheduledTime": "2022-06-18t23:30:00.000",
        "estimatedTime": "2022-06-18t23:09:00.000"
    },
    "airline": {
        "name": "royal jordanian",
        "iataCode": "rj",
        "icaoCode": "rja"
    },
    "flight": {
        "number": "3734",
        "iataNumber": "rj3734",
        "icaoNumber": "rja3734"
    },
    "codeshared": {
        "airline": {
            "name": "turkish airlines",
            "iataCode": "tk",
            "icaoCode": "thy"
        },
        "flight": {
            "number": "1038",
            "iataNumber": "tk1038",
            "icaoNumber": "thy1038"
        }
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2a",
        "delay": 8,
        "scheduledTime": "2022-06-18t20:25:00.000",
        "estimatedTime": "2022-06-18t20:25:00.000",
        "actualTime": "2022-06-18t20:33:00.000",
        "estimatedRunway": "2022-06-18t20:33:00.000",
        "actualRunway": "2022-06-18t20:33:00.000"
    },
    "arrival": {
        "iataCode": "ist",
        "icaoCode": "ltfm",
        "scheduledTime": "2022-06-18t23:30:00.000",
        "estimatedTime": "2022-06-18t23:09:00.000"
    },
    "airline": {
        "name": "turkish airlines",
        "iataCode": "tk",
        "icaoCode": "thy"
    },
    "flight": {
        "number": "1038",
        "iataNumber": "tk1038",
        "icaoNumber": "thy1038"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2b",
        "delay": 25,
        "scheduledTime": "2022-06-18t21:20:00.000",
        "estimatedTime": "2022-06-18t21:45:00.000"
    },
    "arrival": {
        "iataCode": "opo",
        "icaoCode": "lppr",
        "scheduledTime": "2022-06-18t23:55:00.000"
    },
    "airline": {
        "name": "ryanair",
        "iataCode": "fr",
        "icaoCode": "ryr"
    },
    "flight": {
        "number": "8865",
        "iataNumber": "fr8865",
        "icaoNumber": "ryr8865"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2b",
        "delay": 6,
        "scheduledTime": "2022-06-18t22:00:00.000",
        "estimatedTime": "2022-06-18t22:00:00.000",
        "actualTime": "2022-06-18t22:05:00.000",
        "estimatedRunway": "2022-06-18t22:05:00.000",
        "actualRunway": "2022-06-18t22:05:00.000"
    },
    "arrival": {
        "iataCode": "kun",
        "icaoCode": "eyka",
        "scheduledTime": "2022-06-19t00:40:00.000",
        "estimatedTime": "2022-06-19t00:26:00.000"
    },
    "airline": {
        "name": "ryanair",
        "iataCode": "fr",
        "icaoCode": "ryr"
    },
    "flight": {
        "number": "5509",
        "iataNumber": "fr5509",
        "icaoNumber": "ryr5509"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2b",
        "delay": 90,
        "scheduledTime": "2022-06-18t22:15:00.000",
        "estimatedTime": "2022-06-18t23:45:00.000"
    },
    "arrival": {
        "iataCode": "stn",
        "icaoCode": "egss",
        "terminal": "1",
        "scheduledTime": "2022-06-18t23:45:00.000"
    },
    "airline": {
        "name": "ryanair",
        "iataCode": "fr",
        "icaoCode": "ryr"
    },
    "flight": {
        "number": "8369",
        "iataNumber": "fr8369",
        "icaoNumber": "ryr8369"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "scheduledTime": "2022-06-18t22:40:00.000",
        "estimatedTime": "2022-06-18t22:40:00.000",
        "actualTime": "2022-06-18t22:25:00.000",
        "estimatedRunway": "2022-06-18t22:25:00.000",
        "actualRunway": "2022-06-18t22:25:00.000"
    },
    "arrival": {
        "iataCode": "ist",
        "icaoCode": "ltfm",
        "scheduledTime": "2022-06-19t01:40:00.000",
        "estimatedTime": "2022-06-19t00:54:00.000"
    },
    "airline": {
        "name": "uls airlines cargo",
        "iataCode": "go",
        "icaoCode": "kzu"
    },
    "flight": {
        "number": "6328",
        "iataNumber": "go6328",
        "icaoNumber": "kzu6328"
    }
}, {
    "type": "departure",
    "status": "active",
    "departure": {
        "iataCode": "bud",
        "icaoCode": "lhbp",
        "terminal": "2b",
        "delay": 12,
        "scheduledTime": "2022-06-19t00:05:00.000",
        "estimatedTime": "2022-06-19t00:05:00.000",
        "actualTime": "2022-06-19t00:17:00.000",
        "estimatedRunway": "2022-06-19t00:17:00.000",
        "actualRunway": "2022-06-19t00:17:00.000"
    },
    "arrival": {
        "iataCode": "hrg",
        "icaoCode": "hegn",
        "scheduledTime": "2022-06-19t03:50:00.000",
        "estimatedTime": "2022-06-19t03:40:00.000"
    },
    "airline": {
        "name": "smartwings",
        "iataCode": "qs",
        "icaoCode": "tvs"
    },
    "flight": {
        "number": "5298",
        "iataNumber": "qs5298",
        "icaoNumber": "tvs5298"
    }
}]
```
</details>

# Test Coverage

## Unit Test

Unit tests cover basic app logic and services.

![Unit Tests Passing](Unit%20Tests%20Passing%20Screenshot%202022-06-24%20at%2020.01.22.png)

## UI Tests

UI Tests are work-in-progress level coverage of the "happy path" flow without validation of negative cases.

![UI Tests](UI%20Test%20Passing%20Screenshot%202022-06-24%20at%2020.08.13.png)