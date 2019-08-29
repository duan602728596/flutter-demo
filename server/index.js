const http = require('http');
const express = require('express');
const bodyParser = require('body-parser');
const homeData = require('./homeData');
const { page0, page1 } = require('./listData');

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

// 列表
router.get('/listData', function(req, res, next) {
  const page = req.query.page;
  const data = [page0, page1];
  let pageNum = page ? Number(page) : 1;

  if (pageNum < 1) {
    pageNum = 1;
  }

  res.send({
    next: pageNum < 2,
    data: pageNum > 2 ? [] : data[pageNum - 1]
  });
});

http.createServer(app)
  .listen(5011);