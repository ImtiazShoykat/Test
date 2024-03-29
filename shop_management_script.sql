CREATE TABLE COMPANY (
    COM_ID NUMBER PRIMARY KEY,
    COM_NAME VARCHAR2 (50),
    COM_ADDRESS VARCHAR2 (100),
    COM_PHONE VARCHAR2 (20),
    COM_EMAIL VARCHAR2 (50),
    COM_WEB VARCHAR2 (50)
);

CREATE TABLE EMPLOYEES_INFO (
    EMP_ID NUMBER PRIMARY KEY,
    COM_ID NUMBER,
    EMP_NAME VARCHAR2 (30),
    EMP_PHONE VARCHAR2 (20),
    EMP_ADDRESS VARCHAR2 (100),
    EMP_EMAIL VARCHAR2 (50),
    EMP_GENDER VARCHAR2 (10),
    EMP_JOB_TITLE VARCHAR2 (50),
    EMP_HIRE_DATE DATE,
    EMP_IMAGE BLOB,
    EMP_STATUS VARCHAR2 (20),
    EMP_PASSWORD VARCHAR2 (30)
);

CREATE TABLE PARKING_MASTER (
    PARK_MST_ID NUMBER PRIMARY KEY,
    COM_ID NUMBER,
    CUSTOMER_NAME VARCHAR2 (100),
    CUSTOMER_PHONE VARCHAR2 (20),
    MEMBERSHIP_TYPE VARCHAR2 (30)
);

CREATE TABLE PARKING_DETAILS (
    PARK_DTL_ID NUMBER PRIMARY KEY,
    PARK_MST_ID NUMBER,
    VEH_ID NUMBER,
    EMP_ID NUMBER,
    PARK_DATE DATE,
    VEH_TYPE VARCHAR2 (50),
    START_TIME VARCHAR2 (20),
    END_TIME VARCHAR2 (20),
    TOTAL_HOURS NUMBER,
    RATE_PER_HOUR NUMBER,
    VEH_NUMBER VARCHAR2 (50),
    SLOT_ID NUMBER
);

CREATE TABLE slot
(
    slot_id           NUMBER PRIMARY KEY,
    slot_name         VARCHAR2 (30),
    slot_loc          VARCHAR2 (30),
    slot_floor        VARCHAR2 (20),
    booking_status    NUMBER
);

CREATE TABLE VEHICLE_INFO (
    VEH_ID NUMBER PRIMARY KEY,
    VEH_TYPE VARCHAR2 (50),
    RATE_PER_HOUR NUMBER
);

CREATE TABLE SHOP_RENT_MASTER (
    SHOP_RENT_MST_ID NUMBER PRIMARY KEY,
    COM_ID NUMBER,
    AGR_MST_ID NUMBER,
    SHOP_CAT_ID NUMBER,
    SHOP_NAME VARCHAR2 (100),
    OWNER VARCHAR2 (100),
    SHOP_ADDRESS VARCHAR2 (200),
    SHOP_FLOOR VARCHAR2 (50)
);

CREATE TABLE SHOP_RENT_DETAILS (
    SHOP_RENT_DTL_ID NUMBER PRIMARY KEY,
    SHOP_RENT_MST_ID NUMBER,
    SHOP_CAT_ID NUMBER,
    EMP_ID NUMBER,
    RENT_MONTH DATE,
    RENT_AMMOUNT NUMBER,
    DUE_RENT NUMBER,
    ISSUE_DATE DATE
);

CREATE TABLE SHOP_CATEGORY (
    SHOP_CAT_ID NUMBER PRIMARY KEY,
    SHOP_CAT_NAME VARCHAR2 (50),
    SHOP_ZONE VARCHAR2 (30),
    SHOP_FLOOR NUMBER,
    SHOP_NUMBER NUMBER,
    SHOP_SIZE VARCHAR2 (50),
    RENT_RATE NUMBER
);

