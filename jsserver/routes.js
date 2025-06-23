const express = require('express');
const router = express.Router();
const mysql = require('mysql');

// Database connection
const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'demo'
});

db.connect((err) => {
    if (err) {
        throw err;
    }
    console.log('MySQL Connected...');
});

// Middleware to log request information
router.use((req, res, next) => {
    console.log(`Request Method: ${req.method}`);
    console.log(`Request URL: ${req.url}`);
    console.log(`Request Headers: ${JSON.stringify(req.headers)}`);
    if (req.method === 'POST' || req.method === 'PUT') {
        console.log(`Request Body: ${JSON.stringify(req.body)}`);
    }
    next();
});

// Define your routes here

// Get a category
router.get('/table_category/:id', (req, res) => {
    let sql = `SELECT * FROM table_categories WHERE id = ${req.params.id}`;
    db.query(sql, (err, results) => {
        if (err) {
            return res.status(500).send(err);
        }
        res.json(results);
    });
});

// Get all categories
router.get('/table_category_all', (req, res) => {
    let sql = `SELECT * FROM table_categories`;
    console.log(`Executing SQL: ${sql}`); // Log the SQL query
    db.query(sql, (err, results) => {
        if (err) {
            console.error(`SQL Error: ${err.sqlMessage}`); // Log the SQL error
            return res.status(500).send(err);
        }
        res.json(results);
    });
});

// Update category status
router.put('/update_category_status', (req, res) => {
    const { category_id, is_active } = req.body;
    let sql = `UPDATE table_categories SET is_active = ? WHERE category_id = ?`;
    console.log(`Executing SQL: ${sql}`); // Log the SQL query
    console.log(`Parameters: is_active = ${is_active}, category_id = ${category_id}`); // Log the parameters
    db.query(sql, [is_active, category_id], (err, results) => {
        if (err) {
            console.error(`SQL Error: ${err.sqlMessage}`); // Log the SQL error
            return res.status(500).send(err);
        }
        res.json(results);
    });
});

// Add a category
router.post('/add_category', (req, res) => {
    const { category_name, category_id, is_active } = req.body;
    let sql = `INSERT INTO table_categories (category_name, category_id, is_active) VALUES (?, ?, ?)`;
    console.log(`Executing SQL: ${sql}`); // Log the SQL query
    db.query(sql, [category_name, category_id, is_active], (err, results) => {
        if (err) {
            console.error(`SQL Error: ${err.sqlMessage}`); // Log the SQL error
            return res.status(500).send(err);
        }
        res.json(results);
    });
});

// Tables related functions
// Get all tables
router.get('/tables_all', (req, res) => {
    let sql = `SELECT * FROM tables`;
    console.log(`Executing SQL: ${sql}`); // Log the SQL query
    db.query(sql, (err, results) => {
        if (err) {
            console.error(`SQL Error: ${err.sqlMessage}`); // Log the SQL error
            return res.status(500).send(err);
        }
        res.json(results);
    });
});

// Get a table by id
router.get('/table/:id', (req, res) => {
    let sql = `SELECT * FROM tables WHERE id = ${req.params.id}`;
    db.query(sql, (err, results) => {
        if (err) {
            return res.status(500).send(err);
        }
        res.json(results);
    });
});

// Get tables by category_id
router.get('/tables', (req, res) => {
    const category_id = String(req.query.category_id); // Ensure category_id is a string
    let sql = `SELECT * FROM tables WHERE category_id = ?`;
    console.log(`Executing SQL: ${sql}`); // Log the SQL query
    console.log(`Parameters: category_id = ${category_id}`); // Log the parameters
    db.query(sql, [category_id], (err, results) => {
        if (err) {
            console.error(`SQL Error: ${err.sqlMessage}`); // Log the SQL error
            return res.status(500).send(err);
        }
        res.json(results);
    });
});

// Update table status
router.put('/update_table_status', (req, res) => {
    const { id, is_active } = req.body;
    let sql = `UPDATE tables SET is_active = ? WHERE id = ?`;
    console.log(`Executing SQL: ${sql}`); // Log the SQL query
    console.log(`Parameters: is_active = ${is_active}, id = ${id}`); // Log the parameters
    db.query(sql, [is_active, id], (err, results) => {
        if (err) {
            console.error(`SQL Error: ${err.sqlMessage}`); // Log the SQL error
            return res.status(500).send(err);
        }
        res.json(results);
    });
});

// Add a table
router.post('/add_table', (req, res) => {
    const { name, status } = req.body;
    let sql = `INSERT INTO tables (name, elegant_name, capacity, category_id) VALUES (?, ?, ?, ?)`;
    console.log(`Executing SQL: ${sql}`); // Log the SQL query
    db.query(sql, [name, status], (err, results) => {
        if (err) {
            console.error(`SQL Error: ${err.sqlMessage}`); // Log the SQL error
            return res.status(500).send(err);
        }
        res.json(results);
    });
});

// Update table name
router.put('/update_table_name', (req, res) => {
    const { id, name } = req.body;
    let sql = `UPDATE tables SET name = ? WHERE id = ?`;
    console.log(`Executing SQL: ${sql}`); // Log the SQL query
    console.log(`Parameters: name = ${name}, id = ${id}`); // Log the parameters
    db.query(sql, [name, id], (err, results) => {
        if (err) {
            console.error(`SQL Error: ${err.sqlMessage}`); // Log the SQL error
            return res.status(500).send(err);
        }
        res.json(results);
    });
});

// Update table elegant_name
router.put('/update_table_elegant_name', (req, res) => {
    const { id, elegant_name } = req.body;
    let sql = `UPDATE tables SET elegant_name = ? WHERE id = ?`;
    console.log(`Executing SQL: ${sql}`); // Log the SQL query
    console.log(`Parameters: elegant_name = ${elegant_name}, id = ${id}`); // Log the parameters
    db.query(sql, [elegant_name, id], (err, results) => {
        if (err) {
            console.error(`SQL Error: ${err.sqlMessage}`); // Log the SQL error
            return res.status(500).send(err);
        }
        res.json(results);
    });
});

// Update table capacity
router.put('/update_table_capacity', (req, res) => {
    const { id, capacity } = req.body;
    let sql = `UPDATE tables SET capacity = ? WHERE id = ?`;
    console.log(`Executing SQL: ${sql}`); // Log the SQL query
    console.log(`Parameters: capacity = ${capacity}, id = ${id}`); // Log the parameters
    db.query(sql, [capacity, id], (err, results) => {
        if (err) {
            console.error(`SQL Error: ${err.sqlMessage}`); // Log the SQL error
            return res.status(500).send(err);
        }
        res.json(results);
    });
});

// Delete table
router.delete('/delete_table', (req, res) => {
    const { id } = req.body;
    let sql = `DELETE FROM tables WHERE id = ${id}`;
    db.query(sql, (err, results) => {
        if (err) {
            return res.status(500).send(err);
        }
        res.json(results);
    });
});

// Get menu items from menu table
router.get('/get_menu', (req, res) => {
    let sql = `SELECT * FROM menu ORDER BY CategoryID`;
    db.query(sql, (err, results) => {
        if (err) {
            return res.status(500).send(err);
        }
        res.json(results);
    });
});

// Catch-all route for unmatched requests
router.use((req, res) => {
    console.log(`No route matched for ${req.method} ${req.url}`);
    res.status(404).send({ error: 'Route not found' });
});

module.exports = router;