SET SERVEROUTPUT ON

BEGIN
    FOR i IN 1..15 LOOP
        INSERT INTO award_category ( category_name ) VALUES ( 'category_name_' || i );

        INSERT INTO country ( country_name ) VALUES ( 'country_name_' || i );

        INSERT INTO city (
            city_name,
            country_name
        ) VALUES (
            'city_name_' || i,
            'country_name_' || i
        );

        INSERT INTO laureat (
            laureat_id,
            full_name,
            sex,
            reward_year,
            category_name,
            city_of_birth,
            city_of_death,
            city_of_org
        ) VALUES (
            i,
            'full_name_' || i,
            'sex_' || i,
            i,
            'category_name_' || i,
            'city_name_' || i,
            'city_name_' || i,
            'city_name_' || i
        );

    END LOOP;
END;

