/*
9.​ Remover todos los comentarios realizados por el usuario cuyo email es
victor_patel@fakegmail.com durante el año 1980.
*/

use("mflix")

const year1980 = new Date("1980-01-01T00:00:00.000Z");
const year1981 = new Date("1981-01-01T00:00:00.000Z");

db.comments.deleteMany(
    {
        email: "victor_patel@fakegmail.com",
        date: {
            $gte: year1980,
            $lt: year1981,
        }
    }
)
