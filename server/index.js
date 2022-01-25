const express = require('express')
const cors = require('cors')
const fs = require('fs')
let {pool: pool} = require("./db")
const PORT = process.env.PORT || 3005;

const app = express()
app.use(express.json());
app.use(cors())

let currentBookId=-1
/*
app.get("/Books", (req, res) => {
    console.log('Incoming request... \nhostname:' + req.hostname + '\nurl: ' + req.url)
    fs.readFile('./server/books.json', 'utf8', (err, data) => {
        if (err)
            console.log(err)
        res.json(data);
        res.end()
    })
})
*/

app.get("/Physicians", (req, res) => {
    const query = 'SELECT physician_id,first_name,last_name from physician'
    pool.query(query, (error, results) => {
        if (error) {
            throw error
        }
        res.status(200).json(results.rows).end()
    })
})

app.get("/Appointments", (req, res) => {
    const query = 'SELECT appointment.patient_name,appointment.kind,appointment.date_time::timestamp::time as time  FROM appointment,physician,physician_appointment WHERE physician_appointment.physician_id = physician.physician_id and physician_appointment.appointment_id = appointment.appointment_id and physician.physician_id ='+req.query.physician_id
    pool.query(query, (error, results) => {
        if (error) {
            throw error
        }
        res.status(200).json(results.rows).end()
    })
})

app.listen(PORT, () => {
    console.log(`Server listening  on ${PORT}`);
})

