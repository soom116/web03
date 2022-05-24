create table board(seq number primary key,      --글번호
title varchar2(100) not null,                   --제목
content varchar2(800) not null,                 --내용
nickname varchar2(20),                          --닉네임
regdate date,                                   --작성일
visited number                                  --조회수
);

select * from board;