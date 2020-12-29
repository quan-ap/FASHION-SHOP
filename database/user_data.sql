use fashionasmnew;

insert into role(id,code,name) values('1','ADMIN','Quan tri');
insert into role(id,code,name) values('2','USER','Nguoi Dung');

insert into user(id,username,password,fullname,status)
values('VMQ1','admin','$2a$10$/RUbuT9KIqk6f8enaTQiLOXzhnUkiwEJRdtzdrMXXwU7dgnLKTCYG','vu minh quan',1);
insert into user(id,username,password,fullname,status)
values('NVA2','nguyenvana','$2a$10$/RUbuT9KIqk6f8enaTQiLOXzhnUkiwEJRdtzdrMXXwU7dgnLKTCYG','ngueyn van a',1);
insert into user(id,username,password,fullname,status)
values('NVB3','nguyenvanb','$2a$10$/RUbuT9KIqk6f8enaTQiLOXzhnUkiwEJRdtzdrMXXwU7dgnLKTCYG','nguyen van b',1);

INSERT INTO user_role(userid,roleid) VALUES ('VMQ1','1');
INSERT INTO user_role(userid,roleid) VALUES ('NVA2','2');
INSERT INTO user_role(userid,roleid) VALUES ('NVB3','3');