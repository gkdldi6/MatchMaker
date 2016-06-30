-- -----------------------------------------------------
-- Schema matchmaker
-- -----------------------------------------------------

drop database matchmaker;

CREATE SCHEMA IF NOT EXISTS matchmaker DEFAULT CHARACTER SET utf8;
USE matchmaker;

-- -----------------------------------------------------
-- Table user
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS user (
  userid VARCHAR(50) NOT NULL, -- 회원 아이디 (기본키)
  userpw VARCHAR(60) NOT NULL, -- 회원 비밀번호
  username varchar(50) NOT NULL, -- 회원 이름
  email VARCHAR(100) NOT NULL, -- 회원 이메일
  regdate timestamp default now(),  -- 회원 가입날짜
  userage int,
  userinfo text null,
  usercode VARCHAR(10) NULL, 
  userpoint int, -- 활동 포인트
  PRIMARY KEY (userid)
);

-- -----------------------------------------------------
-- Table admin
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS admin (
  id VARCHAR(10) NOT NULL, -- 관리자 아이디
  pw VARCHAR(60) NULL, -- 관리자 비밀번호
  auth VARCHAR(45) NULL, -- ??
  PRIMARY KEY (id)
);

-- -----------------------------------------------------
-- Table article
-- -----------------------------------------------------

drop table article;
create table if not exists article(
  bno int not null,
  ano int not null,
  title varchar(50) not null,
  writer varchar(10) not null,
  content text,
  regdate timestamp default now(),
  hit int not null default 0,
  replycnt int not null default 0,
  article_type varchar(10),
  primary key(bno, ano)
);

-- -----------------------------------------------------
-- Table free
-- -----------------------------------------------------

drop table free;
create table if not exists free(
  bno int not null,
  ano int not null,
  liked int default 0,
  primary key(bno, ano)
);

-- -----------------------------------------------------
-- Table reference
-- -----------------------------------------------------

drop table reference;
create table if not exists reference(
  bno int not null, 
  ano int not null,
  fullname varchar(200) not null,
  regdate timestamp default now(),
  primary key(bno, ano, fullname)
);

select * from reference;
select * from article;
select * from free;
desc reference;

-- -----------------------------------------------------
-- Table notice
-- -----------------------------------------------------

drop table notice;
create table if not exists notice (
  bno int not null,
  ano int not null,
  deadline timestamp,
  bound varchar(10),
  primary key(bno, ano)
);


select * from article;
select * from free;
select * from notice;
select * from reference;

select * from article a, free f where a.bno = f.bno and a.ano = f.ano;
select * from article a, notice n where a.bno = n.bno and a.ano = n.ano;
select * from article a, reference r where a.bno = r.bno and a.ano = r.ano;


drop table article;
drop table free;
drop table notice;
drop table reference;


select * from article  where bno =1 order by ano desc;

update article set replycnt = replycnt + 1
		where bno = 1 and ano = 3;

   insert into article (bno, ano, title, content, writer)
      values(1, 5, 'serysbery', 'serybsreyb', 'serybrteb');
        
drop table test;
create table test(
   tno int not null default 1,
   primary key(tno)
);

insert into test values();

select tno from test order by tno desc limit 1;

select * from test;
    
   insert into article (bno, ano, title, content, writer)
      values(1, 3, 'serysbery', 'serybsreyb', 'serybrteb') on duplicate key update bno=1, ano=(select ano from article order by ano desc limit 1)+1;


insert into free (bno, ano , liked)
values(1, 3, 5);


-- INSERT INTO students (name, email) VALUES ('saltfactory', 'saltfactory@gmail.com') 
-- ON DUPLICATE KEY UPDATE name='saltfactory', email='saltfactory@me.com';

update article set replycnt = replycnt + 1
		where bno = 1 and ano = 3;


-- -----------------------------------------------------
-- Table court
-- -----------------------------------------------------

