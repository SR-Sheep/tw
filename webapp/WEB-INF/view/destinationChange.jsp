<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>title</title>
    <link rel="stylesheet" href="css/all.min.css">
    <link rel="stylesheet" href="css/notosanskr.css">
    <link rel="stylesheet" href="css/reset.css">
    <style>


        body{
            font-family: "Noto Sans KR", sans-serif;
            user-select: none;

        }
        #adminWrap{
            width: 1100px;
            overflow: hidden;
        }
        #adminWrap h1{
            margin-top: 50px;
            margin-left: 100px;
            font-size: 25px;
        }
        #btnWrap{
            float: right;
        }
        #btnWrap button{
            position: relative;
            top:-30px;
            right: 100px;
            font-family: "Noto Sans KR", sans-serif;
            background-color: #fff;
        }
        #tableWrap table{
            width: 1000px;
            margin-left: 50px;
        }
        #tableWrap th{
            background-color: #27AE60;
            height: 70px;
            line-height: 70px;
        }
        #tableWrap td{
            text-align: center;
            background-color: #fff;
        }
        tr{
            border-bottom: 1px solid #424242;
        }
        td{
            background-color: red;
            height: 100px;
        }

        .user_name{
            margin-top: 15px;
        }
        .basic{
            margin-top: 15px;
            margin-left: 60px;
            width: 80px;
            height: 20px;
            margin-bottom: 15px;
            border: 2px solid #27AE60;
            color: #27AE60;
        }
        .post_num{
            margin-top: 15px;
            text-align: left;
            color: #bebebe;
            margin-bottom: 10px;
        }
        .address{
            margin-bottom: 10px;
            text-align: left;
        }
        .address_detail{
            text-align: left;
        }
        .phone{
            vertical-align: middle;
        }
        .c_d_btn{
            vertical-align: middle;
        }
        .basic_margin{
            vertical-align: middle;
        }
        .basic_name{
            margin-top: 15px;
        }
        .c_d_btn button{
            margin-left: 10px;
        }
        #logoPop img{
            margin-top: 5px;
            margin-left: 10px;
        }
        .btn{
            cursor: pointer;
            border: none;
            outline: none;
            background-color: #fff;
        }
        #closePop .btn{
            margin-top: 23px;
            float: right;
            font-size: 30px;
            background-color: #fff;
        }
        .btn img{
            width: 50px;
            height: 50px;
        }
    </style>
</head>
<body>

        <div id="destinationWrap">
            <div id="adminWrap">
                <h1>????????? ??????</h1>
                <div id="btnWrap">
                    <button class="btn"><img src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24'%3E %3Cg fill='none' fill-rule='nonzero'%3E %3Cpath d='M0 0h24v24H0z'/%3E %3Cpath stroke='%23000' stroke-width='2' d='M7.05 7.05l9.9 9.9M16.95 7.05l-9.9 9.9'/%3E %3C/g%3E %3C/svg%3E" alt="?????? ??????"></button>
                </div>
            </div>
            <div id="tableWrap">
                <table>
                    <thead>
                    <tr>
                        <th style="width: 20%" >?????????</th>
                        <th style="width: 30%">??????</th>
                        <th style="width: 25%">?????????</th>
                        <th style="width: 25%">??????</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <!--????????????????????? class="basic_name" ???????????? -->
                        <td class="basic_margin"><p class="destination_name basic_name">??????</p><p class="user_name">?????????</p> <p class="basic">???????????????</p></td>
                        <td><p class="post_num">12345</p> <p class="address">????????? ????????? ????????? 145</p> <p class="address_detail">???????????? 3??? ???????????????</p></td>
                        <td class="phone">010-1234-5678</td>
                        <td class="c_d_btn"><button>??????</button></td>
                    </tr>
                    <tr>
                        <td class="basic_margin"><p class="destination_name">??????</p><p class="user_name">?????????</p></td>
                        <td><p class="post_num">12345</p> <p class="address">????????? ????????? ????????? 145</p> <p class="address_detail">???????????? 3??? ???????????????</p></td>
                        <td class="phone">010-1234-5678</td>
                        <td class="c_d_btn"><button>??????</button></td>

                    </tr>

                    </tbody>
                </table>
            </div>
        </div>

<script src="js/jquery.js"></script>

</body>
</html>