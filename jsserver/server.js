const express = require('express');
const mysql = require('mysql');
const app = express();
const routes = require('./routes'); // Import the routes

app.use(express.json()); // For parsing application/json

// Use the routes
app.use('/', routes);

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
    console.log(`Server running on port ${PORT} ... `);
});