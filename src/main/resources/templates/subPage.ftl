<#import "temp/common.ftl" as c>

<@c.page>
 <style type="text/css">
     table {
         font-family: "Lucida Sans Unicode", "Lucida Grande", Sans-Serif;
         font-size: 14px;
         border-collapse: collapse;
         text-align: center;
     }
     th, td:first-child {
         background: #AFCDE7;
         color: black;
         padding: 10px 20px;
     }
     th, td {
         border-style: solid;
         border-width: 0 1px 1px 0;
         border-color: white;
     }
     td {
         background: #D8E6F3;
     }
     th:first-child, td:first-child {
         text-align: left;
     }
 </style>
<style type="text/css">
    .title_margin {
        margin-left: 110px;
        margin-bottom: 30px;
    }
    .title1_margin {
        margin-left: 130px;
        margin-top: 50px;
    }
    .function_margin {
        margin-left: 310px;
    }
    .parent {
        width: 100%;
        height: 100%;
        position: absolute;
        top: 0;
        left: 0;
        overflow: auto;
    }

    .block {
        width: 590px;
        height: 650px;
        position: absolute;
        top: 15%;
        left: 40%;
        margin: -125px 0 0 -125px;


    img {
        max-width: 100%;
        height: auto;
        display: block;
        margin: 0 auto;
        border: none;
    }
    }
</style>
<style type="text/css">
    /* Pagination links */
    .pagination a {
        color: black;
        float: left;
        padding: 8px 16px;
        text-decoration: none;
        transition: background-color .3s;
    }

    /* Style the active/current link */
    .pagination a.active {
        background-color: dodgerblue;
        color: white;
    }

    /* Add a grey background color on mouse-over */
    .pagination a:hover:not(.active) {background-color: #ddd;}
</style>
<div class="parent">
    <div class="block">
        <div class="title_margin" style="font-family:verdana">
            <b>${title}</b>
        </div>
        <div>
            <form action="/listParts/${defPage}" method="get">
                <div class="function_margin">
                <a href="/addPage"><img src="../images/add.png" alt="" width="15" height="15"></a>
                <input type="text" name="name" value="${filter}">
                <input type="image" src="../images/find.png" alt="Submit" width="15" height="15">
                </div>
                <div>
                    <a href="/allSort">Все</a>
                    <a href="/necessary">Необходимые</a>
                    <a href="/option">Опционные</a>
                </div>
            </form>
        </div>
        <div>
            <table>
                <thead>
                <tr>
                    <th>Наименование</th>
                    <th>Необходимость</th>
                    <th>Количество</th>
                    <th></th>
                    <th></th>
                </tr>
                </thead>
                <tbody>
    <#list parts as part>
    <tr>
        <td>${part.name}</td>
        <td>${part.necessary}</td>
        <td>${part.quantity}</td>
        <td><a href="/edit/${part.id}"><img src="../images/edit.png" alt="" height="25" width="25"/></a></td>
        <td><a href="/delete/${part.id}"><img src="../images/delete.png" alt="" height="25" width="25"/></a></td>
    </tr>
    </#list>
                </tbody>
            </table>
            <div class="pagination">
        <#list pages as page>
            <a href="/listParts/${page}">${page}</a>
        </#list>
            </div>
        </div>
        <div>
            <p  class="title1_margin">
                <b>Вы можете собрать ${countPc} компьютеров</b>
            </p>
        </div>
    </div>
</div>
</@c.page>

