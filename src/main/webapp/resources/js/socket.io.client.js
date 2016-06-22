var send = $('#send');							/*전송 버튼*/
var msgbox = $('.direct-chat-messages');		/*대화가 로딩되는 공간*/
var message = $('#message');					/*메시지 입력 input*/
var userbox = $('#waitUserlist');				/*대기실 회원 목록*/
var roombox = $('#roomUserlist');				/*방 회원 목록*/
var home = $('.home');							/*홈팀*/
var away = $('.away');							/*어웨이팀*/
var room;												


/*id, name은	map.jsp 윗부분에 세션에서 받음*/

/*socket.io 서버에 접속*/
/*학원*/
//var socket = io('http://192.168.0.114:3000');
/*집*/
var socket = io('http://localhost:3000');
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

/*알림*/
socket.on('alert', function(msg) {
	alert(msg);
});

/*접속 인원 보기*/
socket.on('userlist', function(userlist) {
	if(userlist[0].roomno === 'waitroom') {
		roombox.hide();
		userbox.show();
		
		userbox.html('');
		for(i in userlist) {
			userbox.append('<div uid="' + userlist[i].uid + '">' + userlist[i].name + '(' + userlist[i].uid + ')</div>');
		};
		return;
	}
	
	userbox.hide();
	roombox.show();
	
	home.html('');
	away.html('');
	
	for(i in userlist) {
		if(userlist[i].team === 'home') {
			home.append('<div uid="' + userlist[i].uid + '">' + userlist[i].name + '(' + userlist[i].uid + ')</div>');
		} else if(userlist[i].team === 'away') {
			away.append('<div uid="' + userlist[i].uid + '">' + userlist[i].name + '(' + userlist[i].uid + ')</div>');
		} else {
			console.log('아무것도 아님');
		}
	}
});

/*방 만들기 */
$('#create').click(function() {
	var begintime = new Date($('#begintime').val());
	var endtime = new Date($('#begintime').val());
	endtime.setMinutes($('#endtime').val());
	endtime.setMinutes(begintime.getMinutes() + endtime.getMinutes())
	
	room = {
		rname: $('#rname').val(),
		usercnt: $('#usercnt').val(),
		userid: id,
		begintime: begintime,
		endtime:  endtime,
		cno: $('#cno').val()
	};
	
	socket.emit('create', room);
	$('#createRoom').modal('hide');
});

/*방 접속하는 인원 정보 받기*/
socket.on('enterroom', function(user) {
	if(user.roomno === 'waitroom') {
		userbox.append('<div uid="' + user.uid + '">' + user.name + '(' + user.uid + ')</div>');
		return;
	}
	
	if(user.team === 'home') {
		home.append('<div uid="' + user.uid + '">' + user.name + '(' + user.uid + ')</div>');
	} else {
		away.append('<div uid="' + user.uid + '">' + user.name + '(' + user.uid + ')</div>');
	}
});

/*방 나가는 인원 정보 받기*/
socket.on('exitroom', function(user) {
	if(user.roomno !== 'waitroom') {
		userbox.find('div').each(function() {
			var userid = $(this).attr('uid');
			if(userid === user.uid) {
				$(this).remove();
				return;
			};
		});
	}
	
	var position;
	
	if(user.team === 'home') {
		position = home;
	} else {
		position = away;
	}
	
	position.find('div').each(function() {
		var userid = $(this).attr('uid');
		if(userid === user.uid) {
			$(this).remove();
			return;
		};
	});
});

/*방 접속 클릭*/
$('#roomSpace').on('click', '#join', function() {
	var eachRoom = $(this).parents('.eachRoom');
	var roomno = eachRoom.find('.roomno').text();
	socket.emit('join', {id: id, rno: roomno});
});

/*방 접속 이벤트*/
socket.on('join', function(msg) {
	room = msg;
	$('#room-name').text(msg.rname);
	$('a[href="#tab_2"]').parent('li').removeClass('active');
	$('a[href="#tab_1"]').parent('li').addClass('active');
	$('#tab_2').removeClass('active');
	$('#tab_1').addClass('active');
	$('#exit-btn-group').show();
	scrollAuto();
});

/*방 나가기 클릭*/
$('#exit').click(function() {
	socket.emit('exit', room, id);
});

/*방 나가기 이벤트*/
socket.on('exit', function(msg) {
	$('#room-name').text('대기실');
	$('a[href="#tab_1"]').parent('li').removeClass('active');
	$('a[href="#tab_2"]').parent('li').addClass('active');
	$('#tab_1').removeClass('active');
	$('#tab_2').addClass('active');
	$('#exit-btn-group').hide();
	$('#reser-btn-group').hide();
	scrollAuto();
});

/*방 정보 자세히 보기*/
$('#roomSpace').on('click', 'button[data-widget="collapse"]', function() {
	var state = $(this).parents('.eachRoom').hasClass('collapsed-box');
	var roomno = $(this).parents('.eachRoom').find('.roomno').text();
	
	if(state) {
		socket.emit('detail', roomno);
	}
});

socket.on('detail', function(msg) {
	$('.roomno').each(function() {
		var roomno = $(this).text();(output);
			
		if(roomno == msg.roomno) {
			$(this).parents('.eachRoom').find('.ruserscnt').text(msg.ruserscnt);
			
			var output = '' + msg.rusers[0].name;
			for(var i = 1; i < msg.rusers.length; i++) {
				output += ', ' + msg.rusers[i].name;
			}
			$(this).parents('.eachRoom').find('.rusers').text(output);
			return;
		}
	});
});

/*생성된 방 목록에 추가*/
socket.on('createRoom', function(room) {
	var templateObj = $('#roomTemplate');
	var target = $('#roomSpace');
	
	var template = Handlebars.compile(templateObj.html());
	
	var html = template(room);
	target.prepend(html);
});

/*사라진 방 목록에서 제거*/
socket.on('deleteRoom', function(room) {
	$('.roomno').each(function() {
		var roomno = $(this).text();
		if(roomno == room.roomno) {
			$(this).parents('.eachRoom').remove();
			return;
		}
	});
});

/*방 목록보기*/
socket.on('roomlist', function(rooms) {
	var templateObj = $('#roomTemplate');
	var target = $('#roomSpace');
	
	var template = Handlebars.compile(templateObj.html());
	
	var html = template(rooms);
	$('.eachRoom').remove();
	target.html(html);
});

/*팀 바꾸기*/
$('#teamChange').click(function() {
	socket.emit('teamChange', id);
});

socket.on('teamChange', function(user) {
	var position;
	
	if(user.team !== 'home') {
		position = home;
	} else {
		position = away;
	}
	
	position.find('div').each(function() {
		var userid = $(this).attr('uid');
		if(userid === user.uid) {
			$(this).remove();
			return;
		};
	});
	
	if(user.team === 'home') {
		position = home;
	} else {
		position = away;
	}
	
	position.append('<div uid="' + user.uid + '">' + user.name + '(' + user.uid + ')</div>');
});

/*방 예약 버튼 생성*/
socket.on('leader', function() {
	$('#reser-btn-group').show();
});

/*예약 버튼 누르기*/
$('#reserve').click(function() {
	socket.emit('reserve', room.roomno);
});

socket.on('reserve', function() {
	socket.emit('exit', room, id);
	
	alert('예약에 성공했습니다.');
});


