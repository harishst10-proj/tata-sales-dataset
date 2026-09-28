
create database practical_sales_management;
use practical_sales_management;

create table productlines(
    productLine     varchar(30) primary key,
    textDescription text,
    htmlDescription varchar(50),
    image           mediumblob
);

create table products(
    productCode       varchar(30) primary key,
    productName       varchar(50),
    productLine       varchar(30),
    productScale      varchar(10),
    productVendor     varchar(40),
    productDescription varchar(100),
    quantityInStock   int,
    buyPrice          decimal(10,2),
    MSRP              decimal(10,2),
    foreign key (productLine) references productlines(productLine)
);

create table offices(
    officeCode   varchar(15) primary key,
    city         varchar(30),
    phone        varchar(15),
    addressLine1 varchar(40),
    addressLine2 varchar(40),
    state        varchar(30),
    country      varchar(30),
    postalCode   varchar(20),
    territory    varchar(20)
);

create table employees(
    employeeNumber int auto_increment primary key,
    lastName       varchar(20),
    firstName      varchar(20),
    extension      varchar(20),
    email          varchar(50),
    officeCode     varchar(15),
    reportsTo      int,
    jobTitle       varchar(50),
    foreign key (officeCode)  references offices(officeCode),
    foreign key (reportsTo)   references employees(employeeNumber)
);

create table customers(
    customerNumber        int auto_increment primary key,
    customerName          varchar(50),
    contactLastName       varchar(20),
    contactFirstName      varchar(20),
    phone                 varchar(15),
    addressLine1          varchar(40),
    addressLine2          varchar(40),
    city                  varchar(20),
    state                 varchar(30),
    postalCode            varchar(20),
    country               varchar(30),
    salesRepEmployeeNumber int,
    creditLimit           decimal(10,2),
    foreign key (salesRepEmployeeNumber) references employees(employeeNumber)
);

create table orders(
    orderNumber  int primary key,
    orderDate    date,
    requiredDate date,
    shippedDate  date,
    status       varchar(30),
    comments     varchar(150),
    customerNumber int,
    foreign key (customerNumber) references customers(customerNumber)
);

create table orderdetails(
    orderNumber     int,
    productCode     varchar(30),
    quantityOrdered int,
    priceEach       decimal(10,2),
    orderLineNumber int,
    primary key (orderNumber, productCode),
    foreign key (orderNumber)  references orders(orderNumber),
    foreign key (productCode)  references products(productCode)
);

create table payments(
    customerNumber int,
    checkNumber    varchar(20) primary key,
    paymentDate    date,
    amount         decimal(10,2),
    foreign key (customerNumber) references customers(customerNumber)
);

insert into productlines(productLine, textDescription, htmlDescription, image) values
('SUVs',           'Sports Utility Vehicles — rugged and family-oriented',          NULL, NULL),
('Sedans',         'Premium and executive sedan models',                             NULL, NULL),
('Hatchbacks',     'Compact city cars with fold-back rear section',                 NULL, NULL),
('Electric Vehicles','Zero-emission battery-powered cars under Tata EV lineup',     NULL, NULL),
('Trucks',         'Heavy and light commercial trucks for freight and logistics',    NULL, NULL),
('Buses',          'City and intercity passenger bus models',                        NULL, NULL),
('Pickup Trucks',  'Dual-purpose pickup trucks for personal and commercial use',     NULL, NULL);


