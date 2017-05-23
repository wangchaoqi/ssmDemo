<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>员工列表</title>
<%
	pageContext.setAttribute("APP_PATH",request.getContextPath());
%>

<!-- 
	以/开始的路径，是以服务器开始找资源的
 -->
<script type="text/javascript" src="${APP_PATH}/static/jquery.js"></script>
<link rel="stylesheet"
	href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css">
<script
	src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

</head>
<body>
	<!-- 列表 -->
	<div class="container">
		<!-- 标题 -->
		<div class="row">
			<div class="col-md-12">
				<h1>SSM-CRUD</h1>
			</div>
		</div>
		<div class="row">
			<div class="col-md-4 col-md-offset-8">
				<button class="btn btn-primary" id="addNewEmp">新增</button>
				<button class="btn btn-danger">删除</button>
			</div>
		</div>
		<div class="row">
			<div col-md-12>
				<table class="table table-hover" id="emp_table">
					<thead>
						<tr>
							<th>ID</th>
							<th>NAME</th>
							<th>SEX</th>
							<th>MAIL</th>
							<th>DEPT</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
			</div>
		</div>
		<div class="row">
			<!-- 分页信息 -->
			<div class="col-md-6" id="page_info"></div>
			<!-- 导航条 -->
			<div class="col-md-6" id="page_nav"></div>
		</div>
	</div>

	<!-- Modal 员工添加弹出框-->
	<div class="modal fade" id="empModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">Modal title</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">
						<div class="form-group">
							<label class="col-sm-2 control-label">NAME</label>
							<div class="col-sm-10">
								<input type="text" name="empNmae" class="form-control" id="enm_name">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">SEX</label>
							<div class="col-sm-10">
								<label class="radio-inline"> <input type="radio"
									name="empSex" id="is_M" value="M" checked="checked"> 男
								</label> <label class="radio-inline"> <input type="radio"
									name="empSex" id="is_W" value="W"> 女
								</label>
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">EMAIL</label>
							<div class="col-sm-10">
								<input type="email" name="email" class="form-control" id="emp_email"
									placeholder="Email@qq.com">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">DEPT</label>
							<div class="col-sm-4">
								<select id="select_dept" class="form-control" name="dId"></select>
							</div>
						</div>

						<!--  <div class="form-group">
				    <div class="col-sm-offset-2 col-sm-10">
				      <div class="checkbox">
				        <label>
				          <input type="checkbox"> Remember me
				        </label>
				      </div>
				    </div>
				  </div> -->
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								<button type="submit" class="btn btn-default">Sign in</button>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary">添加</button>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(function(){
			//去首页
			toPage(1);
		})
		
		//创建表格
		function buildEmpTable(result){
			//清空表格
			$("#emp_table tbody").empty();
			var emps = result.extend.pageInfo.list;
			$.each(emps,function(index,item){
				var enpId = $("<td></td>").append(item.empId);
				var enpNmae = $("<td></td>").append(item.empName);
				var empSex = $("<td></td>").append(item.empSex = 'm'?"男":"女");
				var email = $("<td></td>").append(item.email);
				var deptName = $("<td></td>").append(item.department.deptName);
				var editButton = $("<button></button>").addClass("btn btn-primary btn-sm")
				.append("<span></span>").addClass("glyphicon glyphicon-pencal").append("编辑");
				
				var deleteButton= $("<button></button>").addClass("btn btn-danger btn-sm")
				.append("<span></span>").addClass("glyphicon glyphicon-trash").append("删除");
				
				var btn = $("<td></td>").append(editButton).append(" ").append(deleteButton);
				//append执行完成后会返回原来的元素"$("<tr></tr>")"
				$("<tr></tr>").append(enpId)
				.append(enpNmae).
				append(empSex)
				.append(email)
				.append(deptName)
				.append(btn)
				.appendTo("#emp_table tbody");
				
			})
		}
		
		function buildPageInfo(result){
			//清空信息
			$("#page_info").empty();
			$("#page_info").append("当前第"+result.extend.pageInfo.pageNum+"页"
					+", "+"总"+result.extend.pageInfo.pages+"页, "
					+"总记录数"+result.extend.pageInfo.total);
		}
	
		function buildPageNav(result){
			$("#page_nav").empty();
			var ul = $("<ul></ul>").addClass("pagination");
			
			var firstPageli = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
			var prePageli = $("<li></li>").append($("<a></a>").append("&laquo;"));
			if(result.extend.pageInfo.hasPreviousPage == false){
				firstPageli.addClass("disabled");
				prePageli.addClass("disabled");
			}else{
				firstPageli.click(function(){
					toPage(1);//返回首页
				})
				prePageli.click(function(){
					toPage(result.extend.pageInfo.pageNum - 1)
				})
			}
			
			
			var raPageli = $("<li></li>").append($("<a></a>").append("&raquo;"));
			var lastPageli = $("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
			if(result.extend.pageInfo.hasNextPage == false){
				raPageli.addClass("disabled");
				lastPageli.addClass("disabled");
			}else{
				lastPageli.click(function(){
					toPage(result.extend.pageInfo.pages);//返回首页
				})
				raPageli.click(function(){
					toPage(result.extend.pageInfo.pageNum + 1)
				})
			}
			
			
			ul.append(firstPageli).append(prePageli);
			
			$.each(result.extend.pageInfo.navigatepageNums,function(index,item){
				var numli = $("<li></li>").append($("<a></a>").append(item).attr("href","#"));
				if(result.extend.pageInfo.pageNum == item){
					 numli.addClass("active");
				}
				numli.click(function(){
					toPage(item);
				});
				ul.append(numli);
			})
			ul.append(raPageli).append(lastPageli);
			var navElm = $("<nav></nav>").append(ul);
			navElm.appendTo("#page_nav");
			
		}
		
		//负责页面跳转的公共方法
		function toPage(pn){
			$.ajax({
				url:"${APP_PATH}/emps",
				data:"pageNumber="+pn,
				type:"GET",
				success:function(result){
					console.log(result);
					//构建表格
					buildEmpTable(result);
					//构建分页信息
					buildPageInfo(result);
					//构建分页导航条
					buildPageNav(result);
				}
			})
		}
		
		//弹出框
		$("#addNewEmp").click(function(){
			//开启弹出框时查询部门名称，显示在下拉列表中
			getDeptNameToSelect();
			
			$("#empModal").modal({
				backdrop:true
			})
		})
		
		function getDeptNameToSelect(){
			
			$.ajax({
				url:"${APP_PATH}/depts",
				type:"GET",
				success:function(result){
					console.log(result);
					$("#select_dept").empty();
					$.each(result.extend.depts,function(index,item){
						/* var option = $("<option></option>").append(this.deptName).attr("value",this.deptId);
						option.appendTo("#empModal select"); */
						$("#select_dept").append($("<option></option>").append(this.deptName).attr("value",this.deptId));
					})
					
				}
			})
		}
	</script>
</body>
</html>

</body>
</html>