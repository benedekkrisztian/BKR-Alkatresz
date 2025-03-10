import express from "express";
import mysql from "mysql2/promise";
import bcrypt from "bcrypt";
import jwt from "jsonwebtoken";
import cors from "cors";

const PORT = 3000;

const app = express();
app.use(cors());
app.use(express.json());

const pool = mysql.createPool({
    host: "localhost",
    user: "root",
    password: "",
    database: "bkr_alkatresz",
});



app.get("/tipus/:id", async (req, res) => {
    try {
        const { id } = req.params;
        const [results,] = await pool.query(
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
        const [results,] = await pool.query(
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

app.post("/regisztracio", async (req, res) => {
    try {
        const body = req.body;
        const { email, felhasznalonev, jelszo } = req.body;
        const club = false;


        if (!body || typeof (body) !== "object" || Object.keys(body).length !== 3) {
            throw new Error("Helytelen kérés törzs.");
        }

        if (!felhasznalonev || typeof (body.felhasznalonev) !== "string") {
            throw new Error("Helytelen felhasználónev.");
        }

        if (!email || typeof (body.email) !== "string") {
            throw new Error("Helytelen email.");
        }
        if (!email.includes("@")) {
            throw new Error("Az email-nek tartalmaznia kell a @-t.");
        }

        if (!jelszo || typeof (body.jelszo) !== "string") {
            throw new Error("Helytelen jelszo.");
        }

        const [existingUser,] = await pool.query(
            "SELECT * FROM felhasznalok WHERE felhasznalonev = ?;", [body.felhasznalonev]
        );

        if (existingUser.length > 0) {
            throw new Error("A felhasználónev már foglalt.");
        }

        const hashedPassword = await bcrypt.hash(body.jelszo, 14);

        const [results,] = await pool.query(
            `INSERT INTO felhasznalok (felhasznalonev, email, jelszo, club) 
             VALUES (?, ?, ?, ?)`,
            [felhasznalonev, email, hashedPassword, club]
        );

        if (results.affectedRows < 1) {
            throw new Error("A regisztráció sikertelen.");
        }

        res.status(201).json({
            message: "A felhasználó sikeresen regisztrálva.",
            results
        });
    } catch (err) {
        if (err.message.includes("Invalid")) {
            res.status(400).json({
                error: err.message,
            });
            return;
        }
        res.status(500).json({
            error: "Valami hiba történt."
        });
    }
});

app.post("/bejelentkezes", async (req, res) => {
    try {
        const body = req.body;
        const { email, jelszo } = req.body;

        if (!body || typeof (body) !== "object" || Object.keys(body).length !== 2) {
            throw new Error("Helytelen kérés törzs.");
        }

        if (!email || typeof (body.email) !== "string") {
            throw new Error("Helytelen email.");
        }
        if (!email.includes("@")) {
            throw new Error("Az email-nek tartalmaznia kell a @-t.");
        }

        if (!jelszo || typeof (body.jelszo) !== "string") {
            throw new Error("Helytelen jelszo.");
        }

        const [existingEmail,] = await pool.query(
            "SELECT * FROM felhasznalok WHERE email = ?;", [body.email]
        );

        if (existingEmail.length < 1) {
            throw new Error("A felhasználó nem letezik.");
        }

        const isPasswordValid= await bcrypt.compare(body.jelszo, existingEmail[0].jelszo);

        if (!isPasswordValid) {
            throw new Error("Helytelen jelszo.");
        }

        const token = jwt.sign(
            {_id: existingEmail[0].id},
            "secret",
            {expiresIn: "2h"}
        );

        res.json({token:token});

    } catch (err) {
        if (err.message.includes("Invalid")) {
            res.status(400).json({
                error: err.message,
            });
            return;
        }
        res.status(500).json({
            error: "Valami hiba történt."
        });
     }
});


app.get("/profile", async (req, res)=>{
    try{
        const authHeader = req.headers["authorization"];

        if(!authHeader){
            throw new Error("Hitelesítés szükséges.");

        }

        const token =authHeader.split(" ")[1];

        if(!token){
            throw new Error("Hitelesítés szükséges.");
        }
        const decodedToken= jwt.verify(token, "secret")
        const [user] = await pool.query(
            "SELECT * FROM felhasznalok WHERE id=? ",[decodedToken._id]
        );

        if(user.length !== 1){
            throw new Error("Hiba a hitelesítés során: Invalid token.")
        }

        res.json({
            username: user[0].username
        });
    }catch (err) {
        if (err.message.includes("Invalid")) {
            res.status(401).json({
                error: err.message,
            });
            return;
        }  if (err.message.includes("Invalid")) {
            res.status(400).json({
                error: err.message,
            });
            return;
        }
        res.status(500).json({
            error: "Valami hiba történt."
        });
    }
});


app.listen(PORT, () => {
    console.log(`A szerver elindult localhost:${PORT} porton.`);
});