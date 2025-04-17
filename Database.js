const fs = require('fs');

class Database {
    static connection;
    static dbName = "arlingtonorganicmarket";

    static init() {
        const conn = Database.connection;
        const dbName = Database.dbName;

        conn.query(
            'SHOW DATABASES LIKE ?',
            [dbName],
            (err, results) => {
                if (err) throw err;

                if (results.length > 0) {
                    console.log(`Database "${dbName}" exists. Using it`);
                    Database.use();
                } else {
                    console.log(`Database "${dbName}" not found. Creating...`);
                    const sql = fs.readFileSync('arlingtonorganicmarket.sql', 'utf8');

                    conn.query(sql, (err) => {
                        if (err) throw err;
                        console.log(`Database "${dbName}" created from arlingtonorganicmarket.sql`);
                        Database.use(() => {
                            Database.createViews();
                        });
                    });
                }
            }
        );
    }

    static use(callback) {
        const conn = Database.connection;
        conn.query(`USE ${Database.dbName}`, (err) => {
            if (err) throw err;
            console.log("Using db!");
            if (callback) callback();
        });
    }

    static createViews() {
        const conn = Database.connection;
        const sql = fs.readFileSync('views.sql', 'utf8');
        conn.query(sql, (err) => {
            if (err) throw err;
            console.log(`Views created from views.sql`);
        });
    }

    static resetPromise() {
        const conn = Database.connection;
        return new Promise((resolve, reject) => {
            conn.query(`DROP DATABASE ${Database.dbName}`, (err) => {
                if (err) return reject(err);
                Database.init();
                resolve();
            });
        });
    }

    static getTablePromise(table) {
        const conn = Database.connection;
        return new Promise((resolve, reject) => {
            conn.query(`SELECT * FROM ${table}`, (err, result) => {
                if (err) return reject(err);
                resolve(result);
            });
        });
    }

    static insertItemPromise(json) {
        const conn = Database.connection;

        return new Promise((resolve, reject) => {
            conn.query(
                "INSERT INTO item (iId, Iname, Sprice, Category) VALUES (?, ?, ?, ?)",
                [json.id, json.name, json.price, json.category],
                (err) => {
                    if (err) return reject(err);
                    console.log('Item inserted');
                    resolve();
                }
            );
        })
        .then(() => {
            return new Promise((resolve, reject) => {
                conn.query(
                    "INSERT INTO store_item (sId, iId, Scount) VALUES (?, ?, ?)",
                    [1, json.id, json.quantity],
                    (err) => {
                        if (err) return reject(err);
                        console.log('Item store related');
                        resolve();
                    }
                );
            });
        })
        .then(() => {
            return new Promise((resolve, reject) => {
                conn.query(
                    "INSERT INTO vendor_item (vId, iId) VALUES (?, ?)",
                    [json.vendor, json.id],
                    (err) => {
                        if (err) return reject(err);
                        console.log('Item vendor related');
                        resolve();
                    }
                );
            });
        });
    }

    static getTable(table, callback) {
        Database.getTablePromise(table)
            .then(result => callback(null, result))
            .catch(err => callback(err, null));
    }

    static insertItem(json, callback) {
        Database.insertItemPromise(json)
            .then(() => {
                console.log('Item inserted!');
                Database.getTable('item', callback);
            })
            .catch(err => callback(err, null));
    }

    static reset(callback) {
        Database.resetPromise()
            .then(() => {
                console.log('Successfully reset database');
                if (callback) callback(null);
            })
            .catch(err => callback(err));
    }
}

module.exports = Database;
