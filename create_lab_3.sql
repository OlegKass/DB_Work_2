Drop Table Laureat;
Drop Table Award_category;
Drop Table City;
Drop Table Country;

CREATE TABLE Country(
    Country_name VARCHAR(14)
    );

ALTER TABLE Country ADD CONSTRAINT Country_name_pk PRIMARY KEY ( Country_name );


CREATE TABLE city (
    city_name     VARCHAR2(14) NOT NULL,
    country_name  VARCHAR2(14) NOT NULL
);
    
ALTER TABLE City ADD CONSTRAINT City_name_pk PRIMARY KEY ( City_name );

ALTER TABLE City
    ADD CONSTRAINT city_country_fk FOREIGN KEY ( country_name )
        REFERENCES country ( country_name );



CREATE TABLE Award_category (
    category_name VARCHAR2(14) NOT NULL
);

ALTER TABLE Award_category ADD CONSTRAINT award_category_pk PRIMARY KEY ( category_name );


Create Table Laureat(
    Laureat_id    NUMBER(20) NOT NULL,
    Full_name     VARCHAR(63) NOT NULL,
    Sex           VARCHAR(14) NOT NULL,
    Reward_year   NUMBER(38) NOT NULL,
    Category_name VARCHAR(63) NOT NULL,
    City_of_birth VARCHAR(63) NOT NULL,
    City_of_death VARCHAR(63) NOT NULL,
    City_of_org   VARCHAR(63) NOT NULL,
    Birth_date    Date NOT NULL,
    Death_date    Date NOT NULL
);


ALTER TABLE laureat ADD CONSTRAINT laureat_pk PRIMARY KEY ( laureat_id );

ALTER TABLE laureat
    ADD CONSTRAINT laureat_category_fk FOREIGN KEY ( category_name )
        REFERENCES Award_category ( category_name );

ALTER TABLE laureat
    ADD CONSTRAINT laureat_city_birth_fk FOREIGN KEY ( City_of_birth )
        REFERENCES city ( city_name );
        
ALTER TABLE laureat
    ADD CONSTRAINT laureat_city_death_fk FOREIGN KEY ( City_of_death )
        REFERENCES city ( city_name );
        
ALTER TABLE laureat
    ADD CONSTRAINT laureat_city_org_fk FOREIGN KEY ( City_of_org )
        REFERENCES city ( city_name );
        

