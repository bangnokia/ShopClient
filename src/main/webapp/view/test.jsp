<%-- 
    Document   : test
    Created on : Aug 15, 2016, 4:59:08 PM
    Author     : daudau
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Document</title>
        <!-- Latest compiled and minified CSS & JS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
        <script src="http://code.jquery.com/jquery.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
    </head>
    <body>
        <div id="result"></div>
        <script>
            $(document).ready(function () {
                $.ajax({
                    url: 'http://localhost:8080/mavenproject3/home',
                    method: 'GET',
                    success: function (res) {
                        console.log(res);
                    },
                    error: function (res) {
                        console.log(res);
                    }
                });
            });
        </script>
    </body>
</html>