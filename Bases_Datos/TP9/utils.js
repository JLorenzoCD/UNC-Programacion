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

module.exports = { invalidUsers, validUsers }
