import mysql.connector

db = mysql.connector.connect(host = "localhost",
                              user = "dbuser",
                              passwd = "salasana",
                              db = "pizzaDB",
                              buffered = True)
cursor = db.cursor()

def inventory():
    sql = "SELECT item.name \
            FROM item INNER JOIN player \
            ON item.playerID = player.playerID"
    cursor.execute(sql)
    carrying = cursor.fetchall()
    return carrying

command = ''
while command != 'stop':
    command = input("What to do next: ").split(' ')
    if command[0].upper() == 'INVENTORY' or "I":
        carrying = inventory()
        if not carrying:
            print("Jack is not carrying anything. ")
        else:
            print("Jack is carrying: ")
            for x in carrying:
                print(x[0])
