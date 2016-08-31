UserService
mysql> desc user2;
+---------------+--------------+------+-----+---------+----------------+
| Field         | Type         | Null | Key | Default | Extra          |
+---------------+--------------+------+-----+---------+----------------+
| id            | int(11)      | NO   | PRI | NULL    | auto_increment |
| user_id       | varchar(200) | YES  |     | NULL    |                |
| user_password | varchar(200) | YES  |     | NULL    |                |
| name          | varchar(200) | YES  |     | NULL    |                |
+---------------+--------------+------+-----+---------+----------------+
4 rows in set (0.08 sec)


create table user2 (
id int,
user_id varchar(200),
user_password varchar(200),
name varchar(200)
)

insert into user2 (user_id, user_password, name) values ( 'denise77', '1114','경준님')


create table admin_user (
id int primary key auto_increment,
user_id varchar(100),
user_password varchar(100),
name varchar(100),
role varchar(100)

)

insert into admin_user ( user_id, user_password, name,role) values ( 'julian', '1114', 'kyungjoon_go2222', 'admin');
