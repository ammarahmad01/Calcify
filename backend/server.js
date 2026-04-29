const express = require('express');
const cors = require('cors');
const app = express();

app.use(cors());
app.use(express.json());

let history = [];

app.get('/health', (req, res) => {
  res.json({ status: 'ok' });
});

app.get('/history', (req, res) => {
  res.json(history);
});

app.post('/history', (req, res) => {
  const { calculation } = req.body;
  history.push({ calculation, time: new Date().toISOString() });
  if (history.length > 10) history.shift();
  res.json({ success: true });
});

app.listen(3000, () => console.log('Backend running on port 3000'));
