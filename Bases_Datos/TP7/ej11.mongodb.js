/*
11.​Agregar dos nuevas calificaciones al restaurante cuyo id es "50018608". A
continuación se especifican las calificaciones a agregar en una sola consulta.

{
    "date" : |SODate("2019-10-10T00:00:00Z"),
    "grade" : "A",
    "score" : 18
}

{
    "date" : |SODate("2020-02-25T00:00:00Z"),
    "grade" : "A",
    "score" : 21
}

*/

use("restaurantdb")

db.restaurants.updateOne(
    {
        restaurant_id: "50018608"
    },
    {
        $addToSet: {
            grades: {
                $each: [
                    {
                        date: new Date("2019-10-10T00:00:00Z"),
                        grade: "A",
                        score: 18
                    },
                    {
                        date: new Date("2020-02-25T00:00:00Z"),
                        grade: "A",
                        score: 21
                    }
                ]
            }
        }
    }
)
