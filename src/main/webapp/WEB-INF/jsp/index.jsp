<%@ page autoFlush="true" contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="context" value="${pageContext.request.contextPath}"/>
<c:set var="resources" value="${pageContext.request.contextPath}/resources"/>
<!DOCTYPE HTML>
<html lang="en">
    <head>
        <meta charset="utf-8"/>
        <meta http-equiv="Cache-Control" content="no-cache"/>
        <meta http-equiv="Pragma" content="no-cache"/>
        <meta http-equiv="Expires" content="-1"/>
        <meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"/>
        <title>Hello Spring</title>
        <link rel="stylesheet" href="${resources}/bootstrap/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="${resources}/bootstrap/css/bootstrap-theme.min.css"/>
        <style>
            html, body {
                margin: 10px;
            }
            *:focus {
                outline: none;
            }
            a:focus {
                text-decoration: none;
            }
            a:hover {
                text-decoration: underline;
            }
            .btn {
                min-width: 160px;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="jumbotron">
                <form class="form-inline">
                    <div class="form-group">
                        <label for="guestName">Guest Name</label>
                            <input type="text" name="guestName" id="guestName" class="form-control" placeholder="John Doe" autofocus>
                        </div>
                        <button type="button" class="btn btn-primary" id="requestParam" aria-label="Left Align">
                            <i class="glyphicon glyphicon-cloud"></i>&nbsp;
                            <span>RequestParam</span>
                        </button>
                        <button type="button" class="btn btn-success" id="httpRequest" aria-label="Left Align">
                            <i class="glyphicon glyphicon-send"></i>&nbsp;
                            <span>HttpServletRequest</span>
                        </button>
                        <button type="button" class="btn btn-info" id="redirect" aria-label="Left Align">
                            <i class="glyphicon glyphicon-star"></i>&nbsp;
                            <span>Redirect</span>
                        </button>
                        <button type="button" class="btn btn-warning" id="pathVariable" aria-label="Left Align">
                            <i class="glyphicon glyphicon-cog"></i>&nbsp;
                            <span>PathVariable</span>
                        </button>
                    </div>
                </form>
                <h2>Greeting from server</h2>
                <a id="clear" href="javascript:void(0);"><strong>Clear</strong></a>
                <div class="content">
                </div>
            </div>
        </div>
        <script src="${resources}/jquery/jquery-2.1.4.min.js"></script>
        <script src="${resources}/bootstrap/js/bootstrap.min.js"></script>
        <script>
            $(document).ready(function() {
                'use strict';
                $('a#clear').click(function(e) {
                    $('.content').empty();
                });

                $('#requestParam').click(function(e) {
                    e.preventDefault();
                    $.ajax({
                        async: true,
                        method: 'POST',
                        url: '${context}/greeting',
                        cache: false,
                        dataType: 'json',
                        data: {guestName: $('#guestName').val()}
                    })
                    .done(function(json) {
                        var greeting = '<p>' + json.date + ' ' + json.time + ':- <b>' + json.greeting + '</b></p>';
                        $('.content').append(greeting);
                    })
                    .fail(function(xhr, textStatus, errorThrown) {
                        alert(errorThrown);
                    });
                });

                $('#httpRequest').click(function(e) {
                    e.preventDefault();
                    var name = $.trim($('#guestName').val());
                    $.ajax({
                        async: true,
                        method: 'GET',
                        url: '${context}/page',
                        cache: false,
                        dataType: 'html',
                        data: {guestName: $('#guestName').val()}
                    })
                    .done(function(html) {
                        $('.content').append(html);
                    })
                    .fail(function(xhr, textStatus, errorThrown) {
                        alert(errorThrown);
                    });
                });

                $('#redirect').click(function(e) {
                    e.preventDefault();
                    $.ajax({
                        async: true,
                        method: 'GET',
                        url: '${context}/redirect',
                        cache: false,
                        dataType: 'json',
                        data: {guestName: $('#guestName').val()}
                    })
                    .done(function(json) {
                        var greeting = '<p>' + json.date + ' ' + json.time + ':- <b>' + json.greeting + '</b></p>';
                        $('.content').append(greeting);
                    })
                    .fail(function(xhr, textStatus, errorThrown) {
                        alert(errorThrown);
                    });
                });

                $('#pathVariable').click(function(e) {
                    e.preventDefault();
                    var name = $.trim($('#guestName').val());
                    $.ajax({
                        async: true,
                        method: 'GET',
                        url: '${context}/' + (name.length === 0 ? 'Guest' : name),
                        cache: false,
                        dataType: 'html'
                    })
                    .done(function(html) {
                        $('.content').append(html);
                    })
                    .fail(function(xhr, textStatus, errorThrown) {
                        alert(errorThrown);
                    });
                });

            });
        </script>
    </body>
</html>