insert into products(productCode, productName, productLine, productScale, productVendor, productDescription, quantityInStock, buyPrice, MSRP) values
('TM_NXP_001', 'Tata Nexon',           'SUVs',              '1:18', 'Tata Motors Ltd', 'Compact SUV with turbo petrol and diesel options',            320, 850000,  999000),
('TM_SAF_002', 'Tata Safari',          'SUVs',              '1:18', 'Tata Motors Ltd', '7-seater premium SUV with ADAS features',                     180, 1550000, 1799000),
('TM_HAR_003', 'Tata Harrier',         'SUVs',              '1:18', 'Tata Motors Ltd', 'Premium 5-seater SUV with panoramic sunroof',                 210, 1400000, 1650000),
('TM_PUN_004', 'Tata Punch',           'SUVs',              '1:24', 'Tata Motors Ltd', 'Micro SUV with 5-star NCAP safety rating',                    450, 620000,  749000),
('TM_TIG_005', 'Tata Tigor',           'Sedans',            '1:24', 'Tata Motors Ltd', 'Compact sedan with petrol and CNG variants',                  160, 700000,  849000),
('TM_TIA_006', 'Tata Tiago',           'Hatchbacks',        '1:24', 'Tata Motors Ltd', 'Entry-level hatchback with AMT option',                       380, 520000,  649000),
('TM_ALT_007', 'Tata Altroz',          'Hatchbacks',        '1:24', 'Tata Motors Ltd', 'Premium hatchback with turbo petrol engine',                  290, 700000,  849000),
('TM_NXP_EV8', 'Tata Nexon EV',        'Electric Vehicles', '1:18', 'Tata Motors Ltd', 'Best-selling EV in India with 465 km range',                  150, 1350000, 1599000),
('TM_TGO_EV9', 'Tata Tiago EV',        'Electric Vehicles', '1:24', 'Tata Motors Ltd', 'Most affordable EV hatchback in India',                       200, 820000,  999000),
('TM_CRV_E10', 'Tata Curvv EV',        'Electric Vehicles', '1:18', 'Tata Motors Ltd', 'Coupe-SUV EV with 585 km range',                              90,  1750000, 2099000),
('TM_PUN_E11', 'Tata Punch EV',        'Electric Vehicles', '1:24', 'Tata Motors Ltd', 'Electric Punch with 421 km range',                            130, 1050000, 1249000),
('TM_SIG_012', 'Tata Signa 4825',      'Trucks',            '1:32', 'Tata Motors Ltd', 'Heavy duty 12-wheel truck for long-haul freight',             55,  3200000, 3750000),
('TM_ULT_013', 'Tata Ultra 1412',      'Trucks',            '1:32', 'Tata Motors Ltd', 'Intermediate commercial truck for city logistics',            70,  1850000, 2100000),
('TM_ACE_014', 'Tata Ace Gold',        'Trucks',            '1:32', 'Tata Motors Ltd', 'Mini truck for last-mile delivery operations',                190, 580000,  699000),
('TM_YOD_015', 'Tata Yodha 2.0',       'Pickup Trucks',     '1:24', 'Tata Motors Ltd', 'Rugged double-cabin pickup for highways and farms',           110, 980000,  1150000),
('TM_INT_016', 'Tata Intra V50',       'Pickup Trucks',     '1:24', 'Tata Motors Ltd', 'Smart pickup truck with high payload capacity',               95,  780000,  920000),
('TM_STR_017', 'Tata Starbus 12m',     'Buses',             '1:50', 'Tata Motors Ltd', '12-metre city bus with CNG and diesel options',               30,  4500000, 5200000),
('TM_MRK_018', 'Tata Marcopolo Bus',   'Buses',             '1:50', 'Tata Motors Ltd', 'Intercity luxury coach with 45 seats',                        20,  6200000, 7100000),
('TM_EVB_019', 'Tata Starbus EV',      'Buses',             '1:50', 'Tata Motors Ltd', 'Electric city bus deployed across Indian metros',             18,  8500000, 9800000),
('TM_SFR_020', 'Tata Safari Dark Ed.', 'SUVs',              '1:18', 'Tata Motors Ltd', 'Limited edition Safari with blacked-out trims',               60,  1700000, 1999000);


