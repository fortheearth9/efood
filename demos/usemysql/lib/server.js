// server.js
const express = require('express');
const mysql = require('mysql');
const cors = require('cors');

const app = express();
app.use(cors());

const db = mysql.createConnection({
    host: 'localhost',
    user: 'demo',
    password: 'demo',
    database: 'demo'
});

db.connect((err) => {
    if (err) throw err;
    console.log('Connected to database');
});

app.get('/food', (req, res) => {
    let sql = 'SELECT * FROM food';
    db.query(sql, (err, results) => {
        if(err) throw err;
        res.send(results);
    });
});

app.listen(3000, () => {
    console.log('Server started on port 3000');
});