<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="include/head.jsp"></jsp:include>
<style type="text/css">
#jumbo1 {
	background-color: #40B2F0;
}

#jumbo2 {
	background-color: #2D7FAB;
	margin-top: 30px;
}

#jumbo3 {
	background-color: #3AA1D9;
	margin-top: 30px;
}

.placeholder {
	margin-top: 20px;
}
</style>
</head>
<body>
	<jsp:include page="include/nav.jsp"></jsp:include>

	<div id="jumbo1" class="jumbotron">
		<div class="container">
			<h1>Jumbotron</h1>
			<p>This is a simple hero unit, a simple jumbotron-style component
				for calling extra attention to featured content or information.</p>
			<p>
				<a class="btn btn-primary btn-lg">Learn more</a>
			</p>
		</div>
	</div>

	<div class="container">

		<div class="row">
			<div class="col-md-3 placeholder">
				<img data-src="holder.js/200x200/auto/vine" class="img-responsive"
					alt="200x200"
					src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiIHN0YW5kYWxvbmU9InllcyI/PjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgdmlld0JveD0iMCAwIDIwMCAyMDAiIHByZXNlcnZlQXNwZWN0UmF0aW89Im5vbmUiPjxkZWZzLz48cmVjdCB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgZmlsbD0iIzM5REJBQyIvPjxnPjx0ZXh0IHg9Ijc1LjUiIHk9IjEwMCIgc3R5bGU9ImZpbGw6IzFFMjkyQztmb250LXdlaWdodDpib2xkO2ZvbnQtZmFtaWx5OkFyaWFsLCBIZWx2ZXRpY2EsIE9wZW4gU2Fucywgc2Fucy1zZXJpZiwgbW9ub3NwYWNlO2ZvbnQtc2l6ZToxMHB0O2RvbWluYW50LWJhc2VsaW5lOmNlbnRyYWwiPjIwMHgyMDA8L3RleHQ+PC9nPjwvc3ZnPg=="
					data-holder-rendered="true">
			</div>
			<div class="col-md-6">
				<div class="page-header">
					<h1>Test</h1>
				</div>
				<h2>Example body text</h2>
				<p>
					Nullam quis risus eget <a href="#">urna mollis ornare</a> vel eu
					leo. Cum sociis natoque penatibus et magnis dis parturient montes,
					nascetur ridiculus mus. Nullam id dolor id nibh ultricies vehicula.
				</p>
			</div>
		</div>

		<div class="row">
			<div class="col-md-3 placeholder visible-sm-block visible-xs-block">
				<img data-src="holder.js/200x200/auto/sky" class="img-responsive"
					alt="200x200"
					src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiIHN0YW5kYWxvbmU9InllcyI/PjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgdmlld0JveD0iMCAwIDIwMCAyMDAiIHByZXNlcnZlQXNwZWN0UmF0aW89Im5vbmUiPjxkZWZzLz48cmVjdCB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgZmlsbD0iIzBEOEZEQiIvPjxnPjx0ZXh0IHg9Ijc1LjUiIHk9IjEwMCIgc3R5bGU9ImZpbGw6I0ZGRkZGRjtmb250LXdlaWdodDpib2xkO2ZvbnQtZmFtaWx5OkFyaWFsLCBIZWx2ZXRpY2EsIE9wZW4gU2Fucywgc2Fucy1zZXJpZiwgbW9ub3NwYWNlO2ZvbnQtc2l6ZToxMHB0O2RvbWluYW50LWJhc2VsaW5lOmNlbnRyYWwiPjIwMHgyMDA8L3RleHQ+PC9nPjwvc3ZnPg=="
					data-holder-rendered="true">
			</div>
			<div class="col-md-6">
				<div class="page-header">
					<h1>Test</h1>
				</div>
				<h2>Example body text</h2>
				<p>
					Nullam quis risus eget <a href="#">urna mollis ornare</a> vel eu
					leo. Cum sociis natoque penatibus et magnis dis parturient montes,
					nascetur ridiculus mus. Nullam id dolor id nibh ultricies vehicula.
				</p>
			</div>
			<div class="col-md-3 placeholder hidden-sm hidden-xs">
				<img data-src="holder.js/200x200/auto/sky" class="img-responsive"
					alt="200x200"
					src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiIHN0YW5kYWxvbmU9InllcyI/PjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgdmlld0JveD0iMCAwIDIwMCAyMDAiIHByZXNlcnZlQXNwZWN0UmF0aW89Im5vbmUiPjxkZWZzLz48cmVjdCB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgZmlsbD0iIzBEOEZEQiIvPjxnPjx0ZXh0IHg9Ijc1LjUiIHk9IjEwMCIgc3R5bGU9ImZpbGw6I0ZGRkZGRjtmb250LXdlaWdodDpib2xkO2ZvbnQtZmFtaWx5OkFyaWFsLCBIZWx2ZXRpY2EsIE9wZW4gU2Fucywgc2Fucy1zZXJpZiwgbW9ub3NwYWNlO2ZvbnQtc2l6ZToxMHB0O2RvbWluYW50LWJhc2VsaW5lOmNlbnRyYWwiPjIwMHgyMDA8L3RleHQ+PC9nPjwvc3ZnPg=="
					data-holder-rendered="true">
			</div>
		</div>

		<div class="row">
			<div class="col-md-3 placeholder">
				<img data-src="holder.js/200x200/auto/vine" class="img-responsive"
					alt="200x200"
					src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiIHN0YW5kYWxvbmU9InllcyI/PjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgdmlld0JveD0iMCAwIDIwMCAyMDAiIHByZXNlcnZlQXNwZWN0UmF0aW89Im5vbmUiPjxkZWZzLz48cmVjdCB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgZmlsbD0iIzM5REJBQyIvPjxnPjx0ZXh0IHg9Ijc1LjUiIHk9IjEwMCIgc3R5bGU9ImZpbGw6IzFFMjkyQztmb250LXdlaWdodDpib2xkO2ZvbnQtZmFtaWx5OkFyaWFsLCBIZWx2ZXRpY2EsIE9wZW4gU2Fucywgc2Fucy1zZXJpZiwgbW9ub3NwYWNlO2ZvbnQtc2l6ZToxMHB0O2RvbWluYW50LWJhc2VsaW5lOmNlbnRyYWwiPjIwMHgyMDA8L3RleHQ+PC9nPjwvc3ZnPg=="
					data-holder-rendered="true">
			</div>
			<div class="col-md-6">
				<div class="page-header">
					<h1>Test</h1>
				</div>
				<h2>Example body text</h2>
				<p>
					Nullam quis risus eget <a href="#">urna mollis ornare</a> vel eu
					leo. Cum sociis natoque penatibus et magnis dis parturient montes,
					nascetur ridiculus mus. Nullam id dolor id nibh ultricies vehicula.
				</p>
			</div>
		</div>

	</div>

	<div id="jumbo2" class="jumbotron">
		<div class="container">
			<h1>Jumbotron</h1>
			<p>This is a simple hero unit, a simple jumbotron-style component
				for calling extra attention to featured content or information.</p>
			<p>
				<a class="btn btn-primary btn-lg">Learn more</a>
			</p>
		</div>
	</div>

	<div class="container">

		<div class="row">
			<div class="col-md-4">
				<h2>Heading</h2>
				<p>Donec id elit non mi porta gravida at eget metus. Fusce
					dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh,
					ut fermentum massa justo sit amet risus. Etiam porta sem malesuada
					magna mollis euismod. Donec sed odio dui.</p>
				<p>
					<a class="btn btn-default" href="#" role="button">View details
						»</a>
				</p>
			</div>
			<div class="col-md-4">
				<h2>Heading</h2>
				<p>Donec id elit non mi porta gravida at eget metus. Fusce
					dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh,
					ut fermentum massa justo sit amet risus. Etiam porta sem malesuada
					magna mollis euismod. Donec sed odio dui.</p>
				<p>
					<a class="btn btn-default" href="#" role="button">View details
						»</a>
				</p>
			</div>
			<div class="col-md-4">
				<h2>Heading</h2>
				<p>Donec sed odio dui. Cras justo odio, dapibus ac facilisis in,
					egestas eget quam. Vestibulum id ligula porta felis euismod semper.
					Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum
					nibh, ut fermentum massa justo sit amet risus.</p>
				<p>
					<a class="btn btn-default" href="#" role="button">View details
						»</a>
				</p>
			</div>
		</div>

		<div class="row">
			<div class="col-md-4">
				<h2>Heading</h2>
				<p>Donec id elit non mi porta gravida at eget metus. Fusce
					dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh,
					ut fermentum massa justo sit amet risus. Etiam porta sem malesuada
					magna mollis euismod. Donec sed odio dui.</p>
				<p>
					<a class="btn btn-default" href="#" role="button">View details
						»</a>
				</p>
			</div>
			<div class="col-md-4">
				<h2>Heading</h2>
				<p>Donec id elit non mi porta gravida at eget metus. Fusce
					dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh,
					ut fermentum massa justo sit amet risus. Etiam porta sem malesuada
					magna mollis euismod. Donec sed odio dui.</p>
				<p>
					<a class="btn btn-default" href="#" role="button">View details
						»</a>
				</p>
			</div>
			<div class="col-md-4">
				<h2>Heading</h2>
				<p>Donec sed odio dui. Cras justo odio, dapibus ac facilisis in,
					egestas eget quam. Vestibulum id ligula porta felis euismod semper.
					Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum
					nibh, ut fermentum massa justo sit amet risus.</p>
				<p>
					<a class="btn btn-default" href="#" role="button">View details
						»</a>
				</p>
			</div>
		</div>

	</div>

	<div id="jumbo3" class="jumbotron">
		<div class="container">
			<h1>Jumbotron</h1>
			<p>This is a simple hero unit, a simple jumbotron-style component
				for calling extra attention to featured content or information.</p>
			<p>
				<a class="btn btn-primary btn-lg">Learn more</a>
			</p>
		</div>
	</div>

	<!-- 문의하기 -->
	<div class="container">
		<form class="form-horizontal">
			<fieldset>
				<legend>문의하기</legend>
				<div class="form-group">
					<label class="col-lg-2 control-label">이메일</label>
					<div class="col-lg-10">
						<input type="text" class="form-control"	placeholder="이메일 주소를 입력해주세요.">
					</div>
				</div>
				<div class="form-group">
					<label class="col-lg-2 control-label">작성자</label>
					<div class="col-lg-10">
						<input type="text" class="form-control"	placeholder="작성자를 입력해주세요.">
					</div>
				</div>
				<div class="form-group">
					<label for="textArea" class="col-lg-2 control-label">문의 내용</label>
					<div class="col-lg-10">
						<textarea class="form-control" rows="3" id="textArea"></textarea>
						<span class="help-block">문의할 내용을 입력해주세요.</span>
					</div>
				</div>
				<div class="form-group">
					<div class="col-lg-10 col-lg-offset-2">
						<button type="submit" class="btn btn-primary">전송</button>
						<button type="reset" class="btn btn-default">다시</button>
					</div>
				</div>
			</fieldset>
		</form>
	</div>

	<jsp:include page="include/footer.jsp"></jsp:include>
</body>
</html>