CREATE TABLE OWNER_DETAILS
(
    OWNER_ID         NUMBER PRIMARY KEY,
    OWNER_NAME       VARCHAR2 (100),
    OWNER_ADDRESS    VARCHAR2 (300),
    OWNER_PHONE      VARCHAR2 (20),
    NID              NUMBER,
    SHOP_CAT_ID      NUMBER
);

CREATE TABLE AGREEMENT_MASTER (
    AGR_MST_ID NUMBER PRIMARY KEY,
    COM_ID NUMBER,
    AGR_TYPE VARCHAR2 (50),
    AGR_AMMOUNT NUMBER,
    AGR_WITH VARCHAR2 (50),
    SHOP_CAT_ID NUMBER
);

CREATE TABLE AGREEMENT_DETAILS (
    AGR_DTL_ID NUMBER PRIMARY KEY,
    AGR_MST_ID NUMBER,
    AGR_START_DATE DATE,
    AGR_END_DATE DATE,
    AGR_PERIOD VARCHAR2 (50),
    AGR_DOC CLOB,
    AGR_ADVANCE NUMBER,
    AGR_DUE NUMBER,
    EMP_ID NUMBER
);

ALTER TABLE EMPLOYEES_INFO ADD FOREIGN KEY (COM_ID) REFERENCES COMPANY (COM_ID);

ALTER TABLE PARKING_MASTER ADD FOREIGN KEY (COM_ID) REFERENCES COMPANY (COM_ID);

ALTER TABLE PARKING_DETAILS ADD FOREIGN KEY (PARK_MST_ID) REFERENCES PARKING_MASTER (PARK_MST_ID);

ALTER TABLE PARKING_DETAILS ADD FOREIGN KEY (VEH_ID) REFERENCES VEHICLE_INFO (VEH_ID);

ALTER TABLE PARKING_DETAILS ADD FOREIGN KEY (EMP_ID) REFERENCES EMPLOYEES_INFO (EMP_ID);

ALTER TABLE SHOP_RENT_MASTER ADD FOREIGN KEY (COM_ID) REFERENCES COMPANY (COM_ID);

ALTER TABLE SHOP_RENT_MASTER ADD FOREIGN KEY (AGR_MST_ID) REFERENCES AGREEMENT_MASTER (AGR_MST_ID);

ALTER TABLE SHOP_RENT_MASTER ADD FOREIGN KEY (SHOP_CAT_ID) REFERENCES SHOP_CATEGORY (SHOP_CAT_ID);

ALTER TABLE SHOP_RENT_DETAILS ADD FOREIGN KEY (SHOP_RENT_MST_ID) REFERENCES SHOP_RENT_MASTER (SHOP_RENT_MST_ID);

ALTER TABLE SHOP_RENT_DETAILS ADD FOREIGN KEY (SHOP_CAT_ID) REFERENCES SHOP_CATEGORY (SHOP_CAT_ID);

ALTER TABLE SHOP_RENT_DETAILS ADD FOREIGN KEY (EMP_ID) REFERENCES EMPLOYEES_INFO (EMP_ID);

ALTER TABLE AGREEMENT_MASTER ADD FOREIGN KEY (COM_ID) REFERENCES COMPANY (COM_ID);

ALTER TABLE AGREEMENT_MASTER ADD FOREIGN KEY (SHOP_CAT_ID) REFERENCES SHOP_CATEGORY (SHOP_CAT_ID);

ALTER TABLE AGREEMENT_DETAILS ADD FOREIGN KEY (AGR_MST_ID) REFERENCES AGREEMENT_MASTER (AGR_MST_ID);

ALTER TABLE AGREEMENT_DETAILS ADD FOREIGN KEY (EMP_ID) REFERENCES EMPLOYEES_INFO (EMP_ID);

ALTER TABLE parking_details ADD FOREIGN KEY (SLOT_ID) REFERENCES SLOT (SLOT_ID);

ALTER TABLE OWNER_DETAILS ADD FOREIGN KEY (SHOP_CAT_ID) REFERENCES shop_category (SHOP_CAT_ID);

COMMIT;

