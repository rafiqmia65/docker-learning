import express from "express";

const app = express();
const port = process.env.PORT || 5000;
const NODE_ENV = process.env.NODE_ENV;

app.get("/", (req, res) => {
  res.json({ message: `Hello from the server! (Environment: ${NODE_ENV})` });
});

app.listen(port, () => {
  console.log(`Server is running on http://localhost:${port}`);
});