create table court(
  ano int NOT NULL, --
  bno INT NOT NULL, -- 게시판별 번호(04)
  address varchar(50), -- 코드 주소
  liked int, -- 글에 표시된 '좋아요' 클릭한 정보(아이디) 저장 (user_like 테이블에서 ano,bno 에 해당하는 count(*)값으로
  lat double(17,14) not null, -- 코트 위도
  lng double(17,14) not null, -- 코드 경도
  cname varchar(30) not null, -- 코트이름
  ccontent text null, -- 코트 정보
  primary key(ano, bno)
);

-- -----------------------------------------------------
-- Table user_like
-- -----------------------------------------------------

create table if not exists user_like(
  id varchar(20) references user (id), -- 아아디
  ano int not null,
  bno int not null, -- 게시판별 번호
  regdate timestamp default now(), -- 좋아요 누른 시간 저장 
  primary key(ano,bno)
);

-- -----------------------------------------------------
-- Table reply
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS reply (
  rno INT NOT NULL auto_increment,
  ano INT NOT NULL, --
  bno INT NOT NULL, -- 게시판별 번호
  replyer varchar(50) not null references user (username), -- 리플 단사람 이름
  replytext varchar(500) not null, -- 리플 내용
  regdate timestamp default now(), -- 리플 단 날짜
  PRIMARY KEY (rno)
);

select * from reply where bno =	1 and ano = 1
		order by rno limit 0, 5;

select * from article;
select * from reply;

-- -----------------------------------------------------
-- Table board
-- -----------------------------------------------------

create table if not exists board(
  bno int not null,
  name varchar(20) not null, 
  des varchar(50) null,
  primary key(bno)
);

insert into board values(0, '공지게시판', '공지게시판입니다.');
insert into board values(2, '농구게시판', '농구게시판입니다.');
insert into board values(3, '게임게시판', '게임게시판입니다.');
insert into board values(100, '자료게시판', '자료게시판입니다.');

-- -----------------------------------------------------
-- Table 임시저장소
-- -----------------------------------------------------

create table if not exists addattach(
  bno int not null,
  name varchar(20) not null, 
  des varchar(50) null,
  primary key(bno)
);
desc reference;
insert into board values(0, '공지게시판', '공지게시판입니다.');
insert into board values(2, '농구게시판', '농구게시판입니다.');
insert into board values(3, '게임게시판', '게임게시판입니다.');
insert into board values(100, '자료게시판', '자료게시판입니다.');

-- -----------------------------------------------------
-- Table grade_code
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS grade_code (
  code_type VARCHAR(45) NOT NULL, -- ??
  code VARCHAR(45) NOT NULL, -- ??
  code_type_value VARCHAR(45) NULL, -- ??
  code_value VARCHAR(45) NULL, -- ???
  grade_score VARCHAR(45) NULL, -- ????
  PRIMARY KEY (code_type, code) 
);



-- -----------------------------------------------------
-- Table player
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS player (
  id VARCHAR(20) NOT NULL references user (id),
  age varchar(5), -- 나이 -->메모리상 낭비를 줄이기위해 문자형으로 받음
  sex varchar(5), -- 성별
  height VARCHAR(10) NULL, -- 키
  weight VARCHAR(10) NULL, -- 몸무게
  position VARCHAR(10) NULL, -- 포지션
  gamecnt int , -- 게임수 int++ 이용 하기 위해서 숫자형
  wincnt int, -- 이긴수 int++ 이용 하기 위해서 숫자형 
  basketball_code VARCHAR(45) NULL, -- ??
  basketpoint VARCHAR(45) NULL, -- ??
  trustpoint VARCHAR(10) NULL, -- 신뢰도
  PRIMARY KEY (id)
);


-- -----------------------------------------------------
-- Table message
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS message (
  sendid VARCHAR(10) NOT NULL,  -- 쪽지 보내는 아이디 (to)
  targetid VARCHAR(10) NOT NULL,  -- 쪽지 보내고자 하는 아이디 (from)
  senddate timestamp default now(),  -- 쪽지 보낸 날짜
  msgtext text not null, -- 쪽지 
  readdate timestamp null,  -- 쪽지 읽은 시간
  PRIMARY KEY (sendid, targetid, senddate)
 );
select a.bno, a.ano, a.title, a.writer, a.content, a.regdate, a.hit, a.replycnt, f.liked from article a, free f
		where a.bno = f.bno and a.ano = f.ano and a.bno = 1 order by a.ano desc;



select * from free;
select * from article;
select * from notice;
select * from reference;

-- error to forward
drop table freeboard;
drop table freereply;
drop table article;
drop table boardattach;
drop table notice;
drop table reference;
drop table free;
drop table test_tb;
drop table matchmaker;
select * from message;

show tables;
use matchmaker;

select * from 

select a.bno, a.ano, a.title, a.writer, a.content, a.regdate, a.hit, a.replycnt, f.liked
		from article a, free f
		where a.bno = f.bno and a.ano = f.ano;
        
select *
		from article a, free f
		where a.bno = f.bno and a.ano = f.ano and a.bno = 2;
        
        select a.bno, a.ano, a.title, a.writer, a.content, a.regdate, a.hit, a.replycnt, f.liked from article a, free f
		where a.bno = f.bno and a.ano = f.ano and a.ano = 5;
        
select * from article;
select * from notice;
select * from reference natural join free f left join notice n on f.ano = n.ano;




select a.bno, a.ano, a.title, a.writer, a.content, a.regdate, a.hit, a.replycnt, f.liked
from article a left join free f on a.bno = f.bno and a.ano = f.ano join notice n on a.bno = n.bno and a.ano = n.ano and n.bound = 3;



select a.bno, a.ano, a.title, a.writer, a.content, a.regdate, a.hit, a.replycnt, f.liked
from notice n left join free f on n.bno = f.bno and n.ano = f.ano join article a on n.bno = a.bno and n.ano = a.ano where n.bound = 3
union
select a.bno, a.ano, a.title, a.writer, a.content, a.regdate, a.hit, a.replycnt, f.liked from article a, free f
		where a.bno = f.bno and a.ano = f.ano and a.bno = 1;



-- 중요
select a.bno, a.ano, a.title, a.writer, a.content, a.regdate, a.hit, a.replycnt, f.liked
from notice n left join free f on n.bno = f.bno and n.ano = f.ano join article a on n.bno = a.bno and n.ano = a.ano where n.bound = 3;


-- 최다시리즈
-- 따봉쿼리
select * from article a, free f
where a.bno = f.bno and a.ano = f.ano and a.bno = 1
order by f.liked desc
limit 0 , 5;

-- 따봉수 변경쿼리
update free set liked = '2' where ano = 6;

-- safe모드 해제해서 데이터 변경가능하게 바꾸기
set sql_safe_updates=0;

-- 조회쿼리
select * from article a, free f
where a.bno = f.bno and a.ano = f.ano and a.bno = 1
order by a.hit desc
limit 0 , 5;

-- 댓글쿼리
select * from article a, free f
where a.bno = f.bno and a.ano = f.ano and a.bno = 1
order by a.replycnt desc
limit 0 , 5;