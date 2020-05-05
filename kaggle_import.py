import csv
import cx_Oracle
file = open('archive.csv')
connection = cx_Oracle.connect('Prac', '139', 'localhost/xe')

cursor = connection.cursor()
data = csv.reader(file, delimiter=',')

query = "Select * from Laureat"

cursor.execute(query)
for row in cursor:
    print(row)


Countries = []
Cities = []
Categories = []
IDs = []

point = 1

try:
    for row in data:

        reward_year = row[0]
        category_name = row[1]
        laureat_id = row[5]
        full_name = row[7]
        city_of_birth = row[9]
        birth_country = row[10]
        if point == 1000:
            break


        if birth_country not in Countries:
            if not birth_country:
                birth_country = "No data"
            Countries.append(birth_country)

            query = "INSERT INTO country ( country_name ) VALUES ( :country_name )"
            cursor.execute(query, country_name = birth_country )


        if category_name not in Categories:
            if not category_name:
                category_name = "No data"
            Categories.append(category_name)

            query = "INSERT INTO award_category ( category_name ) VALUES ( :category_name )"
            cursor.execute(query, category_name = category_name )

        if city_of_birth not in Cities:
            if not city_of_birth:
                city_of_birth = "No data"
            Cities.append(city_of_birth)

            query = "INSERT INTO city ( city_name , country_name ) VALUES ( :city_name, :country_name )"
            cursor.execute(query, city_name = city_of_birth,  country_name = birth_country )

        if not full_name:
            full_name = 'No data'
        if not reward_year:
            reward_year = 0
        if laureat_id not in IDs:
            IDs.append(laureat_id)
            query = """
                INSERT INTO laureat (
                                laureat_id,
                                full_name,
                                reward_year,
                                category_name,
                                city_of_birth
                            ) VALUES (
                                :laureat_id,
                                :full_name,
                                :reward_year,
                                :category_name,
                                :city_of_birth
                            )
                """
            cursor.execute(query, laureat_id=laureat_id, full_name=full_name,
                       reward_year=reward_year, category_name=category_name,
                       city_of_birth=city_of_birth)
        point += 1
except:
    print(f' Line -  {point}')
    raise

cursor.close()
connection.commit()