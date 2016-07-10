/*화면 크기에 맞게 사이드바 및 내용 크기 변경*/
$('.direct-chat-messages, #roomSpace').css('height', $(window).height() - 265);
$('.control-sidebar, .control-sidebar-bg').css('width', $(window).width());

$(window).resize(function() {
	$('.direct-chat-messages, #roomSpace').css('height', $(window).height() - 265);
	$('.control-sidebar, .control-sidebar-bg').css('width', $(window).width());
});

/* chatbar 조작 */
/*var chatbar = $('.chatbar');*/
var sidebtn = $('.chatbtn');

/*function chatbarOpen() {
	chatbar.css('left', '0px');
	chatbtn.css('left', '400px');
	chatbar.attr('state', 'opened');
};*/

/*function chatbarClose() {
	chatbar.css('left', '-400px');
	chatbtn.css('left', '0px');
	chatbar.attr('state', 'closed');
};*/

// 사이드바 버튼 클릭
sidebtn.click(function() {
	if($('#sidebar').attr('state') === 'closed') {
		openSbar();
	} else {
		closeSbar();
	}
});

/* 사이드바 조작 */
function openSidebar(cno) {
	return function() {
		console.log(cno);
		openSbar();
		getCourt(cno);
	};
};

function openSbar() {
	$('.control-sidebar-bg, .control-sidebar').css('right', '0px');
	sidebar.attr('state', 'opened');
	sidebtn.css('right', '400px');
	$('#map').css('width', $(window).width() - 385);
	relayout();
	courtNo = cno;
	xsize = 385;
};

function closeSbar() {
	$('.control-sidebar-bg, .control-sidebar').css('right', '-400px');
	$('#map').css('width', $(window).width());
	sidebar.attr('state', 'closed');
	sidebtn.css('right', '0px');
	relayout();
	
	xsize = 0;
};