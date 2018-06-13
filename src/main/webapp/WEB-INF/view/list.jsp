<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html
        PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN""http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html >
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <script type="text/javascript" src="${APP_PATH }/static\bootstrap-3.3.7-dist\js\jquery-1.12.4.min.js"></script>
    <link href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <title>管理</title>
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <h1>
                Wu-CRUD
            </h1>
        </div>
    </div>
    <div class="row">
        <div class="col-md-2 col-md-offset-10">
            <button class="btn btn-success">新增</button>
            <button class="btn btn-danger">删除</button>
        </div>
    </div>
    <%--表格数据--%>
    <div class="row">
        <div class="col-md-12">
        <table class="table table-hover">
            <tr>
                <th>编号</th>
                <th>名字</th>
                <th>性别</th>
                <th>邮箱</th>
                <th>部门</th>
                <th>操作</th>
            </tr>
            <c:forEach items="${INFO.list}" var="emp">
            <tr>
                <th>${emp.id}</th>
                <th>${emp.name}</th>
                <th>${emp.gender=="M"?"男":"女"}</th>
                <th>${emp.email}</th>
                <th>${emp.department.name}</th>
                <th>
                    <button class="btn btn-success btn-sm">
                        <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                        修改
                    </button>
                    <button class="btn btn-danger btn-sm">
                        <span class="glyphicon glyphicon-minus " aria-hidden="true"></span>
                        删除
                    </button>
                </th>
            </tr>
            </c:forEach>
        </table>
        </div>



    </div>
    <%--分页--%>
    <div class="row">
        <div class="col-md-7">
            <h3> 当前记录数：当前第${INFO.pageNum}页，总共${INFO.pages}页，共${INFO.total}条记录</h3>
        </div>
        <div class="col-md-5">
            <nav aria-label="Page navigation">
                <ul class="pagination">
                  <li><a href="${APP_PATH}/emps?pn=1">首页</a></li>
                    <c:if test="${!INFO.isFirstPage}">
                        <li>
                            <a href="${APP_PATH}/emps?pn=${na-1}" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                    </c:if>

                    <c:forEach items="${INFO.navigatepageNums}" var="na">
                        <c:if test="${na==INFO.pageNum}">
                            <li class="active"><a href="#">${na}</a></li>
                        </c:if>
                        <c:if test="${na!=INFO.pageNum}">
                            <li><a href="${APP_PATH}/emps?pn=${na}">${na}</a></li>
                        </c:if>


                    </c:forEach>
                    <c:if test="${!INFO.isLastPage}">
                    <li>
                        <a href="${APP_PATH}/emps?pn=${na+1}" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                    </c:if>
                    <li><a href="${APP_PATH}/emps?pn=${INFO.pages}">尾页</a></li>
                </ul>
            </nav>
        </div>

    </div>
</div>
</body>
</html>