<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<legend>선수 정보 입력</legend>

<div class="form-group">
	<label for="inputName" class="col-lg-2 control-label">선수 이름</label>
	<div class="col-lg-10">
		<input type="text" name="name" class="form-control" id="name"
			placeholder="선수 이름을 입력해주세요." required>
	</div>
</div>

<div class="form-group">
	<label for="inputAge" class="col-lg-2 control-label">나이</label>
	<div class="col-lg-10">
		<input type="number" name="age" class="form-control"
			id="age" placeholder="나이를 입력해주세요." required>
	</div>
</div>

<div class="form-group">
	<label for="inputSex" class="col-lg-2 control-label">성별</label>
	<div id="sex" class="col-lg-10">
		<input type="radio" name="sex" value="M" checked="checked"> 남자
		<input type="radio" name="sex" value="F"> 여자
	</div>
</div>

<div class="form-group">
	<label for="inputAge" class="col-lg-2 control-label">키</label>
	<div class="col-lg-10">
		<input type="number" name="height" class="form-control" id="height"
			placeholder="키를 입력해주세요." required>
	</div>
</div>

<div class="form-group">
	<label for="inputAge" class="col-lg-2 control-label">몸무게</label>
	<div class="col-lg-10">
		<input type="number" name="weight" class="form-control" id="weight"
			placeholder="몸무게를 입력해주세요." required>
	</div>
</div>

<div class="form-group">
	<label for="inputPosition" class="col-lg-2 control-label">포지션</label>
	<div class="col-lg-10">
		<select name="position" id="position">
			<option selected="selected" value="C">센터</option>
			<option value="PF">파워포워드</option>
			<option value="SF">스몰포워드</option>
			<option value="PG">포인트가드</option>
			<option value="SG">슈팅가드</option>
		</select>
	</div>
</div>

<div class="form-group">
	<label for="textArea" class="col-lg-2 control-label">선수 소개</label>
	<div class="col-lg-10">
		<textarea class="form-control" name="info" rows="3" id="info"
			placeholder="자신을 소개하세요." style="resize: none"></textarea>
	</div>
</div>