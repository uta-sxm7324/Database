// Samuel Mach 1002107324
// Abubakar Kassim 1002158809

const fs = require('fs');

class Database {
    static connection;
    static dbName = "arlingtonorganicmarket";

    static init() {
        const conn = Database.connection;
        const dbName = Database.dbName;

        return new Promise((resolve, reject) => {
            conn.query(
                'SHOW DATABASES LIKE ?',
                [dbName],
                (err, results) => {
                    if (err) return reject(err);

                    if (results.length > 0) {
                        console.log(`Database "${dbName}" exists. Using it`);
                        Database.use();
                        resolve();
                    } else {
                        console.log(`Database "${dbName}" not found. Creating...`);
                        const sql = fs.readFileSync('arlingtonorganicmarket.sql', 'utf8');

                        conn.query(sql, (err) => {
                            if (err) return reject(err);
                            console.log(`Database "${dbName}" created from arlingtonorganicmarket.sql`);
                            Database.use(() => {
                                Database.createViews();
                                resolve();
                            });
                        });
                    }
                }
            );
        });
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
                Database.init()
                .then(() => {
                    resolve();
                })
                .catch((err) => {
                    reject(err);
                });
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

    static getStorePromise(sId) {
        const conn = Database.connection;
        return new Promise((resolve, reject) => {
            conn.query(`SELECT Iname AS Name, Sprice AS Price, Scount AS Quantity FROM item NATURAL JOIN store_item WHERE sId = ?`, [sId], (err, result) => {
                if (err) return reject(err);
                resolve(result);
            });
        });
    }

    // { k: k }

    static getTopKPromise(json) {
        const conn = Database.connection;
        return new Promise((resolve, reject) => {
            conn.query(`SELECT Iname AS Name, TotalRevenue FROM ItemSalesSummary ORDER BY TotalRevenue DESC LIMIT ?`, [+json.k], (err, result) => {
                if (err) return reject(err);
                resolve(result);
            });
        });
    }

    // no json

    static getTotalRevenuePromise() {
        const conn = Database.connection;
        return new Promise((resolve, reject) => {
            conn.query(`SELECT sum(TotalRevenue) FROM ItemSalesSummary SELECT sum(TotalRevenue) AS TotalRevenue FROM ItemSalesSummary`, (err, result) => {
                if (err) return reject(err);
                resolve(result);
            });
        });
    }

    // { morethan: moreThan }

    static getMoreThanPromise(json) {
        const conn = Database.connection;
        return new Promise((resolve, reject) => {
            conn.query(`SELECT Iname AS Name, TotalQuantitySold FROM ItemSalesSummary WHERE TotalQuantitySold > ?`, [+json.moreThan], (err, result) => {
                if (err) return reject(err);
                resolve(result);
            });
        });
    }

    // no json

    static getHighestLoyaltyPromise() {
        const conn = Database.connection;
        return new Promise((resolve, reject) => {
            conn.query(`SELECT Cname AS Name, LoyaltyScore FROM TopLoyalCustomers ORDER BY LoyaltyScore DESC LIMIT 1`, (err, result) => {
                if (err) return reject(err);
                resolve(result);
            });
        });
    }

    // { low: low, high: high }

    static getLoyaltyBetweenPromise(json) {
        const conn = Database.connection;
        return new Promise((resolve, reject) => {
            conn.query(`SELECT Cname AS Name, LoyaltyScore FROM TopLoyalCustomers WHERE LoyaltyScore >= ? AND LoyaltyScore <= ?`, [json.low, json.high], (err, result) => {
                if (err) return reject(err);
                resolve(result);
            });
        });
    }

    /* VENDOR json
    {
        vendorId: vendorId,
        vendorName: vendorName,
        vendorStreet: vendorStreet,
        vendorCity: vendorCity,
        vendorState: vendorState,
        vendorZip: vendorZip
    }
    */
    static insertVendorPromise(json) {
        const conn = Database.connection;

        return new Promise((resolve, reject) => {
            conn.query(
                "INSERT INTO vendor (vId, Vname, Street, City, StateAb, ZipCode) VALUES (?, ?, ?, ?, ?, ?)",
                [json.vendorId, json.vendorName, json.vendorStreet, json.vendorCity, json.vendorState, json.vendorZip],
                (err) => {
                    if (err) return reject(err);
                    console.log('Vendor inserted');
                    resolve();
                }
            );
        })
        .then(() => {
            return new Promise((resolve, reject) => {
                conn.query(
                    "INSERT INTO vendor_store (vId, sId) VALUES (?, ?)",
                    [json.vendorId, 1],
                    (err) => {
                        if (err) return reject(err);
                        console.log('vendor store related');
                        resolve();
                    }
                );
            });
        })
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

    /* ITEM PRICE UPDATE json
    {
      oid: oid
      itemId: itemId,
      itemPrice: itemPrice
    }
    */

    static updatePricePromise(json) {
        const conn = Database.connection;
        //First, add to oldprice
        return new Promise((resolve, reject) => {
            conn.query(
                "INSERT INTO OLDPRICE (iId, oId, Sprice, Sdate) SELECT iId, ?, Sprice, CURRENT_DATE FROM ITEM WHERE iId = ?",
                [json.oid, json.itemId],
                (err) => {
                    if (err) return reject(err);
                    console.log('oldprice added');
                    resolve();
                }
            );
        })
        .then(() => {
            return new Promise((resolve, reject) => {
                conn.query(
                    "UPDATE ITEM SET Sprice = ? WHERE iId = ?",
                    [json.itemPrice, json.itemId],
                    (err) => {
                        if (err) return reject(err);
                        console.log('item price updated');
                        resolve();
                    }
                );
            });
        })

    }

    // {itemId: itemId}

    static deleteItemPromise(json) {
        const conn = Database.connection;

        return new Promise((resolve, reject) => {
            conn.query(
                "DELETE FROM store_item WHERE iId = ?",
                [json.itemId],
                (err) => {
                    if (err) return reject(err);
                    console.log('store_item deleted');
                    resolve();
                }
            );
        })
        .then(() => {
            return new Promise((resolve, reject) => {
                conn.query(
                    "DELETE FROM vendor_item WHERE iId = ?",
                    [json.itemId],
                    (err) => {
                        if (err) return reject(err);
                        console.log('vendor_item deleted');
                        resolve();
                    }
                );
            });
        })
        .then(() => {
            return new Promise((resolve, reject) => {
                conn.query(
                    "DELETE FROM oldprice WHERE iId = ?",
                    [json.itemId],
                    (err) => {
                        if (err) return reject(err);
                        console.log('oldprices deleted');
                        resolve();
                    }
                );
            });
        })
        .then(() => {
            return new Promise((resolve, reject) => {
                conn.query(
                    "DELETE FROM order_item WHERE iId = ?",
                    [json.itemId],
                    (err) => {
                        if (err) return reject(err);
                        console.log('order_item deleted');
                        resolve();
                    }
                );
            });
        })
        .then(() => {
            return new Promise((resolve, reject) => {
                conn.query(
                    "DELETE FROM item WHERE iId = ?",
                    [json.itemId],
                    (err) => {
                        if (err) return reject(err);
                        console.log('item deleted');
                        resolve();
                    }
                );
            });
        })
        .then(() => {
            return new Promise((resolve, reject) => {
                conn.query(
                    "DELETE FROM vendor_store WHERE vId NOT IN (SELECT vId FROM vendor_item)",
                    (err) => {
                        if (err) return reject(err);
                        console.log('vendor_store deleted');
                        resolve();
                    }
                );
            });
        })
        .then(() => {
            return new Promise((resolve, reject) => {
                conn.query(
                    "DELETE FROM vendor WHERE vId NOT IN (SELECT vId FROM vendor_item)",
                    (err) => {
                        if (err) return reject(err);
                        console.log('vendor deleted');
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

    static updatePrice(json, callback) {
        Database.updatePricePromise(json)
            .then(() => {
                console.log('Item Updated!');
                callback(null);
            })
            .catch(err => callback(err, null));
    }

    static deleteItem(json, callback) {
        Database.deleteItemPromise(json)
            .then(() => {
                console.log('Item deleted!');
                callback(null);
            })
            .catch(err => callback(err, null));
    }

    static insertVendor(json, callback) {
        Database.insertVendorPromise(json)
            .then(() => {
                console.log('Vendor inserted!');
                Database.getTable('vendor', callback);
            })
            .catch(err => callback(err, null));
    }

    static getStore(id, callback) {
        Database.getStorePromise(id)
            .then((data) => {
                console.log('Store promise success');
                callback(null, data);
            })
            .catch(err => {
                callback(err, null);
            });
    }

    static topk(json, callback) {
        Database.getTopKPromise(json)
            .then((data) => {
                console.log('Top K promise success');
                callback(null, data);
            })
            .catch(err => {
                callback(err, null);
            });
    }

    static totalRevenue(callback) {
        Database.getTotalRevenuePromise()
            .then((data) => {
                console.log('Total revenue promise success');
                callback(null, data);
            })
            .catch(err => {
                callback(err, null);
            });
    }

    static moreThan(json, callback) {
        Database.getMoreThanPromise(json)
            .then((data) => {
                console.log('More than promise success');
                callback(null, data);
            })
            .catch(err => {
                callback(err, null);
            });
    }

    static highestLoyalty(callback) {
        Database.getHighestLoyaltyPromise()
            .then((data) => {
                console.log('Highest Loyalty promise success');
                callback(null, data);
            })
            .catch(err => {
                callback(err, null);
            });
    }

    static loyaltyBetween(json, callback) {
        Database.getLoyaltyBetweenPromise(json)
            .then((data) => {
                console.log('Loyalty Between promise success');
                callback(null, data);
            })
            .catch(err => {
                callback(err, null);
            });
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
