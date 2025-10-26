/*
6.​ Listar el id del teatro (theaterId), estado (“location.address.state”),
ciudad (“location.address.city”), y coordenadas (“location.geo.coordinates”) de
los teatros que se encuentran en algunos de los estados "CA", "NY", "TX" y el
nombre de la ciudades comienza con una ‘F’. Listar ordenados por estado y
ciudad.
*/

use("mflix")

db.theaters.find(
    {
        "location.address.state": {
            $in: ["CA", "NY", "TX"],
        },
        "location.address.city": /^F/,
    },
    {
        _id: 1,
        theaterId: 1,
        state: "$location.address.state",
        city: "$location.address.city",
        coordinates: "$location.geo.coordinates",
    }
).sort(
    {
        "location.address.state": 1,
        "location.address.city": 1,
    }
)
