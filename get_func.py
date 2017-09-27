# if action == "get":    
#       if target!="": 
#             getFunc(target)
#        else:
#           print("It's just a verb!, Try again!")



def getFunc(target):
    item = 0
    cur = db.cursor()
    sql = "SELECT name FROM Item"
    cur.execute(sql)
    rez = cur.fetchall()
    for i in rez:
        if i[0] == target:
            item = 1

    # Place id where item is
    cur = db.cursor()  
    sql = "SELECT placeID FROM object, item WHERE item.objectID = object.objectID \
    AND item.name = '%s';" % (target)
    cur.execute(sql)
    item_place_id = cur.fetchall()

    # Place id where player is
    cur = db.cursor()
    sql = "SELECT placeID FROM player"
    cur.execute(sql)
    player_place_id = cur.fetchall()



    cur = db.cursor()
    sql = "SELECT itemID FROM Item WHERE name = '%s' " % (target)
    cur.execute(sql)
    rez = cur.fetchall()

    cur = db.cursor()
    sql = "SELECT playerID FROM Item WHERE name = '%s' " % (target)
    cur.execute(sql)
    playerid = cur.fetchall()



    if item == 1:
        if item_place_id[0][0] == player_place_id[0][0]:
            if playerid[0][0] != 1: 
                  cur = db.cursor()
                  sql = "UPDATE item SET playerID = 1 WHERE itemID = '%i'  " % (rez[0][0])
                  cur.execute(sql)
                  db.commit()
                  print ("You take a new item: " + target)
            else:
              print("Item in your inventory! ")
        else:
            print("Place dont contain this item!")
    else:
        print("Item not found")
    

