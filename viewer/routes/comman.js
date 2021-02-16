var express = require('express');
require('shelljs/global');
var router = express.Router();

// function getDateTime() {

    // var date = new Date();

    // var hour = date.getHours();
    // hour = (hour < 10 ? "0" : "") + hour;

    // var min  = date.getMinutes();
    // min = (min < 10 ? "0" : "") + min;

    // var sec  = date.getSeconds();
    // sec = (sec < 10 ? "0" : "") + sec;

    // var year = date.getFullYear();

    // var month = date.getMonth() + 1;
    // month = (month < 10 ? "0" : "") + month;

    // var day  = date.getDate();
    // day = (day < 10 ? "0" : "") + day;

    // return year + ":" + month + ":" + day + ":" + hour + ":" + min + ":" + sec;

// }

router.get('/', function (req, res, next) {
    exec('robot ' + process.env.W_TEST_HOME+ '/testcase/SwingUnit', function(code, stdout, stderr) {
        console.log('Exit code:', code);
        console.log('Program output:', stdout);
        res.render('comman', {"test":stdout.toString()});
    });
});

module.exports = router;