insert into offices(officeCode, city, phone, addressLine1, addressLine2, state, country, postalCode, territory) values
('1',  'Mumbai',    '+91-22-66658888', 'Bombay House, Homi Mody Street', 'Fort',              'Maharashtra',  'India', '400001', 'West'),
('2',  'Chennai',   '+91-44-22501234', 'Jayalakshmi Towers, Anna Salai', 'Teynampet',         'Tamil Nadu',   'India', '600018', 'South'),
('3',  'Delhi',     '+91-11-46080000', 'DLF Cyber Hub, Phase 2',          'Gurugram',          'Delhi NCR',    'India', '122002', 'North'),
('4',  'Bangalore', '+91-80-40912345', 'Prestige Tech Park, Outer Ring Rd','Bellandur',        'Karnataka',    'India', '560103', 'South'),
('5',  'Hyderabad', '+91-40-44556677', 'Cyber Towers, Hitech City',       NULL,                'Telangana',    'India', '500081', 'South'),
('6',  'Kolkata',   '+91-33-22876543', 'PS Srijan Tech Park, New Town',   NULL,                'West Bengal',  'India', '700156', 'East'),
('7',  'Pune',      '+91-20-67891234', 'Magarpatta City, Hadapsar',       NULL,                'Maharashtra',  'India', '411013', 'West'),
('8',  'Ahmedabad', '+91-79-26301234', 'GIFT City, Gandhinagar',          NULL,                'Gujarat',      'India', '382355', 'West'),
('9',  'Lucknow',   '+91-52-22601234', 'Vibhuti Khand, Gomti Nagar',      NULL,                'Uttar Pradesh','India', '226010', 'North'),
('10', 'Kochi',     '+91-48-42301234', 'Infopark, Kakkanad',              NULL,                'Kerala',       'India', '682030', 'South');


insert into employees(lastName, firstName, extension, email, officeCode, reportsTo, jobTitle) values
('Menon',      'Rajesh',   'x001', 'rajesh.menon@tatamotors.com',    '1',  NULL, 'National Sales Head'),
('Sharma',     'Anil',     'x002', 'anil.sharma@tatamotors.com',     '3',  1,    'Zonal Manager - North'),
('Pillai',     'Suresh',   'x003', 'suresh.pillai@tatamotors.com',   '2',  1,    'Zonal Manager - South'),
('Desai',      'Riya',     'x004', 'riya.desai@tatamotors.com',      '1',  1,    'Zonal Manager - West'),
('Bose',       'Arjun',    'x005', 'arjun.bose@tatamotors.com',      '6',  1,    'Zonal Manager - East'),
('Kumar',      'Priya',    'x006', 'priya.kumar@tatamotors.com',     '2',  3,    'Sales Rep'),
('Iyer',       'Karthik',  'x007', 'karthik.iyer@tatamotors.com',   '4',  3,    'Sales Rep'),
('Reddy',      'Sneha',    'x008', 'sneha.reddy@tatamotors.com',     '5',  3,    'Sales Rep'),
('Joshi',      'Vikram',   'x009', 'vikram.joshi@tatamotors.com',    '7',  4,    'Sales Rep'),
('Nair',       'Divya',    'x010', 'divya.nair@tatamotors.com',      '10', 3,    'Sales Rep'),
('Chatterjee', 'Rohan',    'x011', 'rohan.chatterjee@tatamotors.com','6',  5,    'Sales Rep'),
('Gupta',      'Pooja',    'x012', 'pooja.gupta@tatamotors.com',     '3',  2,    'Sales Rep'),
('Singh',      'Manpreet', 'x013', 'manpreet.singh@tatamotors.com',  '9',  2,    'Sales Rep'),
('Verma',      'Rahul',    'x014', 'rahul.verma@tatamotors.com',     '3',  2,    'Sales Rep'),
('Patel',      'Nisha',    'x015', 'nisha.patel@tatamotors.com',     '8',  4,    'Sales Rep'),
('Rao',        'Sunil',    'x016', 'sunil.rao@tatamotors.com',       '5',  3,    'Sales Rep'),
('Das',        'Ankita',   'x017', 'ankita.das@tatamotors.com',      '6',  5,    'Sales Rep'),
('Mishra',     'Deepak',   'x018', 'deepak.mishra@tatamotors.com',   '9',  2,    'Sales Rep'),
('Shetty',     'Kavya',    'x019', 'kavya.shetty@tatamotors.com',    '4',  3,    'Sales Rep'),
('Kulkarni',   'Amit',     'x020', 'amit.kulkarni@tatamotors.com',   '7',  4,    'Sales Rep');


