<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="../include/head.jsp"></jsp:include>
<style>
.container {
	padding-top: 50px;
}
</style>
</head>
<body>
	<jsp:include page="../include/nav.jsp"></jsp:include>

	<div class="container">

		<div class="row">
			<h1 class="text-center" style="color: #dd4814;">자유 게시판</h1>
		</div>
		<table class="table table-striped table-hover ">
			<thead>
				<tr class="danger">
					<th>글번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성 날짜</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>1</td>
					<td>Column content</td>
					<td>Column content</td>
					<td>Column content</td>
					<td><span class="badge">3</span></td>
				</tr>
				<tr>
					<td>2</td>
					<td>Column content</td>
					<td>Column content</td>
					<td>Column content</td>
					<td><span class="badge">3</span></td>
				</tr>
				<tr>
					<td>2</td>
					<td>Column content</td>
					<td>Column content</td>
					<td>Column content</td>
					<td><span class="badge">3</span></td>
				</tr>
				<tr>
					<td>2</td>
					<td>Column content</td>
					<td>Column content</td>
					<td>Column content</td>
					<td><span class="badge">3</span></td>
				</tr>
				<tr>
					<td>2</td>
					<td>Column content</td>
					<td>Column content</td>
					<td>Column content</td>
					<td><span class="badge">3</span></td>
				</tr>
				<tr>
					<td>2</td>
					<td>Column content</td>
					<td>Column content</td>
					<td>Column content</td>
					<td><span class="badge">3</span></td>
				</tr>
				<tr>
					<td>2</td>
					<td>Column content</td>
					<td>Column content</td>
					<td>Column content</td>
					<td><span class="badge">3</span></td>
				</tr>
				<tr>
					<td>2</td>
					<td>Column content</td>
					<td>Column content</td>
					<td>Column content</td>
					<td><span class="badge">3</span></td>
				</tr>
				<tr>
					<td>2</td>
					<td>Column content</td>
					<td>Column content</td>
					<td>Column content</td>
					<td><span class="badge">3</span></td>
				</tr>
				<tr>
					<td>2</td>
					<td>Column content</td>
					<td>Column content</td>
					<td>Column content</td>
					<td><span class="badge">3</span></td>
				</tr>
				<tr>
					<td>2</td>
					<td>Column content</td>
					<td>Column content</td>
					<td>Column content</td>
					<td><span class="badge">3</span></td>
				</tr>
			</tbody>
		</table>
		<div align="center">
			<ul class="pagination">
					<li class="disabled"><a href="#">&laquo;</a></li>
					<li class="active"><a href="#">1</a></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">4</a></li>
					<li><a href="#">5</a></li>
					<li><a href="#">6</a></li>
					<li><a href="#">7</a></li>
					<li><a href="#">8</a></li>
					<li><a href="#">9</a></li>
					<li><a href="#">10</a></li>
					<li><a href="#">&raquo;</a></li>
				</ul>
		</div>
		<div class="row">
			<div class="col-xs-3">
				<a href="#" class="btn btn-primary">글쓰기</a>
				<a href="#" class="btn btn-danger">Primary</a>
			</div>
			<div class="col-xs-3 col-xs-offset-6">
				<div class="form-group">
					<div class="input-group">
						<input type="text" class="form-control"> <span
							class="input-group-btn">
							<button class="btn btn-warning" type="button">검색</button>
						</span>
					</div>
				</div>
			</div>

		</div>

	</div>

	<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>