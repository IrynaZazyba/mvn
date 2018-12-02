/**
 * Created by ladyi on 09.10.2018.
 */

$('#myModal').on('shown.bs.modal', function () {
    $('#myInput').trigger('focus')
});

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

});
