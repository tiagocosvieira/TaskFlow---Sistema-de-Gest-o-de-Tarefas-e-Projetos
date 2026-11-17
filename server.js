/**
 * TaskFlow - Servidor Principal (Entry Point)
 * Inicializa a aplicação conectando Model, View e Controller.
 */
const http = require('http');
const fs = require('fs');
const path = require('path');
const TaskController = require('./src/controllers/TaskController');

const PORT = 3000;

const server = http.createServer((req, res) => {
    if (req.url === '/' || req.url === '/index.html') {
        const filePath = path.join(__dirname, 'src', 'views', 'index.html');
        fs.readFile(filePath, (err, content) => {
            if (err) {
                res.writeHead(500);
                res.end('Erro interno no servidor.');
            } else {
                res.writeHead(200, { 'Content-Type': 'text/html; charset=utf-8' });
                res.end(content);
            }
        });
    } else if (req.url === '/api/projetos') {
        res.writeHead(200, { 'Content-Type': 'application/json; charset=utf-8' });
        res.end(JSON.stringify(TaskController.listarProjetos()));
    } else {
        res.writeHead(404, { 'Content-Type': 'text/html; charset=utf-8' });
        res.end('<h1>404 - Página não encontrada</h1>');
    }
});

server.listen(PORT, () => {
    console.log(`Servidor rodando em http://localhost:${PORT}`);
});