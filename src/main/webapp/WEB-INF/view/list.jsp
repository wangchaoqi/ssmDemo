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
				<button class="btn btn-primary">新增</button>
				<button class="btn btn-danger">删除</button>
			</div>
		</div>
		<div class="row">
			<div col-md-12>
				<table class="table table-hover">
					<tr>
						<th>ID</th>
						<th>NAME</th>
						<th>MAIL</th>
						<th>SEX</th>
						<th>DEPT</th>
						<th>
							<button class="btn btn-primary">编辑</button>

							<button class="btn btn-danger">删除</button>
						</th>
					</tr>
					<c:forEach items="${pageInfo.list }" var="emp">
						<tr>
							<th>${emp.empId }</th>
							<th>${emp.empName }</th>
							<th>${emp.empSex=="m"?"男":"女" }</th>
							<th>${emp.email }</th>
							<th>${emp.department.deptName }</th>
							<th>
								<button class="btn btn-primary">编辑</button>

								<button class="btn btn-danger">删除</button>
							</th>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
		<div class="row">
			<div class="col-md-6">当前${pageInfo.pageNum}页，总${pageInfo.pages }页，总${pageInfo.total }条记录
			</div>
			<div class="col-md-6">
				<nav aria-label="Page navigation">
				<ul class="pagination">
				<c:if test="${pageInfo.pageNum == 1}">
					<li class="disabled"><a href="#" aria-label="Previous"> <span
							aria-hidden="true">首页</span>
					</a></li>
					</c:if>
						<c:if test="${pageInfo.pageNum != 1}">
					<li><a href="${APP_PATH }/emps?pageNumber=1" aria-label="Previous"> <span
							aria-hidden="true">首页</span>
					</a></li>
					</c:if>
					<c:forEach items="${pageInfo.navigatepageNums }" var="page_Nums">
						<c:if test="${pageInfo.pageNum == page_Nums}">
							<li class="active"><a href="#">${page_Nums }</a></li>
						</c:if>
						<c:if test="${pageInfo.pageNum != page_Nums}">
							<li><a href="${APP_PATH }/emps?pageNumber=${page_Nums}">${page_Nums }</a></li>
						</c:if>
					</c:forEach>
					<c:if test="${pageInfo.pageNum == pageInfo.pages}">
					<li class="disabled"><a href="#" aria-label="Next"> <span
							aria-hidden="true">末页</span>
					</a></li>
					</c:if>
					<c:if test="${pageInfo.pageNum != pageInfo.pages}">
					<li><a href="${APP_PATH }/emps?pageNumber=${pageInfo.pages}" aria-label="Next"> <span
							aria-hidden="true">末页</span>
					</a></li>
					</c:if>
				</ul>
				</nav>
			</div>
		</div>
	</div>
</body>
</html>