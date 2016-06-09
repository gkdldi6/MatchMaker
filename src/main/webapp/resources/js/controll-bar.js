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
function openSidebar(cno, addr) {
	return function() {
		if(sidebar.attr('state') === 'opened' && courtNo === cno) {
			closeSbar();
		} else {
			openSbar(cno, addr);
		}
	};
};

function openSbar(cno, addr) {
	$('.control-sidebar-bg, .control-sidebar').css('right', '0px');
	sidebar.attr('state', 'opened');
	
	$('#cno').text(cno);
	$('#address').text(addr);
	
	courtNo = cno;
};

function closeSbar() {
	$('.control-sidebar-bg, .control-sidebar').css('right', '-400px');
	sidebar.attr('state', 'closed');
};