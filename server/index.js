const http = require('http');
const express = require('express');
const bodyParser = require('body-parser');
const homeData = require('./homeData');

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
    data: {
      username: 'username'
    }
  });
});

// 数据
router.get('/homeData', function(req, res, next) {
  res.send({
    code: 0,
    data: homeData
  });
});

http.createServer(app)
  .listen(5011);