/*화면 크기에 맞게 사이드바 및 내용 크기 변경*/
$('.direct-chat-messages, #roomSpace').css('height', $(window).height() - 265);
$('.control-sidebar, .control-sidebar-bg').css('width', $(window).width());

$(window).resize(function() {
	$('.direct-chat-messages, #roomSpace').css('height', $(window).height() - 265);
	$('.control-sidebar, .control-sidebar-bg').css('width', $(window).width());
});

/* chatbar 조작 */
var chatbar = $('.chatbar');
var chatbtn = $('.chatbtn');

function chatbarOpen() {
	chatbar.css('left', '0px');
	chatbtn.css('left', '400px');
	chatbar.attr('state', 'opened');
};

function chatbarClose() {
	chatbar.css('left', '-400px');
	chatbtn.css('left', '0px');
	chatbar.attr('state', 'closed');
};

chatbtn.click(function() {
	if(chatbar.attr('state') === 'closed') {
		chatbarOpen();
	} else {
		chatbarClose();
	}
});

/* 사이드바 조작 */
function openSidebar(cno, addr, cname, ccontent) {
	return function() {
		if(sidebar.attr('state') === 'opened' && courtNo === cno) {
			closeSbar();
		} else {
			openSbar(cno, addr, cname, ccontent);
		}
	};
};

function openSbar(cno, addr, cname, ccontent) {
	$('.control-sidebar-bg, .control-sidebar').css('right', '0px');
	sidebar.attr('state', 'opened');
	
	
//	$('#cno').text(cno);
	$('#address').text(addr);
	$('#cname').text(cname);
	$('#ccontent').text(ccontent);
	$('#map').css('width', $(window).width() - 385);
	
	courtNo = cno;
	xsize = 385;
};

function closeSbar() {
	$('.control-sidebar-bg, .control-sidebar').css('right', '-400px');
	$('#map').css('width', $(window).width());
	sidebar.attr('state', 'closed');
	relayout();
	
	xsize = 0;
};