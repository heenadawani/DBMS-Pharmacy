CREATE TABLE DOCTOR(
	doc_id INT NOT NULL,
	doc_name VARCHAR(30) NOT NULL,
	speciality VARCHAR(40) NOT NULL,

)
alter table DOCTOR
add constraint PK_docID primary key(doc_id);
CREATE TABLE PATIENT(
	patient_id INT NOT NULL,
	p_fname VARCHAR(15) NOT NULL,
	p_mname VARCHAR(15) NOT NULL,
	p_lname VARCHAR(15) NOT NULL ,
	gender VARCHAR(1) NOT NULL ,
	p_address TEXT ,
	number nvarchar(100) not null, 
	CONSTRAINT CHK_gender CHECK(gender in ('M', 'F','O'))

)
alter table PATIENT
add constraint PK_patientID primary key(patient_id);
CREATE TABLE PHARMACY(
	ph_id INT NOT NULL ,
	ph_name VARCHAR(20) NOT NULL ,
	ph_address TEXT ,
	 
)
alter table PHARMACY
add constraint PK_phID primary key(ph_id);
CREATE TABLE EMPLOYEE(
	eid INT NOT NULL ,
	ph_id INT NOT NULL ,
	ename VARCHAR(30) NOT NULL,
	contact nvarchar(100) not null, 
	salary MONEY ,
	shift_strt TIME ,
	shift_end TIME 
)
alter table EMPLOYEE
add constraint PK_eID primary key(eid);
alter table EMPLOYEE
add constraint FK_phID foreign key(ph_id) REFERENCES PHARMACY(ph_id);
CREATE TABLE DRUG(
	trade_name VARCHAR(30) NOT NULL ,
	content TEXT ,
	exp_date DATE 

)
alter table DRUG
add constraint PK_tradeNAME primary key(trade_name);
CREATE TABLE PRESCRIPTION(
	doc_id INT NOT NULL , 
	patient_id INT NOT NULL ,
	prescription_date DATE NOT NULL ,
	trade_name VARCHAR(30) NOT NULL ,
	qty INT 

)
alter table PRESCRIPTION
add constraint FK_patientID foreign key(patient_id) REFERENCES PATIENT(patient_id);
alter table PRESCRIPTION
add constraint FK_docID foreign key(doc_id) REFERENCES DOCTOR(doc_id);
alter table PRESCRIPTION
add constraint FK_tradeNAME foreign key(trade_name) REFERENCES DRUG(trade_name);
alter table PRESCRIPTION
add constraint PK_eachPRESCRIPTION primary key(doc_id,patient_id,prescription_date);

CREATE TABLE BUYS(
	patient_id INT NOT NULL,
	trade_name VARCHAR(30) NOT NULL ,
	buy_date DATE NOT NULL ,
	qty INT NOT NULL,
	price MONEY ,
	bill MONEY 

)
alter table BUYS
add constraint FK_patientID_buys foreign key(patient_id) REFERENCES PATIENT(patient_id);
alter table BUYS
add constraint FK_tradeNAME_buys foreign key(trade_name) REFERENCES DRUG(trade_name);
alter table BUYS
add constraint PK_eachBUY primary key(patient_id,trade_name,buy_date);
CREATE TABLE COMPANY(
	c_id INT NOT NULL,
	cname VARCHAR(30) NOT NULL,
	c_address TEXT
)
alter table COMPANY
add constraint PK_cID PRIMARY KEY(c_id);
create table MAKES(
	c_id INT NOT NULL ,
	trade_name VARCHAR(30) NOT NULL 
)
ALTER TABLE MAKES 
ADD CONSTRAINT FK_cID FOREIGN KEY (c_id) REFERENCES COMPANY (c_id);
ALTER TABLE MAKES 
ADD CONSTRAINT FK_tradename_makes FOREIGN KEY (trade_name) REFERENCES DRUG (trade_name);
alter table makes
add constraint PK_eachPRODUCTION PRIMARY KEY (c_id,trade_name)
create table ORDERS(
	ph_id INT NOT NULL,
	c_id INT NOT NULL ,
	trade_name VARCHAR(30) NOT NULL,
	o_date DATE NOT NULL,
	qty INT NOT NULL,
	price MONEY NOT NULL,
	bill MONEY NOT NULL, 

)
ALTER TABLE ORDERS
ADD CONSTRAINT FK_phID_orders FOREIGN KEY(ph_id) REFERENCES PHARMACY(ph_id)
ALTER TABLE ORDERS
ADD CONSTRAINT FK_cID_orders FOREIGN KEY(c_id) REFERENCES COMPANY(c_id)
ALTER TABLE ORDERS
ADD CONSTRAINT FK_tradename_orders FOREIGN KEY(trade_name) REFERENCES DRUG(trade_name)
ALTER TABLE ORDERS
ADD CONSTRAINT PK_eachORDER PRIMARY KEY(ph_id,c_id,trade_name,o_date)
create table SELLS(
	ph_id INT NOT NULL,
	trade_name VARCHAR(30) NOT NULL,
	qty INT NOT NULL,
	price MONEY NOT NULL,
)
ALTER TABLE SELLS
ADD CONSTRAINT FK_phID_sells FOREIGN KEY(ph_id) REFERENCES PHARMACY(ph_id);
ALTER TABLE SELLS
ADD CONSTRAINT FK_tradename_sells FOREIGN KEY(trade_name) REFERENCES DRUG(trade_name)
/*changes in second file 
ALTER TABLE SELLS
ADD CONSTRAINT PK_stack PRIMARY KEY(ph_id,trade_name,qty)*/


ALTER TABLE DRUG
ADD color VARCHAR(15)

CREATE TABLE SOLID(
	trade_name VARCHAR(30) NOT NULL ,
	solid_type varchar(20) not null ,
	shape varchar(15) not null,
	power int
)
ALTER TABLE SOLID
ADD CONSTRAINT FK_tradename_solid FOREIGN KEY(trade_name) REFERENCES DRUG(trade_name)
CREATE TABLE SEMISOLID(
	trade_name VARCHAR(30) NOT NULL ,
	ssolid_type varchar(20) not null ,
	greasy varchar(1) ,
	absorbtion varchar(1),
	CONSTRAINT CHK_greasy CHECK(greasy in ('Y', 'N')),
	CONSTRAINT CHK_absorbtion CHECK(absorbtion in ('F', 'M','S'))
)
ALTER TABLE SEMISOLID
ADD CONSTRAINT FK_tradename_ssolid FOREIGN KEY(trade_name) REFERENCES DRUG(trade_name)
CREATE TABLE SYRUP(
	trade_name VARCHAR(30) NOT NULL ,
	taste varchar(20) 
	
)
ALTER TABLE SYRUP
ADD CONSTRAINT FK_tradename_syrup FOREIGN KEY(trade_name) REFERENCES DRUG(trade_name)
