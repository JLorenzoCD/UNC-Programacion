use("sample_airbnb")

// EJERCICIO Nro 1
db.listingsAndReviews.aggregate([
    {
        $match: {
            "review_scores.review_scores_rating": {
                $exists: true,
            }
        }
    },
    {
        $group: {
            _id: "$address.country",
            country_rating_avg: {
                $avg: "$review_scores.review_scores_rating",
            },
            cautry_rating_count: {
                $sum: 1,
            }
        },
    },
    {
        $sort: {
            country_rating_avg: -1
        }
    },
    {
        $project: {
            _id: 0,
            country: "$_id",
            country_rating_avg: 1,
            cautry_rating_count: 1,
        }
    }
])

// EJERCICIO Nro 2
db.listingsAndReviews.find(
    {
        number_of_reviews: {
            $exists: true,
        },
        "reviews.0": {
            $exists: true,
        },
    },
    {
        _id: 0,
        name: 1,
        number_of_reviews: 1,
        last_review_date: {
            $max: "$reviews.date"
        }
    }
).sort(
    {
        number_of_reviews: -1
    }
).limit(20)

// EJERCICIO Nro 3
db.createView(
    "top10_most_common_amenities",
    "listingsAndReviews",
    [
        {
            $match: {
                "amenities.0": {
                    $exists: 1
                }
            }
        },
        {
            $unwind: "$amenities",
        },
        {
            $group: {
                _id: "$amenities",
                amenity_count: {
                    $sum: 1
                }
            }
        },
        {
            $sort: {
                amenity_count: -1,
            },
        },
        {
            $limit: 10,
        },
        {
            $project: {
                _id: 0,
                amenity: "$_id",
                count: "$amenity_count"
            }
        }
    ]
)
// db.top10_most_common_amenities.find()

// EJERCICIO Nro 4
db.listingsAndReviews.updateMany(
    {
        "address.country": "Brazil",
        "review_scores.review_scores_rating": {
            $exists: true,
        },
    },
    [
        {
            $addFields: {
                quality_label: {
                    $switch: {
                        branches: [
                            {
                                case: {
                                    $gte: ["$review_scores.review_scores_rating", 90]
                                },
                                then: "High",
                            },
                            {
                                case: {
                                    $and: [
                                        { $lt: ["$review_scores.review_scores_rating", 90] }, // por las dudas
                                        { $gte: ["$review_scores.review_scores_rating", 70] },
                                    ]
                                },
                                then: "Medium",
                            },
                        ],
                        default: "Low"
                    }
                },
            },
        },
    ]
)

// EJERCICIO Nro 5
db.runCommand({
    collMod: "listingsAndReviews",
    validator: {
        $jsonSchema: {
            bsonType: "object",
            required: ["name", "address", "amenities", "review_scores", "reviews"],
            properties: {
                name: { bsonType: "string" },
                address: {
                    bsonType: "object",
                    required: [
                        'street',
                        'suburb',
                        'government_area',
                        'market',
                        'country',
                        'country_code',
                        'location'
                    ],
                    properties: {
                        street: { bsonType: "string" },
                        suburb: { bsonType: "string" },
                        government_area: { bsonType: "string" },
                        market: { bsonType: "string" },
                        country: { bsonType: "string" },
                        country_code: { bsonType: "string" },
                        location: {
                            bsonType: "object",
                            required: ['type', 'coordinates', 'is_location_exact'],
                            properties: {
                                type: {
                                    bsonType: ["string", "null"],
                                    enum: ["Point", null]
                                },
                                coordinates: {
                                    bsonType: "array",
                                    items: { bsonType: "double" },
                                    minItems: 2,
                                    maxItems: 2,
                                },
                                is_location_exact: { bsonType: "bool" },
                            }
                        },
                    }
                },
                amenities: {
                    bsonType: "array",
                    items: { bsonType: "string" },
                    uniqueItems: true,
                },
                review_scores: {
                    bsonType: "object",
                    required: ["review_scores_accuracy", "review_scores_cleanliness", "review_scores_checkin", "review_scores_communication", "review_scores_location", "review_scores_value", "review_scores_rating"],
                    properties: {
                        review_scores_accuracy: { bsonType: "int" },
                        review_scores_cleanliness: { bsonType: "int" },
                        review_scores_checkin: { bsonType: "int" },
                        review_scores_communication: { bsonType: "int" },
                        review_scores_location: { bsonType: "int" },
                        review_scores_value: { bsonType: "int" },
                        review_scores_rating: { bsonType: "int" },
                    }
                },
                reviews: {
                    bsonType: "array",
                    items: {
                        bsonType: "object",
                        required: [
                            '_id',
                            'date',
                            'listing_id',
                            'reviewer_id',
                            'reviewer_name',
                            'comments',
                        ],
                        properties: {
                            _id: { bsonType: "string" },
                            date: { bsonType: "date" },
                            listing_id: { bsonType: "string" },
                            reviewer_id: { bsonType: "string" },
                            reviewer_name: { bsonType: "string" },
                            comments: { bsonType: "string" },
                        }
                    },
                },
            },
        },
    },
})

