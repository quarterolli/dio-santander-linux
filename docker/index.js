const express = require('express');
const mysql = require('mysql2');

const app = express();
const port = 3000;

const db = mysql.createConnection({
  host: '192.48.173.215',
  user: 'root',
  password: '321',
  database: 'school'
});

db.connect((err) => {
  if (err) {
    console.error('Erro ao conectar ao banco de dados:', err.message);
    return;
  }
  console.log('Conectado ao banco de dados!');
});

app.get('/', (req, res) => {
  const query = `
    INSERT INTO students (first_name, last_name, email)
    VALUES ?
  `;

  const values = [
    ['John', 'Doe', 'john.doe@shelf.app'],
    ['Jane', 'Smith', 'jane.smith@shelf.app'],
    ['Alice', 'Johnson', 'alice.johnson@shelf.app'],
  ];

  db.query(query, [values], (err, result) => {
    if (err) {
      res.send(`Erro ao inserir: ${err.message}`);
    } else {
      res.send(`${values.length} novos registros criados com sucesso!`);
    }
  });
});

app.listen(port, () => {
  console.log(`Servidor rodando em http://localhost:${port}`);
});
