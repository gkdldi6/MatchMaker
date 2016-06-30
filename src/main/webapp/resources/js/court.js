//socket.on('roomlist', function(rooms) {
//	var templateObj = $('#roomTemplate');
//	var target = $('#roomSpace');
//	
//	var template = Handlebars.compile(templateObj.html());
//	
//	var html = template(rooms);
//	$('.eachRoom').remove();
//	target.html(html);
//});

getGames();

function getGames() {
	$.getJSON('/courts/games', function(games) {
		var templateObj = $('#gameTemplate');
		var target = $('.timeline');
		
		var template = Handlebars.compile(templateObj.html());
		var html = template(games);
//		$('.eachRoom').remove();
		target.append(html);
	});
}

//
///* ajax로 받아온 댓글 목록들을 템플릿에 컴파일하는 함수 */
//var printData = function(replyArr, target, templateObject) {
//	var template = Handlebars.compile(templateObject.html());
//
//	var html = template(replyArr);
//	$(".each-reply").remove();
//	target.html(html);
//}
//
///* 댓글 목록 및 페이지 가져오기 */
//function getReply() {
//	// 		$.getJSON('/replies/' + ano + "/" + replyPage, function(data) {
//	$.getJSON('/replies/' + bno + "/" + ano + "/" + replyPage, function(
//			data) {
//		printData(data.list, $('#reply-list'), $('#template'));
//		$("#modifyModal").modal('hide');
//		printPaging(data.pageMaker);
//		//printPaging(dat.pageMaker, $(".pagination"));
//	});
//};