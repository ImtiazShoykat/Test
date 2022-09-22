
CREATE TABLE company
(
    com_id         NUMBER PRIMARY KEY,
    com_name       VARCHAR2 (50),
    com_address    VARCHAR2 (100),
    com_phone      VARCHAR2 (20),
    com_email      VARCHAR2 (50),
    com_web        VARCHAR2 (50)
);

CREATE TABLE employees_info
(
    emp_id           NUMBER PRIMARY KEY,
    com_id           NUMBER,
    emp_name         VARCHAR2 (30),
    emp_phone        VARCHAR2 (20),
    emp_address      VARCHAR2 (100),
    emp_email        VARCHAR2 (50),
    emp_gender       VARCHAR2 (10),
    emp_job_title    VARCHAR2 (50),
    emp_hire_date    DATE,
    emp_image        BLOB,
    emp_status       VARCHAR2 (20),
    emp_password     VARCHAR2 (30)
);

CREATE TABLE parking_master
(
    park_mst_id        NUMBER PRIMARY KEY,
    com_id             NUMBER,
    customer_name      VARCHAR2 (100),
    customer_phone     VARCHAR2 (20),
    membership_type    VARCHAR2 (30)
);


CREATE TABLE parking_details
(
    park_dtl_id      NUMBER PRIMARY KEY,
    park_mst_id      NUMBER,
    veh_id           NUMBER,
    emp_id           NUMBER,
    park_date        DATE,
    veh_type         VARCHAR2 (50),
    start_time       DATE,
    end_time         DATE,
    total_hours      NUMBER,
    total_ammount    NUMBER,
    veh_number       VARCHAR2 (50)
);


CREATE TABLE Vehicle_info
(
    veh_id                NUMBER PRIMARY KEY,
    veh_type              VARCHAR2 (50),
    bike_rate_per_hour    NUMBER,
    car_rate_per_hour     NUMBER
);

CREATE TABLE Shop_Rent_Master
(
    shop_rent_mst_id    NUMBER PRIMARY KEY,
    com_id              NUMBER,
    agr_mst_id          NUMBER,
    shop_cat_id         NUMBER,
    shop_name           VARCHAR2 (100),
    owner               VARCHAR2 (100),
    shop_address        VARCHAR2 (200),
    shop_floor          VARCHAR2 (50)
);


CREATE TABLE Shop_Rent_Details
(
    shop_rent_dtl_id    NUMBER PRIMARY KEY,
    shop_rent_mst_id    NUMBER,
    shop_cat_id         NUMBER,
    emp_id              NUMBER,
    rent_month          DATE,
    rent_ammount        NUMBER,
    due_rent            NUMBER,
    issue_date          DATE
);



CREATE TABLE shop_category
(
    shop_cat_id      NUMBER PRIMARY KEY,
    shop_cat_name    VARCHAR2 (50),
    shop_size        VARCHAR2 (50),
    rent_rate        NUMBER
);

CREATE TABLE Agreement_Master
(
    agr_mst_id     NUMBER PRIMARY KEY,
    com_id         NUMBER,
    agr_type       VARCHAR2 (50),
    agr_ammount    NUMBER,
    agr_with       VARCHAR2 (50),
    shop_cat_id    NUMBER
);



CREATE TABLE Agreement_Details
(
    agr_dtl_id        NUMBER PRIMARY KEY,
    agr_mst_id        NUMBER,
    agr_start_date    DATE,
    agr_end_date      DATE,
    agr_period        VARCHAR2 (50),
    agr_doc           CLOB,
    agr_advance       NUMBER,
    agr_due           NUMBER,
    emp_id            NUMBER
);



ALTER TABLE employees_info
    ADD FOREIGN KEY (com_id) REFERENCES company (com_id);

ALTER TABLE parking_master
    ADD FOREIGN KEY (com_id) REFERENCES company (com_id);

ALTER TABLE parking_details
    ADD FOREIGN KEY (park_mst_id) REFERENCES parking_master (park_mst_id);

ALTER TABLE parking_details
    ADD FOREIGN KEY (veh_id) REFERENCES Vehicle_info (veh_id);

ALTER TABLE parking_details
    ADD FOREIGN KEY (emp_id) REFERENCES employees_info (emp_id);


ALTER TABLE Shop_Rent_Master
    ADD FOREIGN KEY (com_id) REFERENCES company (com_id);

ALTER TABLE Shop_Rent_Master
    ADD FOREIGN KEY (agr_mst_id) REFERENCES Agreement_Master (agr_mst_id);

