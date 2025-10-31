const invalidUsers = [{
    name: "Lorenzo"
},
{
    name: "Lorenzo",
    email: "lorenzoEmailInvalido",
},
{
    name: "Lorenzo",
    email: "lorenzo@email.com",
},
{
    name: "Lorenzo",
    email: "lorenzo@email.com",
    password: 123,
},
{
    name: "Lorenzo",
    email: "lorenzo@email.com",
    password: "contraseña",
}]

const crypto = require("node:crypto")
const { title } = require("node:process")
const uuidToPassword = crypto.randomUUID() + "-" + crypto.randomUUID()

const validUsers = [
    {
        name: "Víctor Gago",
        email: 'víctor.gago@email.com',
        password: uuidToPassword,
    },
    {
        name: "Guillem Hermida",
        email: 'guillem.hermida@email.com',
        password: uuidToPassword,
    },
    {
        name: "María Fernanda Marques",
        email: 'maría.fernanda.marques@email.com',
        password: uuidToPassword,
    },
    {
        name: "Sacramento Pino",
        email: 'sacramento.pino@email.com',
        password: uuidToPassword,
    },
    {
        name: "Aina García",
        email: 'aina.garcía@email.com',
        password: uuidToPassword,
    }
]

const invalidTheaters = [
    {},
    {
        theaterId: "10000",
    },
    {
        theaterId: 10003,
    },
    {
        theaterId: 10003,
        location: null,
    },
    {
        theaterId: 10003,
        location: {
            address: 50,
        }
    },
]

const validTheaters = [
    {
        theaterId: 10000,
        location: {
            address: {
                street1: "340 W Market",
                city: "Bloomington",
                state: "MN",
                zipcode: "55425"
            },
        }
    },
    {
        theaterId: 10003,
        location: {
            address: {
                street1: "45235 Worth Ave.",
                city: "California",
                state: "MD",
                zipcode: "20619"
            },
        }
    },
    {
        theaterId: 10008,
        location: {
            address: {
                street1: "1621 E Monte Vista Ave",
                city: "Vacaville",
                state: "CA",
                zipcode: "95688"
            },
            geo: {
                type: "Point",
                coordinates: [
                    -121.96328,
                    38.367649
                ]
            }
        }
    },
    {
        theaterId: 10004,
        location: {
            address: {
                street1: "5072 Pinnacle Sq",
                city: "Birmingham",
                state: "AL",
                zipcode: "35235"
            },
        }
    },
    {
        theaterId: 10002,
        location: {
            address: {
                street1: "1900 E Rio Salado Pkwy",
                city: "Tempe",
                state: "AZ",
                zipcode: "85281"
            },
            geo: {
                type: "Point",
                coordinates: [
                    -111.89966,
                    33.430729
                ]
            }
        }
    }
]

const invalidMovies = [
    {},
    {
        title: null,
    },
    {
        title: "Titulo cheto",
        year: "2000"
    },
    {
        title: null,
        year: 2000,
        cast: [
            "Actor 1",
            "Actor 1",
            "Actor 1",
        ]
    },
    {
        title: null,
        year: 2000,
        cast: 5
    },
]

const validMovies = [
    {
        title: "Pelicula 1",
        year: 2025,
        cast: [
            "Actor 1", "Actor 2"
        ],
        directors: [
            "Director 1"
        ],
        countries: [
            "ARG"
        ],
        genres: [
            "Documentary",
            "Short"
        ]
    },
    {
        title: "Pelicula 2",
        year: 2025,
        countries: [
            "ARG"
        ],
        genres: [
            "Documentary",
            "Short"
        ]
    },
    {
        title: "Pelicula 3",
        year: 2025,
        cast: [
            "Actor 1", "Actor 2"
        ],
        directors: [
            "Director 1"
        ],
        countries: [
            "ARG"
        ],
    },
    {
        title: "Pelicula 4",
        year: 2025,
        cast: [
            "Actor 1", "Actor 2"
        ],
        directors: [
            "Director 1"
        ],
        countries: [
            "ARG"
        ],
        genres: [
            "Documentary",
            "Short"
        ]
    },
    {
        title: "Pelicula 5",
        year: 2025,
        cast: [
            "Actor 1", "Actor 2"
        ],
        directors: [
            "Director 1"
        ],
        genres: [
            "Documentary",
            "Short"
        ]
    },
]

module.exports = {
    invalidUsers,
    validUsers,
    invalidTheaters,
    validTheaters,
    invalidMovies,
    validMovies
}
