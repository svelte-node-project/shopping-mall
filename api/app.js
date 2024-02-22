const express = require('express')
const { Pool } = require('pg');
const cors = require('cors')
const app = express()

app.use(express.json())
app.use(cors())

const pool = new Pool({
    user: 'username',
    host: 'database',
    database: 'database',
    password: 'password',
    port: 5432,
  });

app.get('/', (request, response) => {
  response.send('<h1>Hello World!</h1>')
})

async function getTestData() {
  const res = await pool.query('SELECT * FROM todos');
  return res.rows
}

app.get('/api/todos', async (request, response) => {
  const data = await getTestData()
  response.json(data)
})

const PORT = 3001
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`)
})