/*전송 버튼*/
var send = $('#send');
/*대화가 로딩되는 공간*/
var msgbox = $('#msgbox');
/*메시지 입력 input*/
var message = $('#message');

/*socket.io 서버에 접속*/
var socket = io('http://192.168.0.114:3000');
  
/*스크롤 자동으로 내리기*/
function scrollAuto() {
	msgbox.scrollTop(msgbox[0].scrollHeight);
};

/*접속시 받는 메시지*/
socket.on('welcome', function(msg) {
	msgbox.append(msg + '<br>');
	scrollAuto();
});

/*종료시 받는 메시지*/
socket.on('goodbye', function(msg) {
	msgbox.append(msg + '<br>');
	scrollAuto();
})

/*메시지 전송*/
function sendMsg() {
	var msg = message.val();
	socket.emit('message', msg);
	message.val('');
};
/*1. 전송 버튼을 누를때*/
send.click(function() {
	sendMsg();
});
/*2. 엔터를 누를때*/
message.keypress(function(event) {
	if(event.keyCode === 13) {
		sendMsg();
	}
});

/*메시지 수신*/
socket.on('message', function(msg) {
	msgbox.append(msg + '<br>');
	scrollAuto();
});

/*방 만들고 접속하기*/


/*방 나가기*/


/*방 목록보기*/


/*방 예약하기*/


/*접속 인원 보기*/


/*귓속말하기*/