insert into customers(customerName, contactLastName, contactFirstName, phone, addressLine1, addressLine2, city, state, postalCode, country, salesRepEmployeeNumber, creditLimit) values
('Sharma Auto Dealers',     'Sharma',     'Rakesh',   '+91-9811001001', '12 Rohini Sector 7',     NULL,           'Delhi',       'Delhi NCR',     '110085', 'India', 12,  2500000),
('Chennai Motors Pvt Ltd',  'Krishnan',   'Venkat',   '+91-9444002002', '45 Anna Nagar West',     NULL,           'Chennai',     'Tamil Nadu',    '600040', 'India', 6,   3000000),
('Pune Auto Hub',           'Kulkarni',   'Ganesh',   '+91-9823003003', '88 FC Road',             'Shivajinagar', 'Pune',        'Maharashtra',   '411005', 'India', 9,   1800000),
('Mumbai Premier Cars',     'Shah',       'Nitin',    '+91-9820004004', '23 LBS Marg',            'Kurla',        'Mumbai',      'Maharashtra',   '400070', 'India', 9,   4000000),
('Kochi Wheels',            'Nambiar',    'Suresh',   '+91-9446005005', '67 MG Road',             NULL,           'Kochi',       'Kerala',        '682016', 'India', 10,  1500000),
('Hyderabad Car Zone',      'Reddy',      'Ravi',     '+91-9848006006', '34 Banjara Hills Rd 12', NULL,           'Hyderabad',   'Telangana',     '500034', 'India', 8,   2200000),
('Kolkata Auto Palace',     'Banerjee',   'Souvik',   '+91-9831007007', '19 Park Street',         NULL,           'Kolkata',     'West Bengal',   '700016', 'India', 11,  1900000),
('Ahmedabad Motors',        'Patel',      'Bhavesh',  '+91-9898008008', '56 CG Road',             'Navrangpura',  'Ahmedabad',   'Gujarat',       '380009', 'India', 15,  2700000),
('Lucknow Car Center',      'Verma',      'Anil',     '+91-9415009009', '78 Hazratganj',          NULL,           'Lucknow',     'Uttar Pradesh', '226001', 'India', 13,  1600000),
('Bangalore Drive In',      'Hegde',      'Prashanth','+91-9980010010', '101 Indiranagar 100ft Rd',NULL,          'Bangalore',   'Karnataka',     '560038', 'India', 7,   3500000),
('Nagpur Motors',           'Deshmukh',   'Sanjay',   '+91-9823011011', '33 Wardha Road',         NULL,           'Nagpur',      'Maharashtra',   '440015', 'India', 20,  1400000),
('Jaipur Auto World',       'Agarwal',    'Deepak',   '+91-9928012012', '25 Tonk Road',           'Durgapura',    'Jaipur',      'Rajasthan',     '302018', 'India', 14,  1750000),
('Chandigarh Cars',         'Gill',       'Harpreet', '+91-9815013013', '14 Sector 17',           NULL,           'Chandigarh',  'Punjab',        '160017', 'India', 13,  1300000),
('Coimbatore Wheels',       'Murugan',    'Selvam',   '+91-9842014014', '90 Avinashi Road',       NULL,           'Coimbatore',  'Tamil Nadu',    '641018', 'India', 6,   1200000),
('Bhopal Auto Mart',        'Tiwari',     'Ramesh',   '+91-9826015015', '55 MP Nagar Zone 2',     NULL,           'Bhopal',      'Madhya Pradesh','462011', 'India', 18,  1100000),
('Surat Motor Hub',         'Shah',       'Ketan',    '+91-9898016016', '77 Ring Road',           'Varachha',     'Surat',       'Gujarat',       '395006', 'India', 15,  2000000),
('Vizag Auto Gallery',      'Rao',        'Venkata',  '+91-9848017017', '28 Beach Road',          NULL,           'Visakhapatnam','Andhra Pradesh','530002', 'India', 16,  1650000),
('Indore Car Point',        'Goyal',      'Ashish',   '+91-9826018018', '42 Vijay Nagar',         NULL,           'Indore',      'Madhya Pradesh','452010', 'India', 18,  1450000),
('Patna Drive House',       'Kumar',      'Sanjiv',   '+91-9934019019', '18 Fraser Road',         NULL,           'Patna',       'Bihar',         '800001', 'India', 13,  950000),
('Guwahati Motors',         'Borah',      'Pranjal',  '+91-9435020020', '63 GS Road',             'Dispur',       'Guwahati',    'Assam',         '781006', 'India', 17,  880000);


