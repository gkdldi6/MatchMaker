var send = $('#send');							/*전송 버튼*/
var msgbox = $('.direct-chat-messages');		/*대화가 로딩되는 공간*/
var message = $('#message');					/*메시지 입력 input*/
var userbox = $('.direct-chat-contacts');		/*회원 목록 공간*/
/*id, name은	map.jsp 윗부분에 세션에서 받음*/

/*socket.io 서버에 접속*/
/*학원*/
var socket = io('http://192.168.0.114:3000');
/*집*/
//var socket = io('http://192.168.219.188:3000');
socket.emit('enter', {uid: id, name: name});

/*스크롤 자동으로 내리기*/
function scrollAuto(isOn) {
	msgbox.scrollTop(msgbox[0].scrollHeight);
};

/*@$아이디$@로 귓속말*/
function sendPrivateMsg() {
	var msg = message.val();
	
	var start = msg.indexOf('@$') + 2;
	var end = msg.indexOf('$@');
	
	if(start !== -1 && end !== -1) {
		if(start < end) {
			var privateMsg = msg.substring(end + 2, msg.length);
			var targetId = msg.substring(start, end);
			socket.emit('private', {id: id, target: targetId, msg: privateMsg});
			var replMsg = msg.replace(privateMsg, '');
			message.val(replMsg);
			return;
		};
	};
	socket.emit('message', {id: id, msg: msg});
	message.val('');
};

	/*1. 전송 버튼을 누를때*/
send.click(function() {
	sendPrivateMsg();
	
});
	/*2. 엔터를 누를때*/
message.keypress(function(event) {
	if(event.keyCode === 13) {
		sendPrivateMsg();
	}
});

/*메시지 수신*/
socket.on('message', function(msg) {
	msgbox.append(msg + '<br>');
	scrollAuto();
});

/*접속 인원 보기*/

socket.on('userlist', function(userlist) {
	userbox.html('');
	for(i in userlist) {
		userbox.append('아이디: ' + userlist[i].uid + '	이름: ' + userlist[i].name 
				+ '    방: ' + userlist[i].roomno +	'<br>');
	};
});

/*방 만들기 */
$('#create').click(function() {
	var room = {
		rname: $('#rname').val(),
		usercnt: $('#usercnt').val(),
		userid: id
	};
	socket.emit('create', room);
	$('#createRoom').modal('hide');
});

/*방 접속하기*/
$('#roomSpace').on('click', '#join', function() {
	var eachRoom = $(this).parents('.eachRoom');
	var roomno = eachRoom.find('.roomno').text();
	socket.emit('join', {id: id, rno: roomno});
});

/*방 나가기*/


/*방 목록보기*/
socket.on('roomlist', function(rooms) {
	var templateObj = $('#roomTemplate');
	var target = $('#roomSpace');
	
	var template = Handlebars.compile(templateObj.html());
	
	var html = template(rooms);
	$('.eachRoom').remove();
	target.html(html);
});

/*방 예약하기*/


/*테스트*/
socket.on('alert', function(msg) {
	alert(msg);
});
