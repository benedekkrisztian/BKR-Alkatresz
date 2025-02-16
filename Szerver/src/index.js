import express from "express";
import mysql from "mysql2/promise";

const PORT = 3000;

const app = express();
const pool = mysql.createPool({
    user: "root",
    password: "",
    database: "bkr_alkatresz", 
});

app.use(express.json());

app.get("/tipus/:id", async (req, res) => {
    try {
        const { id } = req.params;
        const [results, ] = await pool.query(
            `SELECT tipus_id, tipus, kivitel, model, motorkod, gyartasiciklus 
             FROM tipus 
             WHERE tipus_id = ?`, [id]
        );

        res.json(results);
    } catch (err) {
        console.log(err);
        res.status(500).json({
            "error": "Nem sikerült lekérdezni a típust."
        });
    }
});

app.get("/termekek/:id", async (req, res) => {
    try {
        const { id } = req.params;
        const [results, ] = await pool.query(
            `SELECT termek_id, leiras, darab, alkatreszszam, ar, tipus_id 
             FROM termekek 
             WHERE termek_id = ?`, [id]
        );

        res.json(results);
    } catch (err) {
        console.log(err);
        res.status(500).json({
            "error": "Nem sikerült lekérdezni a terméket."
        });
    }
});

app.post("/felhasznalok", async (req, res) => {
    try {
        const body = req.body;
        const { email, felhasznalonev, jelszo } = req.body;
        const club = false; 

        
        if (!body || typeof(body) !== "object" || Object.keys(body).length !== 3) {
            throw new Error("Helytelen kérés törzs.");
        }

        if(!felhasznalonev|| typeof(body.felhasznalonev) !== "string") {
            throw new Error("Helytelen felhasználónev.");
        }

        if(!email|| typeof(body.email) !== "string") {
            throw new Error("Helytelen email.");
        }
        if(!email.includes("@")) 
        {
            throw new Error("Az email-nek tartalmaznia kell a @-t.");
        }
        
        if(!jelszo|| typeof(body.jelszo) !== "string") {
            throw new Error("Helytelen jelszo.");
        }

        const [results, ] = await pool.query(
            `INSERT INTO felhasznalok (felhasznalonev, email, jelszo, club) 
             VALUES (?, ?, ?, ?)`,
            [felhasznalonev, email, jelszo, club]
        );

        res.status(201).json({
            message: "A felhasználó sikeresen regisztrálva.",
            results
        });
    } catch (err) {
        console.log(err);
        res.status(500).json({
            "error": "Nem sikerült regisztrálni a felhasználót."
        });
    }
});



app.listen(PORT, () => {
    console.log(`A szerver elindult localhost:${PORT} porton.`);
});