insert into orders(orderNumber, orderDate, requiredDate, shippedDate, status, comments, customerNumber) values
(10001, '2025-01-05', '2025-01-20', '2025-01-17', 'Shipped',    'Delivered on time',                         1),
(10002, '2025-01-08', '2025-01-22', '2025-01-20', 'Shipped',    'Customer requested early delivery',         2),
(10003, '2025-01-12', '2025-01-28', NULL,          'In Process', NULL,                                        3),
(10004, '2025-01-15', '2025-01-30', '2025-01-28', 'Shipped',    'No issues',                                 4),
(10005, '2025-01-18', '2025-02-05', NULL,          'On Hold',    'Awaiting RTO clearance',                   5),
(10006, '2025-02-01', '2025-02-15', '2025-02-13', 'Shipped',    'Express delivery requested',               6),
(10007, '2025-02-05', '2025-02-20', '2025-02-18', 'Shipped',    'Fleet order for city cab operator',        7),
(10008, '2025-02-10', '2025-02-25', NULL,          'In Process', NULL,                                        8),
(10009, '2025-02-14', '2025-03-01', '2025-02-27', 'Shipped',    'Delivered ahead of schedule',              9),
(10010, '2025-02-18', '2025-03-05', '2025-03-03', 'Shipped',    'No issues',                                10),
(10011, '2025-03-01', '2025-03-15', NULL,          'Cancelled',  'Customer cancelled due to budget cut',    11),
(10012, '2025-03-05', '2025-03-20', '2025-03-18', 'Shipped',    'Partial delivery, balance pending',       12),
(10013, '2025-03-10', '2025-03-25', '2025-03-22', 'Shipped',    'EV charging setup confirmed by dealer',   13),
(10014, '2025-03-15', '2025-03-30', NULL,          'In Process', NULL,                                       14),
(10015, '2025-03-20', '2025-04-05', '2025-04-02', 'Shipped',    'No issues',                               15),
(10016, '2025-04-01', '2025-04-15', '2025-04-12', 'Shipped',    'Dealer requested additional accessories', 16),
(10017, '2025-04-05', '2025-04-20', NULL,          'On Hold',    'Finance approval pending at dealer end',  17),
(10018, '2025-04-10', '2025-04-25', '2025-04-23', 'Shipped',    'Delivered on time',                       18),
(10019, '2025-04-15', '2025-04-30', '2025-04-28', 'Shipped',    'Fleet order — 3 trucks',                  4),
(10020, '2025-05-01', '2025-05-15', '2025-05-13', 'Shipped',    'No issues',                               2),
(10021, '2025-05-05', '2025-05-20', NULL,          'In Process', NULL,                                       10),
(10022, '2025-05-10', '2025-05-25', '2025-05-22', 'Shipped',    'Customer picked up from depot',           19),
(10023, '2025-05-15', '2025-05-30', '2025-05-28', 'Shipped',    'No issues',                               20),
(10024, '2025-06-01', '2025-06-15', NULL,          'In Process', NULL,                                        1),
(10025, '2025-06-05', '2025-06-20', '2025-06-18', 'Shipped',    'EV fleet order for state transport corp', 6);


