import csv

import cx_Oracle

connection = cx_Oracle.connect('Prac', '139', 'localhost/xe')
cursor = connection.cursor()
entities = ['Category', 'Country', 'City', 'Laureat']

for entity in entities:
    with open(entity + '.csv', 'w', newline='') as new_file:
        query = 'SELECT * FROM ' + entity
        cursor.execute(query)
        writer = csv.writer(new_file, delimiter=',')

        header = [i[0] for i in cursor.description]

        writer.writerow(header)

        row = cursor.fetchone()

        while row:
            writer.writerow(row)
            row = cursor.fetchone()
cursor.close()
connection.close()