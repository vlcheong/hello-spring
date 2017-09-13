<%@ page autoFlush="true" contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="context" value="${pageContext.request.contextPath}"/>
<c:set var="resources" value="${pageContext.request.contextPath}/resources"/>
<!DOCTYPE HTML>
<html lang="en">
    <head>
        <jsp:include page="meta.jsp">
            <jsp:param name="title" value="Hello Spring"/>
        </jsp:include>
        <jsp:include page="css.jsp"/>
    </head>
    <body>
        <div class="container">
            <div class="jumbotron">
                <form id="guestForm" class="form-inline">
                    <div class="form-group">
                        <label for="guestName">Guest Name</label>
                        <input type="text" name="guestName" id="guestName" class="form-control" placeholder="John Doe" autofocus>
                    </div>
                    <button type="button" class="btn btn-primary" id="requestParam" title="POST">
                        <i class="glyphicon glyphicon-cloud"></i>&nbsp;
                        <span>RequestParam</span>
                    </button>

                    <button type="button" class="btn btn-danger" id="postForm" title="POST">
                        <i class="glyphicon glyphicon-download-alt"></i>&nbsp;
                        <span>Post Form</span>
                    </button>

                    <button type="button" class="btn btn-success" id="httpRequest" title="GET">
                        <i class="glyphicon glyphicon-send"></i>&nbsp;
                        <span>HttpServletRequest</span>
                    </button>
                    <button type="button" class="btn btn-info" id="redirect" title="GET">
                        <i class="glyphicon glyphicon-star"></i>&nbsp;
                        <span>Redirect</span>
                    </button>
                    <button type="button" class="btn btn-warning" id="pathVariable" title="GET">
                        <i class="glyphicon glyphicon-cog"></i>&nbsp;
                        <span>PathVariable</span>
                    </button>
                </form>
                <h2>Greeting From Server</h2>
                <a id="clear" href="javascript:void(0);"><strong>Clear</strong></a>
                <div class="content"></div>
            </div>
        </div>
        <jsp:include page="script.jsp"/>
        <script>
            $(document).ready(function () {
                'use strict';
                $('a#clear').click(function (e) {
                    $('.content').empty();
                });

                $('#requestParam').click(function (e) {
                    e.preventDefault();
                    $.ajax({
                        method: 'POST',
                        url: '${context}/guest-greeting',
                        cache: false,
                        dataType: 'json',
                        data: { guestName: $('#guestName').val() }
                    })
                    .done(function (json) {
                        $('.content').append(formatGreeting(json));
                    })
                    .fail(function (xhr, textStatus, errorThrown) {
                        alert(errorThrown);
                    });
                });

                $('#postForm').on('click', function (e) {
                    e.preventDefault();
                    $.ajax({
                        method: 'POST',
                        url: '${context}/greeting',
                        cache: false,
                        dataType: 'json',
                        data: $('#guestForm').serialize()
                    })
                    .done(function (json) {
                        $('.content').append(formatGreeting(json));
                    })
                    .fail(function (xhr, textStatus, errorThrown) {
                        alert(errorThrown);
                    });
                });

                $('#httpRequest').click(function (e) {
                    e.preventDefault();
                    $.ajax({
                        method: 'GET',
                        url: '${context}/page',
                        cache: false,
                        dataType: 'html',
                        data: { guestName: $('#guestName').val() }
                    })
                    .done(function (html) {
                        $('.content').append(html);
                    })
                    .fail(function (xhr, textStatus, errorThrown) {
                        alert(errorThrown);
                    });
                });

                $('#redirect').click(function (e) {
                    e.preventDefault();
                    $.ajax({
                        method: 'GET',
                        url: '${context}/redirect',
                        cache: false,
                        dataType: 'json',
                        data: { guestName: $('#guestName').val() }
                    })
                    .done(function (json) {
                        $('.content').append(formatGreeting(json));
                    })
                    .fail(function (xhr, textStatus, errorThrown) {
                        alert(errorThrown);
                    });
                });

                $('#pathVariable').click(function (e) {
                    e.preventDefault();
                    let name = $.trim($('#guestName').val());
                    $.ajax({
                        method: 'GET',
                        url: '${context}/' + (name.length === 0 ? 'Guest' : name),
                        cache: false,
                        dataType: 'html'
                    })
                    .done(function (html) {
                        $('.content').append(html);
                    })
                    .fail(function (xhr, textStatus, errorThrown) {
                        alert(errorThrown);
                    });
                });

                let formatGreeting = function (json) {
                    return '<p>' + json.date + ' ' + json.time + ':- <b>' + json.greeting + '</b></p>';
                }
            });
        </script>
    </body>
</html>