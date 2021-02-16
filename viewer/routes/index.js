var express = require('express');
var router = express.Router();
var fs = require('fs');

var path = process.env.W_TEST_HOME +  '/result';
var obj = {};

/**
 * [readFolder fs에서 읽어온 filelist를 저장한다.]
 * @return {[null]} [{"test" : [1, 2, 3, 4,...]} 와 같은 형태로 파일리스트 전달]
 */
function readFolder() {
    var files = fs.readdirSync(path).sort();
    console.log(files);
    obj.test = files;
};

router.get('/', function (req, res, next) {
    readFolder();
	res.render('index', obj);
});

module.exports = router;