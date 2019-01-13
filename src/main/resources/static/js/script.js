/**
 * Created by ladyi on 09.10.2018.
 */

$('#myModal').on('shown.bs.modal', function () {
    $('#myInput').trigger('focus')
});
var TIMER = 600;
// $("#subButton").submit(function(e) {
//
//     var url = "/login"; // the script where you handle the form input.
// console.log("!!!!!!!!!!!!!!!!");
//     $.ajax({
//         type: "POST",
//         url: url,
//         data: $("#login").serialize(), // serializes the form elements.
//         success: function(data)
//         {
//             console.log("++++++++++");
//             location('/greeting')
//         }
//
//     });
//
//     e.preventDefault(); // avoid to execute the actual submit of the form.
// });
$(document).ready(function () {

    $('#sidebarCollapse').on('click', function () {
        $('#sidebar').toggleClass('active');
    });




    function timer (seconds, tick, result) {
        if (seconds > 0) {
            tick(seconds);
            seconds -= 1;
            setTimeout(function () {
                timer(seconds, tick, result);
            }, 1000);
        } else {
            result();
        }
    }

    var timeFormat = (function (){
        function num(val){
            val = Math.floor(val);
            return val < 10 ? '0' + val : val;
        }

        return function (ms/**number*/){
            var sec = ms / 1000
                , hours = sec / 3600  % 24
                , minutes = sec / 60 % 60
                , seconds = sec % 60
            ;

            return  num(minutes) + ":" + num(seconds);
        };
    })();

    if($('*').is('#timerQ')){
        var st = $("input[name='stat']").val();
        var xmlHttp = new XMLHttpRequest();
        xmlHttp.onreadystatechange = function() {
            if (xmlHttp.readyState == 4 && xmlHttp.status == 200)
            {

                TIMER_v = TIMER-xmlHttp.responseText;
                if(TIMER_v<0) {
                    $("#qForm").submit();
                }
                timer(TIMER_v, function (s) {
                    $('#timerQ').html(timeFormat(s*1000));
                }, function () {

                    $('#timerQ').html(0);
                    $("#qForm").submit();
                });
            }

        }
        xmlHttp.open("GET", "/checkTimer?stat="+st, true); // true for asynchronous
        xmlHttp.send(null);

    }



});

function printDiv() {
    var printContents = document.getElementById("print-content").innerHTML;
    var originalContents = document.body.innerHTML;
    document.body.innerHTML = printContents;
    window.print();
    document.body.innerHTML = originalContents;
}