-- inserting 5 static data in employees_info table
INSERT INTO EMPLOYEES_INFO (
    EMP_ID,
    EMP_NAME,
    EMP_PHONE,
    EMP_ADDRESS,
    EMP_EMAIL,
    EMP_GENDER,
    EMP_JOB_TITLE,
    EMP_HIRE_DATE,
    EMP_STATUS,
    EMP_PASSWORD
) VALUES (
    1,
    'Imtiaz',
    '01671526039',
    'Airport, Dhaka',
    'imtiaz.shoykat@gmail.com',
    'Male',
    'Developer',
    SYSDATE,
    'Active',
    '0000'
);

INSERT INTO EMPLOYEES_INFO (
    EMP_ID,
    EMP_NAME,
    EMP_PHONE,
    EMP_ADDRESS,
    EMP_EMAIL,
    EMP_GENDER,
    EMP_JOB_TITLE,
    EMP_HIRE_DATE,
    EMP_STATUS,
    EMP_PASSWORD
) VALUES (
    2,
    'Inzam',
    '0177744947',
    'Mirpur, Dhaka',
    'inzam@gmail.com',
    'Male',
    'Developer',
    SYSDATE,
    'Active',
    '123'
);

INSERT INTO EMPLOYEES_INFO (
    EMP_ID,
    EMP_NAME,
    EMP_PHONE,
    EMP_ADDRESS,
    EMP_EMAIL,
    EMP_GENDER,
    EMP_JOB_TITLE,
    EMP_HIRE_DATE,
    EMP_STATUS,
    EMP_PASSWORD
) VALUES (
    3,
    'Imran',
    '01671690237',
    'Mirpur, Dhaka',
    'imran@gmail.com',
    'Male',
    'Developer',
    SYSDATE,
    'Active',
    '123'
);

INSERT INTO EMPLOYEES_INFO (
    EMP_ID,
    EMP_NAME,
    EMP_PHONE,
    EMP_ADDRESS,
    EMP_EMAIL,
    EMP_GENDER,
    EMP_JOB_TITLE,
    EMP_HIRE_DATE,
    EMP_STATUS,
    EMP_PASSWORD
) VALUES (
    4,
    'Habib',
    '01729932286',
    'Mirpur 1, Dhaka',
    'habib@gmail.com',
    'Male',
    'Developer',
    SYSDATE,
    'Active',
    '123'
);

INSERT INTO EMPLOYEES_INFO (
    EMP_ID,
    EMP_NAME,
    EMP_PHONE,
    EMP_ADDRESS,
    EMP_EMAIL,
    EMP_GENDER,
    EMP_JOB_TITLE,
    EMP_HIRE_DATE,
    EMP_STATUS,
    EMP_PASSWORD
) VALUES (
    5,
    'Shohel',
    '01628446667',
    'Mohammadpur, Dhaka',
    'sohel@gmail.com',
    'Male',
    'Developer',
    SYSDATE,
    'Active',
    '123'
);

-- inserting 1 company data into company table
INSERT INTO COMPANY (
    COM_ID,
    COM_NAME,
    COM_ADDRESS,
    COM_PHONE,
    COM_EMAIL,
    COM_WEB
) VALUES (
    1,
    'IDB Computer City',
    'Agargaon, Dhaka',
    '01700000000',
    'idb@gmail.com',
    'www.isdbw.com'
);

COMMIT;

INSERT INTO VEHICLE_INFO (VEH_ID, VEH_TYPE, RATE_PER_HOUR) VALUES (1,'BIKE',30);
INSERT INTO VEHICLE_INFO (VEH_ID, VEH_TYPE, RATE_PER_HOUR) VALUES (2,'CAR',50);
INSERT INTO VEHICLE_INFO (VEH_ID, VEH_TYPE, RATE_PER_HOUR) VALUES (3,'CYCLE',20);
INSERT INTO VEHICLE_INFO (VEH_ID, VEH_TYPE, RATE_PER_HOUR) VALUES (4,'MINI_BUS',80);
INSERT INTO VEHICLE_INFO (VEH_ID, VEH_TYPE, RATE_PER_HOUR) VALUES (5,'VAN',100);

COMMIT;



