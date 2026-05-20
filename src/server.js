import express from 'express';

const app = express();
const PORT = 5000;


app.get('/api/data', (req, res) => {
  res.json({ message: 'Hello from the server!' });
});

app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});
