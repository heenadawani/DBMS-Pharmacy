Insert into doctor values('113','Dr.Shetty','cardiac surgeon');
Insert into doctor values('114','Dr.Joshi','physician');
Insert into doctor values('115','Dr.Rao','allergist');



Insert into patient values('50','Simran','Dilipkumar','Bhojwani','F','AmanTalkies,Unr,421003','9730645555');
Insert into patient values('51','Riya','Kamlesh','Dadlani','F','MahanApt,Unr,421001','9784545115');
Insert into patient values('53','Kunal','Jeet','Bhatia','M','TowerOne,Unr,421005','9738534555');

/*alter pateint table */
alter table patient add age int ;
/*updation*/
update patient set dob='1997-06-05' where patient_id='50'
update patient set age='20' where patient_id='50'
update patient set dob='1997-07-15',age='20' where patient_id='51'
update patient set dob='1997-09-24',age='19' where patient_id='53'

Insert into drug values ('Nimesulide','Sterratiopeptidase','2018-07-14','yellow');
Insert into solid values ('Nimesulide','tablet','round','100');
Insert into drug values ('Ranitidine','Ranitidine hydrochloride','2018-02-21','creamish');
Insert into solid values ('Ranitidine','tablet','round','150');
Insert into drug values ('Ketorolac','Sulfa','2018-02-21','white');
Insert into solid values ('Ketorolac','tablet','round','93');
Insert into solid values ('Ketorolac','tablet','round','314');

/*drop column exp date because it is considered in sells that holds the information of stock
har drug ka exp_date har pharmacy will be different */ 
alter table drug drop column exp_date;

/*add exp_date column to sells*/
alter table sells add  exp_date date
alter table sells add batch varchar(30) not null;

Insert into prescription values('113','50','2017-08-26','Nimesulide','100');
Insert into prescription values('114','53','2017-08-26','Ranitidine','100');
Insert into prescription values('114','51','2017-08-26','Ranitidine','150');
Insert into prescription values('115','50','2017-08-27','Ketorolac','10');

Insert into buys values ('50','Nimesulide','2017-08-26','4','100','400');
Insert into buys values ('53','Ranitidine','2017-08-26','3','90','270');
Insert into buys values ('50','Ranitidine','2017-08-26','4','90','360');
Insert into buys values ('51','Ranitidine','2017-08-26','2','90','180');

/*Count the noof females consuming drug Ranitidine and Nimusulide*/
Select count(patient_id) as noof_females from patient as p where patient_id in (select patient_id from buys where trade_name in('Ranitidine','Nimesulide')) and gender like 'F';
/*details of pateints to whom Dr.Joshi has prescribed Ranitidine*/
Select p.patient_id,p.p_fname,p.age from patient as p,prescription as pr where pr.patient_id=p.patient_id and doc_id=(Select doc_id from doctor where doc_name='Dr.Joshi') and pr.trade_name='Ranitidine';

insert into pharmacy values ('5812','Shreeram','Chembur,mumbai,2241523');
insert into pharmacy values ('1512','Alpha','M.G.Road,Santacruz,341511');
insert into pharmacy values ('5682','Allright','Saharacity,Delhouse,1753122');

insert into employee values ('1','5812','Ramesh','9545264523','15000','09:00:00','22:00:00');
insert into employee values ('2','5812','Suresh','9545264888','15400','09:00:00','22:00:00');
insert into employee values ('5','5682','Rajesh','9545856943','15600','08:00:00','23:00:00');
insert into employee values ('3','1512','Kamlesh','9545264885','14000','09:30:00','22:00:00');
insert into employee values ('4','1512','Dinesh','9555864523','16500','09:30:00','22:00:00');
/*patient buys drugs from pharmacy to keep record from which pharmacy pateint bought drug*/
alter table buys add ph_id int;
alter table buys add constraint FK_phID_buys foreign key (ph_id)  references pharmacy(ph_id);
update buys set ph_id='5812' where patient_id='50';
update buys set ph_id='1512' where patient_id='51';
update buys set ph_id='5682' where patient_id='53';
select * from buys
/*join of noof employees working in all pharmacy*/
Select p.ph_id,p.ph_name,count(eid) as noof_employees from employee as e,pharmacy as p where p.ph_id=e.ph_id group by p.ph_id,p.ph_name order by p.ph_name; 
alter table sells drop constraint PK_stack
ALTER TABLE SELLS
ADD CONSTRAINT PK_stack PRIMARY KEY(ph_id,trade_name,qty,batch)
insert into sells values ('5812','Nimesulide','50','100','2018-08-02','16ba');
insert into sells values ('5812','Ranitidine','50','90','2018-05-02','16ra');
insert into sells values ('1512','Ranitidine','25','90','2018-08-02','16bl');
insert into sells values ('5682','Ranitidine','10','90','2017-09-13','15kg');
/*details of stock expiring before aug 2018 in pharmacy shreeram*/
select * from sells as s,pharmacy as p where p.ph_id =s.ph_id  and p.ph_name='Shreeram' and s.exp_date <= '2018-08-01'; 

select(convert(date,getdate()))