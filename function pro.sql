/*Takes input as eid gives output of salary (in $)*/
create procedure emp_sal(@e int,@sal int output)
as
begin
      select @sal=salary from employee where eid=@e
end
--Execution
begin 
declare @s int
execute emp_sal 2,@s output
print 'Salary of employee 2 is : ' + cast(@s as varchar(20))
end
select * from employee;

/*Calculates Gross salary of Employee name given*/
create procedure cal_grosssal(@ename varchar(30),@g int output)
as
begin
  declare @s money, @eid int,@d as money ,@hra as money
  select @eid=eid from employee where ename like @ename
  execute emp_sal @eid, @s output

  --5% da and 20% hra
  set @d=5
  set @hra=20
  set @g=@s+(@s*(@d/100))+(@s*(@hra/100))

end
 
--Execution
begin 
declare @gross_sal int
execute cal_grosssal 'Hillie Axton',@gross_sal output
print 'Gross salary of employee Carlo Lepard is : ' + cast(@gross_sal as varchar(20))
end

/*Sales of particular drug*/
create procedure drug_sales(@trade_name varchar(30),@sales int output)
as
begin
      select @sales=count(qty) from buys group by trade_name having trade_name like @trade_name
end
--Execution
begin 
declare @sales int
execute drug_sales 'arthritis pain relief',@sales output
print 'Sales of arthritis pain relief : ' + cast(@sales as varchar(20))
end

/*function to give the number of patients under doctor*/
create function supervision (@doc_name varchar(30))
returns int 
as
begin
	declare @number int,@id int
	select @id = doc_id from DOCTOR where doc_name like @doc_name
	select @number = count(patient_id) from PRESCRIPTION where doc_id= @id
	return @number 
end
drop function supervision
select dbo.supervision('Serene') as Dr_Serene_Supervision
/*Details of doctors having more than 3 patients*/
Select * from DOCTOR where (dbo.supervision(doc_name))>3
Select 
/*
create procedure display2(@ph_id int) 
as
begin 
declare @ph_name as varchar(20),@dd as int,@o_date as date
select @ph_name=ph_name from pharmacy 
	where ph_id in
	(select ph_id from orders where 2<DATEDIFF(year,o_date,GETDATE()) and @ph_id=ph_id)
print cast(@ph_name as varchar(20))
end
select * from pharmacy;
execute display2 605 


*/
/*Check the availability of drugs before buying update if available*/
create trigger quantity on buys
for insert
as
begin
declare @ph_id as int, @need as int,@available as int,@trade_name as varchar(30),
	@patient_id int,@buy_date date, @price as money, @qty as int,@bill money
select @need=qty,@ph_id=ph_id,@trade_name=trade_name from inserted
select @available=qty from sells where ph_id=@ph_id and trade_name=@trade_name
if(@need<@available)
	begin
		print 'successful'
		select @price=price,@qty=qty,@patient_id=patient_id,@ph_id=ph_id,@buy_date=buy_date,
		@trade_name=trade_name from inserted
			set @bill=(@price * @qty) 
		update buys set bill = @bill where patient_id = @patient_id and ph_id = @ph_id 
		and buy_date = @buy_date and trade_name = @trade_name
		commit
	end
	else
	begin
	   print 'drugs not available'
	   rollback
	end  
end
insert into buys (patient_id,trade_name,buy_date,qty,price,ph_id) values
	('19','Plegridy','2017-09-09','3','9.23','601')

insert into buys(patient_id,ph_id,trade_name,buy_date,qty) 
	values('1','601','arthritis pain relief','2017-08-07',2)

/*Calculate the age of the patient*/
create trigger cal_age on patient
for insert
as
begin
declare @patient_id as int, @dob as date,@age int
select @patient_id=patient_id,@dob=dob from inserted
	set @age=DATEDIFF(year,@dob,GETDATE())
	update patient set age = @age where patient_id = @patient_id
end

insert into patient (patient_id,p_fname,p_mname,p_lname,gender,p_address,number,dob) 
	values('76','Simran','Dilip','Bhojwani','F','A-12 AmanTalkies','31-(244)141-5367','1997-05-06')
select * from pharmacy

select * from makes
select * from ORDERS
/*order availability*/
create trigger order_available on orders 
for insert
as
begin
declare @trade_name as varchar(30), @cid as int,@y as int
select @trade_name=trade_name,@cid=c_id from inserted
select @y=count(trade_name) from makes where c_id=@cid and trade_name=@trade_name
if(@y>0)
	begin
		print 'successful'
		commit
	end
	else
	begin
	   print 'drugs not available'
	   rollback
	end  
end
insert into orders (ph_id,c_id,trade_name,o_date,qty,price,bill) 
	values ('601','503','arthritis pain relief','2017-08-09','0','0','0')
	select * from buys
/*create trigger to calculate bill*/
create trigger cal_bill on buys
for insert
as
begin
declare @patient_id int,@ph_id int,@trade_name varchar(30),
	@buy_date date, @price as money, @qty as int,@bill money
select @price=price,@qty=qty,@patient_id=patient_id,@ph_id=ph_id,@buy_date=buy_date,
		@trade_name=trade_name from inserted
	set @bill=(@price * @qty) 
	update buys set bill = @bill where patient_id = @patient_id and ph_id = @ph_id 
		and buy_date = @buy_date and trade_name = @trade_name
end
drop trigger cal_bill
drop trigger quantity

/*pl/sql*/
DECLARE
   @power int;
BEGIN
   SELECT shape FROM solid
   if @power>10
   then
	
      DBMS_OUTPUT.PUT_LINE('Square shaped pill.');
	
   ELSE
     begin
      DBMS_OUTPUT.PUT_LINE('Other shaped pill.');
	end
   END CASE;
   COMMIT;
END;



DECLARE
@a int= 100;
@b int = 200;
BEGIN
--
check the boolean condition 
IF( @a = 100 ) THEN
--
if condition is true then check the following 
IF( @b = 200 ) THEN
--
if condition is true then print the following 
dbms_output.put_line('Value of a is 100 and b is 200' );
END IF;
END IF;
dbms_output.p
ut_line('Exact value of a is : ' || a );
dbms_output.put_line('Exact value of b is : ' || b );
END;

	