-- 쪽지 테이블 추가 --

-- 스키마 생성
create database matchmaker;
use matchmaker;

select * from freeboard;
select * from freereply;

-- 유저 테이블
create table user (
	userid varchar(50) not null, 
	userpw varchar(60) not null, 
	username varchar(50) not null, 
	email varchar(100) not null, 
	regdate timestamp default now(),
	userage int,
	userinfo text,
	primary key(userid)
);

-- 자유게시판 테이블
create table freeboard (
bno int not null auto_increment, -- 게시판 번호
title varchar(200) not null, -- 게시판 제목
content text, -- 게시판 내용
writer varchar(50) not null references user (username), -- 게시판 작성자
regdate timestamp not null default now(), -- 게시판 작성일
hit int default 0, -- 게시판 조회수
replycnt int not null default 0, -- 댓글수
primary key (bno)
);

-- 댓글 테이블
create table freereply(
rno int not null auto_increment,
bno int not null references freeboard (bno),
replytext varchar(500) not null,
replyer varchar(50) not null references user (username),
regdate timestamp not null default now(),
primary key(rno)
);

-- 첨부파일 테이블
create table boardattach(
   fullname varchar(150) not null,
    bno int not null,
    regdate timestamp default now(),
    primary key(fullname)
);

 -- 첨부파일 테이블 만들고 바로 삽입하세요
alter table boardattach add constraint fk_board_attach
foreign key (bno) references freeboard (bno);

-- 댓글 CLUD 테스트 쿼리
insert into freeboard (title, content, writer) values ('제목', '내용', '저녕태');
insert into freereply (bno,	replytext, replyer) values (1, 'ss', 'ss');
select * from freereply where bno = 1 order by rno desc;
update freereply set replytext = 'sss' where rno = 1;
delete from from freereply where rno;

-- 댓글 카운터 동기화
update freeboard set replycnt = 
(select count (rno) from freereply where bno = freeboard.bno)
where bno > 0;

SELECT * FROM USER;
delete from user;


-- 쪽지 테이블
create table message(
	mno int not null auto_increment,
    targetid varchar(50) not null references user (userid),
    readpoint int NOT NULL default 0,
    sender varchar(50) not null references user (userid),
    message text not null,
    opendate timestamp,
    senddate timestamp not null default now(),
    primary key (mno)
);

drop table message;
select * from message;
