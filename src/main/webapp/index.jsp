<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: linghu
  Date: 17/02/07
  Time: 13:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="ctp" value="<%=request.getContextPath()%>"/>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="${ctp}/assets/jquery/1.12.1/jquery.js"></script>
    <link href="${ctp}/assets/bootstrap/css/bootstrap.css" rel="stylesheet">
    <link href="${ctp}/assets/bootstrap-table/dist/bootstrap-table.css" rel="stylesheet">
    <script type="text/javascript" src="${ctp}/assets/bootstrap/js/bootstrap.js"></script>
    <script type="text/javascript" src="${ctp}/assets/bootstrap-table/dist/bootstrap-table.js"></script>
    <script type="text/javascript" src="${ctp}/assets/bootstrap-table/dist/locale/bootstrap-table-zh-CN.js"></script>
</head>
<body>
<a href="${ctp}/test/test">点击进入controller</a>
<div id="toolbar">
    <button id="remove" class="btn btn-danger" disabled>
        <i class="glyphicon glyphicon-remove"></i> Delete
    </button>
</div>
<table id="table"
       data-toolbar="#toolbar"
       data-search="true"
       data-show-refresh="true"
       data-show-toggle="true"
       data-show-columns="true"
       data-show-export="true"
       data-detail-view="true"
       data-detail-formatter="detailFormatter"
       data-minimum-count-columns="2"
       data-show-pagination-switch="true"
       data-pagination="true"
       data-id-field="id"
       data-page-list="[10, 25, 50, 100, ALL]"
       data-show-footer="false"
       data-side-pagination="server"
       data-response-handler="responseHandler">
</table>
<table id="callServiceTable" >

</table>
<script type="text/javascript">
    $('#callServiceTable').bootstrapTable({
        url: "${ctp}/test/test",
        pagination: true,
        sidePagination: 'server',
        pageNumber: 1,
        pageSize: 10,
        pageList: [10, 25, 50, 100],
         height: 500,
        striped: true,
        showHeader: true,
        sortName: 'id',
        sortOrder: 'asc',
        search: true,
        searchOnEnterKey: true,
        showRefresh: true,
        idField: "id",
        columns: [
            {
                title: 'ID',
                field: 'id',
                width: 180
            },
            {
                title: "用户名",
                field: 'userName',
                width: 180
            },
            {
                title: '密码',
                field: 'password',
                searchable: true,
                width: 180,
                formatter: function (value, row, index) {
                    return "<a  class='CodeNumberViewAction' data-value=" + value + "  data-table='#callServiceTable' style='cursor: pointer'>" + value + "</a>"
                },
            }
        ],
        onPostBody: function () {
            console.info("======================onPostBody================");
        },
        responseHandler: function (res) {
            $.each(res.rows, function (idx, data) {
                console.info("======================responseHandler================" + data);
            });
            return res;
        },
        onClickRow: function (r, t, f) {
            console.info("======================onClickRow================" + r, t, f);
        },
        formatNoMatches: function () {
            console.info("======================formatNoMatches================");
            return '';
        },
        queryParams:function queryParams(params) {
            var temp = {
                sort:params.sort,
                offset: params.offset,  //页码
                limit:params.limit,
                id:params.search
            }
            return temp;
        },
    });
</script>

</body>
</html>
