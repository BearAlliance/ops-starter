let express = require('express');
let router = express.Router();

let book = require('../services/book-service');

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Express' });
});

router.get('/book', book.getBooks);
router.post('/book', book.postBook);

router.get('/book/:id', book.getBook);
router.delete('/book/:id', book.deleteBook);
router.put('/book:id', book.updateBook);

module.exports = router;
