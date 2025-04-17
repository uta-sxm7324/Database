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
                this.use();
              } else {
                console.log(`Database "${this.dbName}" not found. Creating...`);
          
                // Read SQL file
                const sql = fs.readFileSync('arlingtonorganicmarket.sql', 'utf8');
          
                // Run SQL file (it should include CREATE DATABASE and other commands)
                connection.query(sql, (err, results) => {
                  if (err) throw err;
                  console.log(`Database "${this.dbName}" created from name.sql`);
                  this.use();
                });
              }
            }
          );
    }

    use() {
        this.connection.query(
            'USE ' + this.dbName, (err, results) => {
                if (err) throw err;
                console.log("Using db!");
            }
        );
    }

    getTablePromise(table) {
        return new Promise((resolve, reject) => {
            this.connection.query("SELECT * FROM " + table, function (err, result) {
                if (err) return reject(err);
                //console.log("Result: ", result);
                resolve(result);
            });
        });
    }

    getTable(table, callback) {
        this.getTablePromise(table)
        .then(result => {
            callback(null, result);
        })
        .catch(err => {
            callback(err, null);
        });
    }
}

module.exports = Database;