-- hospital_schema.sql

--a data schema is added to the database

drop table if exists 'patient';

create table patient (
    pk int not null,
    p_fname varchar(128) not null,   
    p_lname varchar(128) not null, 
    p_gender varchar(32) not null,
    DOB date, 
    p_con_num int not null,
    p_address varchar(512) not null,
    insurance_company varchar(128) not null,
    primary key(pk)
);

drop table if exists 'staff';

create table staff (
    pk int not null,
    staff_fname varchar(128) not null,   
    staff_lname varchar(128) not null, 
    position varchar(32) not null,
    p_con_num int not null,
    primary key(pk)
);

drop table if exists 'doctor';

create table doctor ( 
    fk_staff int not null,      
    specialization varchar(256),
    year_experience int not null not null,
    graduate_school varchar(256) not null,
    rating_on_google float(8) not null,
    shift_starts_time time,
    shift_ends_time time,
    primary key(fk_staff), 
    foreign key(fk_staff) references staff(pk)
);

drop table if exists 'receptionist';

create table receptionist (               
    fk_staff int not null,
    fk_doctor int not null unique,
    primary key(fk_staff),  --just to avoid duplication
    foreign key(fk_staff) references staff(pk),
    foreign key(fk_doctor) references doctor(fk_staff)       
);

drop table if exists 'nurse';

create table nurse (
    fk_staff int not null,
    primary key(fk_staff),  --just to avoid duplication
    foreign key(fk_staff) references staff(pk)
);


drop table if exists 'accountant';

create table accountant (
    fk_staff int not null,
    primary key(fk_staff), --just to avoid duplication
    foreign key(fk_staff) references staff(pk)    
);


drop table if exists 'bill';

create table bill (                        
    bill_no int not null,
    bill_issue_date date,
    current_balance float(8),     
    last_payment_date date,
    fk_patient int not null,
    fk_doctor int not null,
    primary key(bill_no), 
    -- pk is the bill no.
    --one patient have many bills , diffrent rows for different bills (diffferent doctors)
    foreign key(fk_patient) references patient(pk),        
    foreign key(fk_doctor) references doctor(fk_staff)   
    
);    


drop table if exists 'patient_symptom';

create table patient_symptom ( 
    patient int not null,
    specialization varchar(128) not null,
    patient_symptom varchar(512) not null,
    foreign key(patient) references patient(pk), 
    foreign key(specialization) references doctor(fk_staff), 
    primary key(patient,specialization)
);