ALTER TABLE Shop_Rent_Master
    ADD FOREIGN KEY (shop_cat_id) REFERENCES shop_category (shop_cat_id);


ALTER TABLE Shop_Rent_Details
    ADD FOREIGN KEY
            (shop_rent_mst_id)
            REFERENCES Shop_Rent_Master (shop_rent_mst_id);

ALTER TABLE Shop_Rent_Details
    ADD FOREIGN KEY (shop_cat_id) REFERENCES shop_category (shop_cat_id);

ALTER TABLE Shop_Rent_Details
    ADD FOREIGN KEY (emp_id) REFERENCES employees_info (emp_id);

ALTER TABLE Agreement_Master
    ADD FOREIGN KEY (com_id) REFERENCES company (com_id);

ALTER TABLE Agreement_Master
    ADD FOREIGN KEY (shop_cat_id) REFERENCES shop_category (shop_cat_id);

ALTER TABLE Agreement_Details
    ADD FOREIGN KEY (agr_mst_id) REFERENCES Agreement_Master (agr_mst_id);

ALTER TABLE Agreement_Details
    ADD FOREIGN KEY (emp_id) REFERENCES employees_info (emp_id);
    
    commit;
    
    -- inserting 5 static data in employees_info table 
    INSERT INTO employees_info (EMP_ID,
                            EMP_NAME,
                            EMP_PHONE,
                            EMP_ADDRESS,
                            EMP_EMAIL,
                            EMP_GENDER,
                            EMP_JOB_TITLE,
                            EMP_HIRE_DATE,
                            EMP_STATUS,
                            EMP_PASSWORD)
     VALUES (1,
             'Imtiaz',
             '01671526039',
             'Airport, Dhaka',
             'imtiaz.shoykat@gmail.com',
             'Male',
             'Developer',
             SYSDATE,
             'Active',
             '0000');

INSERT INTO employees_info (EMP_ID,
                            EMP_NAME,
                            EMP_PHONE,
                            EMP_ADDRESS,
                            EMP_EMAIL,
                            EMP_GENDER,
                            EMP_JOB_TITLE,
                            EMP_HIRE_DATE,
                            EMP_STATUS,
                            EMP_PASSWORD)
     VALUES (2,
             'Inzam',
             '0177744947',
             'Mirpur, Dhaka',
             'inzam@gmail.com',
             'Male',
             'Developer',
             SYSDATE,
             'Active',
             '123');

INSERT INTO employees_info (EMP_ID,
                            EMP_NAME,
                            EMP_PHONE,
                            EMP_ADDRESS,
                            EMP_EMAIL,
                            EMP_GENDER,
                            EMP_JOB_TITLE,
                            EMP_HIRE_DATE,
                            EMP_STATUS,
                            EMP_PASSWORD)
     VALUES (3,
             'Imran',
             '01671690237',
             'Mirpur, Dhaka',
             'imran@gmail.com',
             'Male',
             'Developer',
             SYSDATE,
             'Active',
             '123');

INSERT INTO employees_info (EMP_ID,
                            EMP_NAME,
                            EMP_PHONE,
                            EMP_ADDRESS,
                            EMP_EMAIL,
                            EMP_GENDER,
                            EMP_JOB_TITLE,
                            EMP_HIRE_DATE,
                            EMP_STATUS,
                            EMP_PASSWORD)
     VALUES (4,
             'Habib',
             '01729932286',
             'Mirpur 1, Dhaka',
             'habib@gmail.com',
             'Male',
             'Developer',
             SYSDATE,
             'Active',
             '123');

INSERT INTO employees_info (EMP_ID,
                            EMP_NAME,
                            EMP_PHONE,
                            EMP_ADDRESS,
                            EMP_EMAIL,
                            EMP_GENDER,
                            EMP_JOB_TITLE,
                            EMP_HIRE_DATE,
                            EMP_STATUS,
                            EMP_PASSWORD)
     VALUES (5,
             'Shohel',
             '01628446667',
             'Mohammadpur, Dhaka',
             'sohel@gmail.com',
             'Male',
             'Developer',
             SYSDATE,
             'Active',
             '123');
             
         -- inserting 1 company data into company table    
INSERT INTO company (COM_ID,
                     COM_NAME,
                     COM_ADDRESS,
                     COM_PHONE,
                     COM_EMAIL,
                     COM_WEB)
     VALUES (1,
             'IDB Computer City',
             'Agargaon, Dhaka',
             '01700000000',
             'idb@gmail.com',
             'www.isdbw.com');
             
  commit;