// Es invalido ya que address.location.type tiene el tipo enum para "Pint" o null, cosa que no cumple
const invalid1 = {
    "name": "Registro invalido 1",
    "amenities": [
        "TV",
        "Cable TV",
        "Wifi",
        "Kitchen",
    ],
    "address": {
        "street": "Porto, Porto, Portugal",
        "suburb": "",
        "government_area": "Cedofeita, Ildefonso, Sé, Miragaia, Nicolau, Vitória",
        "market": "Porto",
        "country": "Portugal",
        "country_code": "PT",
        "location": {
            "type": "Antartida",
            "coordinates": [
                -8.61308,
                41.1413
            ],
            "is_location_exact": false
        }
    },
    "review_scores": {
        "review_scores_accuracy": 9,
        "review_scores_cleanliness": 9,
        "review_scores_checkin": 10,
        "review_scores_communication": 10,
        "review_scores_location": 10,
        "review_scores_value": 9,
        "review_scores_rating": 89
    },
    "reviews": []
}

// Es invalido ya que review_scores.review_scores_rating tiene el bsonType "int", se puso un flotante
const invalid2 = {
    "name": "Registro invalido 2",
    "amenities": [],
    "address": {
        "street": "Porto, Porto, Portugal",
        "suburb": "",
        "government_area": "Cedofeita, Ildefonso, Sé, Miragaia, Nicolau, Vitória",
        "market": "Porto",
        "country": "Argentina",
        "country_code": "ARG",
        "location": {
            "type": "Point",
            "coordinates": [
                -8.61308,
                41.1413
            ],
            "is_location_exact": false
        }
    },
    "review_scores": {
        "review_scores_accuracy": 9,
        "review_scores_cleanliness": 9,
        "review_scores_checkin": 10,
        "review_scores_communication": 10,
        "review_scores_location": 10,
        "review_scores_value": 9,
        "review_scores_rating": 89.66
    },
    "reviews": [{
        "_id": "58663741",
        "date": new Date("2016-01-03T05:00:00Z"),
        "listing_id": "10006546",
        "reviewer_id": "51483096",
        "reviewer_name": "Cátia",
        "comments": "Un comentario cualquiera."
    }]
}

const valid = {
    "name": "Registro valido",
    "amenities": [
        "Wifi"
    ],
    "address": {
        "street": "Sotano de Famaf",
        "suburb": "",
        "government_area": "Cedofeita, Ildefonso, Sé, Miragaia, Nicolau, Vitória",
        "market": "Porto",
        "country": "Argentina",
        "country_code": "ARG",
        "location": {
            "type": "Point",
            "coordinates": [
                -5.555,
                10.555
            ],
            "is_location_exact": true
        }
    },
    "review_scores": {
        "review_scores_accuracy": NumberInt(9),
        "review_scores_cleanliness": NumberInt(9),
        "review_scores_checkin": NumberInt(10),
        "review_scores_communication": NumberInt(10),
        "review_scores_location": NumberInt(10),
        "review_scores_value": NumberInt(9),
        "review_scores_rating": NumberInt(100)
    },
    "reviews": [{
        "_id": "1100000000",
        "date": new Date("2025-01-03T05:00:00Z"),
        "listing_id": "10006546",
        "reviewer_id": "51483096",
        "reviewer_name": "Cátia",
        "comments": "Un comentario cualquiera."
    }]
}

// db.listingsAndReviews.insertOne(invalid1)
// db.listingsAndReviews.insertOne(invalid2)
// db.listingsAndReviews.insertOne(valid)
