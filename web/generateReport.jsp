<%-- 
    Document   : generateReport2
    Created on : 2019/12/15, 下午 08:34:46
    Author     : tuningwan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
</html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
</head>
<body>
    <%@include file="header.jsp" %>
    <div class="container">
        <div class="schedule">

            <!--track-->
            <span class="track-slot" aria-hidden="true" style="grid-column: track-1; grid-row: tracks;">Monday</span>
            <span class="track-slot" aria-hidden="true" style="grid-column: track-2; grid-row: tracks;">Tuesday</span>
            <span class="track-slot" aria-hidden="true" style="grid-column: track-3; grid-row: tracks;">Wednesday</span>
            <span class="track-slot" aria-hidden="true" style="grid-column: track-4; grid-row: tracks;">Thursday</span>
            <span class="track-slot" aria-hidden="true" style="grid-column: track-5; grid-row: tracks;">Friday</span>

            <!--8:00-->
            <h2 class="time-slot" style="grid-column: times; grid-row: time-0800;">8:00am</h2>

            <div class="session session-1 track-1" style="grid-column: track-1; grid-row: time-0800 / time-0900;">
                <h3 class="title">Talk Title1</h3>
                <span class="time">8:00 - 9:00</span>
                <span class="author">Jesse</span>
            </div>

            <div class="session session-2 track-2" style="grid-column: track-2-start; grid-row: time-0800 / time-0900;">
                <h3 class="title">Talk Title2</h3>
                <span class="time">8:00 - 9:00</span>
                <span class="author">Jesse</span>
            </div>	

            <div class="session session-3 track-3" style="grid-column: track-3-start; grid-row: time-0800 / time-0900;">
                <h3 class="title">Talk Title3</h3>
                <span class="time">8:00 - 9:00</span>
                <span class="author">Jesse</span>
            </div>

            <div class="session session-4 track-4" style="grid-column: track-4-start; grid-row: time-0800 / time-1000;">
                <h3 class="title">Talk Title4</h3>
                <span class="time">8:00 - 10:00</span>
                <span class="author">Jesse</span>
            </div>
            
            <div class="session session-4 track-5" style="grid-column: track-5-start; grid-row: time-0800 / time-1000;">
                <h3 class="title">Talk Title5</h3>
                <span class="time">8:00 - 10:00</span>
                <span class="author">Jesse</span>
            </div>

            
            <!--9:00-->
            <h2 class="time-slot" style="grid-column: times; grid-row: time-0900;">9:00am</h2>

            <div class="session session-5 track-3" style="grid-column: track-3-start; grid-row: time-0900 / time-1000;">
                <h3 class="title">Talk Title6</h3>
                <span class="time">9:00 - 10:00</span>
                <span class="author">Jesse</span>
            </div>

            <!--10:00-->
            <h2 class="time-slot" style="grid-column: times; grid-row: time-1000;">10:00am</h2>

            <div class="session session-6 track-1" style="grid-column: track-1-start / track-2-end; grid-row: time-0900 / time-1000;">
                <h3 class="title">Talk Title7</h3>
                <span class="time">9:00 - 10:00</span>
                <span class="author">Jesse</span>
            </div>

            <div class="session session-8 track-1" style="grid-column: track-1-start; grid-row: time-1000 / time-1100;">
                <h3 class="title">Talk Title8</h3>
                <span class="time">10:00 - 11:00</span>
                <span class="author">Jesse</span>
            </div>

            <div class="session session-9 track-2" style="grid-column: track-2-start; grid-row: time-1000 / time-1200;">
                <h3 class="title">Talk Title9</h3>
                <span class="time">10:00 - 12:00</span>
                <span class="author">Jesse</span>
            </div>

            <div class="session session-10 track-4" style="grid-column: track-4-start; grid-row: time-1000 / time-1100;">
                <h3 class="title">Talk Title10</h3>
                <span class="time">10:00 - 11:00</span>
                <span class="author">Jesse</span>
            </div>

            <!--11:00-->
            <h2 class="time-slot" style="grid-column: times; grid-row: time-1100;">11:00am</h2>

            <div class="session session-11 track-3" style="grid-column: track-3-start; grid-row: time-1100 / time-1300;">
                <h3 class="title">Talk Title</h3>
                <span class="time">11:00 - 13:00</span>
                <span class="author">Jesse</span>
            </div>

            <!--12：00-->
            <h2 class="time-slot" style="grid-column: times; grid-row: time-1200;">12：00pm</h2>
            
            <div class="session session-12 track-5" style="grid-column: track-5-start; grid-row: time-1200 / time-1400;">
                <h3 class="title">Talk Title</h3>
                <span class="time">11:00 - 13:00</span>
                <span class="author">Jesse</span>
            </div>
            
            
            <h2 class="time-slot" style="grid-column: times; grid-row: time-1300;">13：00pm</h2>
            
            
            <h2 class="time-slot" style="grid-column: times; grid-row: time-1400;">14：00pm</h2>

        </div>
    </div>
    <style>
        .container {
            padding: 50px;
            counter-reset: session;
            max-width: 1100px;
            margin: 0 auto;
            line-height: 1.5;
        }

        .track-slot {
            display: none;
        }
        .session {
            margin-bottom:  1em;
        }

        @supports(display:grid) {
            @media screen and (min-width:700px) {
                .schedule {
                    display: grid;
                }

                .schedule::after {
                    display: block;
                    content: '';
                    position: sticky;
                    top: 0;
                    grid-column: track-1 / -1;
                    grid-row: tracks;
                    z-index: 999;
                    background-color: rgba(255,255,255,.9);
                }

                .track-slot {
                    display: block;
                    padding: 10px 5px 5px;
                    position: sticky;
                    top: 0; 
                    z-index: 1000;
                }
                .session {
                    margin: 0;
                }
            }
        }

        .schedule {
            grid-gap: 1em;
            grid-template-rows:
                [tracks] auto
                [time-0800] 1fr
                [time-0900] 1fr
                [time-1000] 1fr
                [time-1100] 1fr
                [time-1200] 1fr
                [time-1300] 1fr
                [time-1400] 1fr
                [time-1500] 1fr
                [time-1600] 1fr
                ;
            grid-template-columns:
                [times] 4em
                [track-1-start] 1fr
                [track-1-end track-2-start] 1fr
                [track-2-end track-3-start] 1fr
                [track-3-end track-4-start] 1fr
                [track-4-end track-5-start] 1fr
                [track-5-end]
                ;
        }

        .text {
            max-width: 750px;
            font-size: 18px;
            margin: 0 auto 50px;
        }

        .meta {
            color: #555;
            font-style: italic;
        }
        .meta a {
            color: #555;
        }

        hr {
            margin: 40px 0;
        }

        .session {
            padding: .5em;
            border-radius: 2px;
            font-size: 14px;
        }

        .title,
        .time-slot {
            margin: 0;
            font-size: 1em;
        }

        body {
            counter-reset: session-count;
        }
        .title::before {
            counter-increment: session-count;
            content: 'Session #' counter(session-count) ': ';
        }

        .track-slot,
        .time-slot {
            font-weight: bold;
            font-size:.75em;
        }

        span {
            display: block;
        }

        .track-1 {
            background-color: #1259B2;
            color: #fff;
        }

        .track-2 {
            background-color: #687f00;
            color: #fff;
        }

        .track-3 {
            background-color: #544D69;
            color: #fff;
        }

        .track-4 {
            background-color: #c35500;
            color: #fff;
        }

        .track-5 {
            background-color: #800000;
            color: #fff;
        }

        .track-many {
            display: flex;
            justify-content: center;
            align-items: center;
            background: #ccc;
            color: #000;
        }

        ins {
            text-decoration: none;
            background-color: #ddffdd;
        }
    </style>>
</body>

</html>