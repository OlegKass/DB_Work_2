CREATE VIEW laureat_main_info AS
    SELECT
        laureat.laureat_id,
        laureat.reward_year,
        country.country_name,
        award_category.category_name
    FROM
        laureat
        INNER JOIN award_category on laureat.category_name = award_category.category_name
        INNER JOIN city ON laureat.city_of_birth = city.city_name
        INNER JOIN country on city.country_name = country.country_name;