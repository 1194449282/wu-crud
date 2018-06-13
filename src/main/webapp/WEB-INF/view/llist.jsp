<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html
PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN""http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
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
<!-- Modal -->
<div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">员工修改</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">员工姓名</label>
                        <div class="col-sm-10">
                            <p class="form-control-static" id="updatename"></p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">邮箱</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control" id="updateemail" placeholder="请输入员工邮箱">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="updategender1" value="M" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="updategender2" value="G"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">部门</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="dId">
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="updatesave">保存</button>
            </div>
        </div>
    </div>
</div>
<!-- Modal -->
<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">员工添加</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">员工姓名</label>
                        <div class="col-sm-10">
                            <input type="text" name="name" class="form-control" id="empname" placeholder="请输入员工姓名">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">邮箱</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control" id="empemail" placeholder="请输入员工邮箱">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="empgender1" value="M" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="empgender2" value="G"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">部门</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="dId">
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="empsave">保存</button>
            </div>
        </div>
    </div>
</div>
<%--以上是模态框--%>
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
            <button class="btn btn-success" id="addbut">新增</button>
            <button class="btn btn-danger" id="delt">删除</button>
        </div>
    </div>
    <%--表格数据--%>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover" id="tables">
                <thead>
                <tr>
                    <th>
                        <input id="checkall" type="checkbox"/>
                    </th>
                    <th>编号</th>
                    <th>名字</th>
                    <th>性别</th>
                    <th>邮箱</th>
                    <th>部门</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>

    </div>
    <%--分页--%>
    <div class="row">
        <div class="col-md-7" id="pageinfo">
            <h4></h4>
        </div>
        <div class="col-md-5" id="pagenav">
            <nav aria-label="Page navigation">
            </nav>
        </div>

    </div>
</div>
<script type="text/javascript">
    var quanju,currentpage;
    $(function () {
        to_page(2);
    });

    function to_page(pn) {
        $.ajax({
            url: "${APP_PATH}/emps",
            data: "pn=" + pn,
            type: "GET",
            success: function (result) {
//                console.log(result);
                build_page_nav(result);
                build_emps_table(result);
                build_page_info(result);
            }
        });
    }

    function build_page_info(result) {
        $("#pageinfo h4 ").empty();
        $("#pageinfo h4 ").append("现在是第" + result.map.INFO.pageNum + "页，总共" + result.map.INFO.pages + "页，共" + result.map.INFO.total + "个数据");
        currentpage = result.map.INFO.pageNum
    }

    function build_emps_table(result) {
        $("#tables tbody").empty();
        var emps = result.map.INFO.list;
        $.each(emps, function (index, item) {
            var empcheck = $("<td><input type='checkbox' class='checkitem'/></td   >");
            var empIdTd = $("<td></td>").append(item.id);
            var empNameTd = $("<td></td>").append(item.name);
            var genderTd = $("<td></td>").append(item.gender == 'M' ? "男" : "女");
            var emailTd = $("<td></td>").append(item.email);
            var deptNameTd = $("<td></td>").append(item.department.name);
            var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm editbut")
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil ")).append("编辑");
//            给修改按钮添加class属性为当前的id
            editBtn.attr("find",item.id);
            var delBtn = $("<button></button>").addClass("btn btn-danger btn-sm deletebtn")
                .append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
            delBtn.attr("find",item.id);
            var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
            $("<tr></tr>").append(empcheck)
                .append(empIdTd)
                .append(empNameTd)
                .append(genderTd)
                .append(emailTd)
                .append(deptNameTd)
                .append(btnTd)
                .appendTo("#tables tbody");

        })
    }

    function build_page_nav(result) {
        quanju = result.map.INFO.total;
        $("#pagenav nav").empty();

        var ul = $("<ul></ul>").addClass("pagination");
        var firstpage = $("<li></li>").append($("<a></a>").append("首页").attr("href", "#"));
        var prepage = $("<li></li>").append($("<a></a>").append("&laquo;"));
        if (result.map.INFO.isFirstPage == true) {
            prepage.addClass("disabled");
            firstpage.addClass("disabled");
        } else {
            firstpage.click(function () {
                to_page(1);
            });
            prepage.click(function () {
                to_page(result.map.INFO.pageNum - 1);
            });
        }

        var nextpage = $("<li></li>").append($("<a></a>").append("&raquo;"));
        var lastpage = $("<li></li>").append($("<a></a>").append("尾页").attr("href", "#"));
        if (result.map.INFO.isLastPage == true) {
            nextpage.addClass("disabled");
            lastpage.addClass("disabled");
        } else {
            nextpage.click(function () {
                to_page(result.map.INFO.pageNum + 1);
            });
            lastpage.click(function () {
                to_page(result.map.INFO.pages);
            });
        }

        ul.append(firstpage).append(prepage);
        $.each(result.map.INFO.navigatepageNums, function (index, item) {
            var num = $("<li></li>").append($("<a></a>").append(item));
            if (result.map.INFO.pageNum == item) {
                num.addClass("active");
            }
            ul.append(num);
            num.click(function () {
                to_page(item);
            });
        });
        ul.append(nextpage).append(lastpage);
        ul.appendTo("#pagenav nav");
    }

    // 模态框 给按钮设置点击事件  模态框.modal 打开模态框
    $("#addbut").click(function () {
        $("#addModal form")[0].reset();
        show_msg("#empname", "flush", "")
        show_msg("#empemail", "flush", "")
        getdeps("#addModal select");
        $("#addModal").modal({
            backdrop: "static"
        });
    });

    function getdeps(e) {
        $(e).empty();
        $.ajax({
            url: "${APP_PATH}/deps",
            type: "GET",
            success: function (result) {
//                   console.log(result);

                $.each(result.map.deps, function () {

                    var opt = $("<option></option>").append(this.name).attr("value", this.id);
                    opt.appendTo(e);
                });
            }
        });
    }

    function validate() {
        /* var name = $("#empname").val();
         var regName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
         if(!regName.test(name)) {
//                alert("用户名可以是2-5位中文或者6-16位英文和数字的组合");
             show_msg("#empname","e","用户名可以是2-5位中文或者6-16位英文和数字的组合")

             return false
         }else {
             show_msg("#empname","success","正确ojbk")

         }*/
//                show_validate_msg("#empName_add_input", "error", "用户名可以是2-5位中文或者6-16位英文和数字的组合");
        var email = $("#empemail").val();
        var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        if (!regEmail.test(email)) {
//                    alert("邮箱格式不正确");
            show_msg("#empemail", "1", "邮箱格式不正确")

            return false
        } else {
            show_msg("#empemail", "success", "正确ojbk")

        }
        return true
    }

    $("#empsave").click(function () {
        //前端校验 如果一个为flase就不能向下执行
        if (!validate()) {
            return false;
        }
        //后端用户名是否重复
        if ($(this).attr("aja") == "f") {
            return false
        }
        $.ajax({
            url: "${APP_PATH}/save",
            type: "POST",
            data: $("#addModal form").serialize(),
            success: function (result) {
                if (result.code == 100) {
                    $("#addModal").modal('hide');
//                   $("#empname").val("")

//                   $("#empemail").val("")
                    to_page(quanju)
                } else {
                    if (undefined != result.map.error.name) {
                        show_msg("#empname", "1", result.map.error.name)
                    } else {
                        show_msg("#empemail", "1", result.map.error.email)
                    }

                }


            }
        })

    })

    function show_msg(ele, status, msg) {
        $(ele).parent().removeClass("has-error has-success")
        $(ele).next("span").text("")
        if (status == "success") {
            $(ele).parent().addClass("has-success");
            $(ele).next("span").text(msg)
        } else if (status == "flush") {
//               alert(ele+"刷新完毕")
        } else {
            $(ele).parent().addClass("has-error");
            $(ele).next("span").text(msg)
        }
    }

    $("#empname").change(function () {
        var value = $(this).val();
        $.ajax({
            url: "${APP_PATH}/check",
            type: "POST",
            data: "empname=" + value,
            success: function (result) {
                if (result.code == 100) {
                    show_msg("#empname", "success", "用户名可用")
                    $("#empsave").attr("aja", "t")
                } else {
                    show_msg("#empname", "1", result.map.va_msg)
                    $("#empsave").attr("aja", "f")
                }
            }
        })
    })
