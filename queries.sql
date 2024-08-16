create database MVCDB

Create Table Student (
Sid Int Primary Key, 
Name Varchar(50), 
Class Int, 
Fees Money, 
Photo Varchar(100), 
Status Bit
Not Null Default 1)

select * from Student
delete from Student where Sid=105
insert into Student values (1,'Tira',5,5009,null,1),
(2,'Meet',7,4567,null,0),
(3,'Sita',4,5678,null,1)

-- select
create procedure Student_Select(@Sid Int=Null ,@Status Bit=Null)
As
Begin
	If @Sid Is Null And @Status Is Null --Fetches all the records of table
		Select Sid, Name, Class, Fees, Photo From Student Order By Sid;
	Else If @Sid Is Null And @Status Is Not Null --Fetches records based on Status
		Select Sid, Name, Class, Fees, Photo From Student Where Status=@Status Order By Sid;
	Else If @Sid Is Not Null And @Status Is Null --Fetches a single record based on Sid
		Select Sid, Name, Class, Fees, Photo From Student Where Sid=@Sid;
	Else If @Sid Is Not Null And @Status Is Not Null --Fetches a single record based on Sid & Status
		Select Sid, Name, Class, Fees, Photo From Student Where Sid=@Sid And Status=@Status;
End

exec Student_Select @Sid=Null,@Status=Null

--insert
Create Procedure Student_Insert(@Sid int, @Name varchar(50), @Class int, @Fees money, @Photo varchar(100)=null)
As
Insert Into Student (Sid, Name, Class, Fees,Photo) Values (@Sid, @Name, @Class, @Fees, @Photo)

--update
Create Procedure Student_Update(@Sid int, @Name varchar(50), @Class int, @Fees money, @Photo varchar(100)=Null)
As
Update Student Set Name=@Name, Class=@Class, Fees=@Fees, Photo=@Photo Where Sid=@Sid;
-- soft delete
Create Procedure Student_Delete(@Sid Int)
As
Update Student Set Status=0 Where Sid=@Sid;

