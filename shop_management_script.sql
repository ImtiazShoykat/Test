
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