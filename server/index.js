const http = require('http');
const express = require('express');
const bodyParser = require('body-parser');

/**
 * 提供mock数据的服务
 */

const app = express();
const router = express.Router();
const jsonParser = bodyParser.json();

app.use('/', router);

// 登陆
router.post('/login', jsonParser, function(req, res, next) {
  const body = req.body;

  res.send({
    code: 0,
    message: body
  });
});

http.createServer(app)
  .listen(5011);