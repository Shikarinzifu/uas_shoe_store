const express = require("express");
const cors = require("cors");
const jwt = require("jsonwebtoken");

const app = express();
app.use(cors());
app.use(express.json());

const SECRET = "shoestoresecret";

app.post("/login", (req, res) => {
  const { firebaseToken, email } = req.body;

  if (!firebaseToken) {
    return res.status(401).json({ message: "No token" });
  }

  const token = jwt.sign(
    { email: email },
    SECRET,
    { expiresIn: "1h" }
  );

  res.json({
    message: "Login Success",
    jwt: token
  });
});

app.get("/products", (req, res) => {
  res.json([
    { name: "Nike Air Max", price: 1500000 },
    { name: "Adidas Samba", price: 1800000 },
    { name: "Vans Old Skool", price: 950000 }
  ]);
});

app.listen(3000, () => {
  console.log("Backend running on port 3000");
});