insert into orderdetails(orderNumber, productCode, quantityOrdered, priceEach, orderLineNumber) values
(10001, 'TM_NXP_001',  5,  999000,  1),
(10001, 'TM_TIA_006',  3,  649000,  2),
(10002, 'TM_SAF_002',  2,  1799000, 1),
(10002, 'TM_HAR_003',  2,  1650000, 2),
(10003, 'TM_PUN_004',  4,  749000,  1),
(10004, 'TM_NXP_EV8',  3,  1599000, 1),
(10004, 'TM_TGO_EV9',  2,  999000,  2),
(10005, 'TM_ALT_007',  2,  849000,  1),
(10006, 'TM_HAR_003',  1,  1650000, 1),
(10006, 'TM_NXP_001',  2,  999000,  2),
(10007, 'TM_ACE_014',  6,  699000,  1),
(10007, 'TM_ULT_013',  2,  2100000, 2),
(10008, 'TM_SFR_020',  1,  1999000, 1),
(10009, 'TM_TIG_005',  3,  849000,  1),
(10010, 'TM_NXP_EV8',  4,  1599000, 1),
(10010, 'TM_PUN_E11',  2,  1249000, 2),
(10011, 'TM_SIG_012',  2,  3750000, 1),
(10012, 'TM_YOD_015',  3,  1150000, 1),
(10013, 'TM_TGO_EV9',  5,  999000,  1),
(10014, 'TM_PUN_004',  6,  749000,  1),
(10015, 'TM_ACE_014', 10,  699000,  1),
(10016, 'TM_NXP_001',  4,  999000,  1),
(10016, 'TM_ALT_007',  2,  849000,  2),
(10017, 'TM_HAR_003',  2,  1650000, 1),
(10018, 'TM_TIA_006',  5,  649000,  1),
(10018, 'TM_TIG_005',  3,  849000,  2),
(10019, 'TM_SIG_012',  3,  3750000, 1),
(10020, 'TM_SAF_002',  1,  1799000, 1),
(10021, 'TM_CRV_E10',  2,  2099000, 1),
(10022, 'TM_INT_016',  4,  920000,  1),
(10023, 'TM_NXP_EV8',  2,  1599000, 1),
(10024, 'TM_PUN_004',  8,  749000,  1),
(10025, 'TM_EVB_019',  3,  9800000, 1);


insert into payments(customerNumber, checkNumber, paymentDate, amount) values
(1,  'CHK2001', '2025-01-20', 8245000),
(2,  'CHK2002', '2025-01-25', 6898000),
(3,  'CHK2003', '2025-02-01', 2996000),
(4,  'CHK2004', '2025-02-05', 4797000),
(5,  'CHK2005', '2025-02-10', 1698000),
(6,  'CHK2006', '2025-02-18', 3648000),
(7,  'CHK2007', '2025-02-25', 8394000),
(8,  'CHK2008', '2025-03-05', 1999000),
(9,  'CHK2009', '2025-03-02', 2547000),
(10, 'CHK2010', '2025-03-08', 8894000),
(12, 'CHK2011', '2025-03-22', 3450000),
(13, 'CHK2012', '2025-03-26', 4995000),
(15, 'CHK2013', '2025-04-06', 6990000),
(16, 'CHK2014', '2025-04-16', 5994000),
(18, 'CHK2015', '2025-04-27', 5742000),
(4,  'CHK2016', '2025-05-02', 11250000),
(2,  'CHK2017', '2025-05-16', 1799000),
(19, 'CHK2018', '2025-05-26', 3680000),
(20, 'CHK2019', '2025-05-30', 3198000),
(6,  'CHK2020', '2025-06-20', 29400000);

-- 1st statement Total Number of customers

select count(*)
from customers;

-- 2nd statement maximum amount of sales

Select max(quantityOrdered)
from orderdetails;

-- 3rd statement minimum amount of sales

select min(quantityOrdered)
from orderdetails;

-- 4th statement total amount of sales

select sum(quantityOrdered)
from orderdetails;

-- 5th statement average amount involved in sales

select avg(amount)
from payments;

-- 6th statement products that are in more quantity