//    修改按钮逻辑
    $("#tables").on("click", ".editbut", function () {
        getdeps("#updateModal select");
        $("#updateModal").modal({
            backdrop: "static"
        });
//        找到当前id
        getup($(this).attr("find"));
//        保存按钮给个id
        $("#updatesave").attr("find",$(this).attr("find"))
    });

    function getup(id) {
        $.ajax({
            url: "${APP_PATH}/getup/"+id,
            type: "GET",
            success: function (result) {
//                console.log(result)
                var date= result.map.up;
                $("#updatename").text(date.name)
                $("#updateemail").val(date.email)
                $("#updateModal input[name=gender]").val([date.gender])
                $("#updateModal select").val([date.dId])
            }
        });
    }

    $("#updatesave").click(function () {
        var email = $("#updateemail").val();
        var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        if (!regEmail.test(email)) {
//                    alert("邮箱格式不正确");
            show_msg("#updateemail", "1", "邮箱格式不正确")
            return false
        } else {
            show_msg("#updateemail", "success", "正确ojbk")
        }
        $.ajax({
            url: "${APP_PATH}/getup/"+$(this).attr("find"),
            type: "PUT",
            data: $("#updateModal form").serialize(),
            success: function (result) {
//                alert(result)
                $("#updateModal").modal('hide');
            to_page(currentpage)
            }

        })
    });
    $("#tables").on("click", ".deletebtn", function () {
      var ename = $(this).parents("tr").find("td:eq(2)").text();
      if(confirm("要删除【"+ename+"】吗？")) {
            $.ajax({
                url: "${APP_PATH}/getup/"+$(this).attr("find"),
                type: "DELETE",
                data: $("#updateModal form").serialize(),
                success: function (result) {
                 alert(result.msg);
                 to_page(currentpage)
                }
            })
      }
    });
//    全选/全不选
    $("#checkall").click(function () {
        $(".checkitem").prop("checked",$("#checkall").prop("checked"))
    })
    $(document).on("click", ".checkitem", function () {
        var shi= $(".checkitem:checked").length==$(".checkitem").length
        $("#checkall").prop("checked",shi)
    });
    $("#delt").click(function () {
        var str =""
        var ids = ""
        $.each($(".checkitem:checked"),function () {
        str +=  $(this).parents("tr").find("td:eq(2)").text()+","
            ids += $(this).parents("tr").find("td:eq(1)").text()+"-"

        })
        str = str.substring(0,str.length-1);
        ids = ids.substring(0,str.length-1);
        if(str==""){
            alert("请选择删除对象")
            return false
        }
        if(confirm("要删除【"+str+"】吗？")) {
            $.ajax({
                url:"${APP_PATH}/getup/"+ids,
                type:"DELETE",
                success:function (result) {
                    alert(result.msg
                    )
                    to_page(currentpage)
                }
            })

        }
    });
</script>
</body>
</html>