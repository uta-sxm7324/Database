const mysql = require('mysql'); 

const con = mysql.createConnection({
    host: "localhost:3306",
    user: "server",
    //password: "yourpassword" //No password :)
});

con.connect(function(err) {
    if (err) throw err;
    console.log("Connected!");
});

class Database {
    constructor(connection) {
        this.connection = connection;
        this.dbName = "arlingtonorganicmarket";
    }

    init() {
        this.connection.query(
            'SHOW DATABASES LIKE ?',
            [this.dbName],
            (err, results) => {
              if (err) throw err;
          
              if (results.length > 0) {
                console.log(`Database "${this.dbName}" exists. Using it`);
              } else {
                console.log(`Database "${this.dbName}" not found. Creating...`);
          
                // Read SQL file
                const sql = fs.readFileSync('arlingtonorganicmarket.sql', 'utf8');
          
                // Run SQL file (it should include CREATE DATABASE and other commands)
                connection.query(sql, (err, results) => {
                  if (err) throw err;
                  console.log(`Database "${this.dbName}" created from name.sql`);
                });
              }
            }
          );
    }

    getTable(table) {
        this.connection.query("SELECT * FROM " + table, function (err, result) {
            if (err) throw err;
            console.log("Result: " + result);
            return result;
        });
    }
}

const db = new Database(con);
db.init();