select count(*) 
from products
where quantityInStock > 100;

-- 7th statement maximum buyprice is denoted

select max(buyPrice)
from products
where quantityInStock > 150;

-- 8th statement counting the total of products

select count(*) 
as total_products
from products
where quantityInStock > 150;

-- 9th statement showing average price of products

select avg(buyPrice) 
as Average_BuyPrice
from products;

-- 10th statement showing the grouped data from productLine

select count(*) as total_productLine
from products 
group by productLine;
 
 -- 11th statement showing maximum in productLine

select max(1) as maximum_in_productLine
from products
group by productLine;

 -- 12th statement showing 2 group by functions
 
select customerNumber, sum(amount) 
as total_sold
from payments 
group by customerNumber;

-- 13th and 14th statement showing subquery 

select customerNumber, amount 
from payments
where amount = (
	select max(amount)
    from payments
);

select customerName 
from customers
where customerNumber in (
	select customerNumber
    from orders
);

-- join functions
-- 1. inner join
-- keeps only the common data

select 
	customers.customerName,
	orders.orderNumber
from customers
inner join orders 
	on customers.customerNumber = orders.customerNumber;
    
-- 2. left join 
-- match both table and keeps everything from left table 

select 
    customers.customerName,
    orders.orderNumber
from customers
left join orders
    on customers.customerNumber = orders.customerNumber;

-- 3. right join
-- match both table and keeps everything from rght table

select 
    customers.customerName,
    orders.orderNumber
from customers
right join orders
    on customers.customerNumber = orders.customerNumber;

-- 4. full outer join
-- display everything from both the table

select 
    customers.customerName,
    orders.orderNumber
from customers
left join orders
    on customers.customerNumber = orders.customerNumber

union

select 
    customers.customerName,
    orders.orderNumber
from customers
right join orders
    on customers.customerNumber = orders.customerNumber;

-- 5. cross join
-- shows every combination of the tables

select
    customers.customerName,
    productlines.productLine
from customers
cross join productlines;

-- 6. self join
-- shows which manager the respective employee has to report

select
    employee.firstName as Employee,
    employee.lastName as Employee_LastName,
    manager.firstName as Manager,
    manager.lastName as Manager_LastName
from employees as employee
left join employees as manager
    on employee.reportsTo = manager.employeeNumber;
    
-- window functions
-- rank function

select	
    productName,
    MSRP,
    rank() over (order by MSRP desc) as price_rank
from products;

-- dense rank function

select
    productName,
    productLine,
    buyPrice,
    dense_rank() over (
        partition by productLine
        order by buyPrice desc
    ) as price_rank
from products;

-- sum and over function together

select
    orderNumber,
    productCode,
    quantityOrdered,
    sum(quantityOrdered) over (
        order by orderNumber
    ) as running_total
from orderdetails;

-- avg and over function together

select
    productName,
    productLine,
    buyPrice,
    avg(buyPrice) over (
        partition by productLine
    ) as average_productline_price
from products;

-- lag and over

select
    orderNumber,
    quantityOrdered,
    lag(quantityOrdered) over (
        order by orderNumber
    ) as previous_quantity
from orderdetails;

-- procedures

delimiter //

create procedure show_all_products()
begin
    select
        productCode,
        productName,
        productLine,
        quantityInStock,
        buyPrice,
        MSRP
    from products;
end //

delimiter ;

call show_all_products(); 


--

delimiter //

create procedure products_above_stock(in minimum_stock int)
begin
    select
        productCode,
        productName,
        productLine,
        quantityInStock
    from products
    where quantityInStock > minimum_stock;
end //

delimiter ;

call products_above_stock(100); 

--

delimiter //

create procedure customer_orders(in cust_id int)
begin
    select
        customers.customerNumber,
        customers.customerName,
        orders.orderNumber,
        orders.orderDate,
        orders.status
    from customers
    inner join orders
        on customers.customerNumber = orders.customerNumber
    where customers.customerNumber = cust_id;
end //

delimiter ;
  
call customer_orders(5);


    