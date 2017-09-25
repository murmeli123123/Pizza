def dropFunc(target):
    item = 0
    cur = db.cursor()
    sql = "SELECT name FROM Item"
    cur.execute(sql)
    rez = cur.fetchall()
    for i in rez:
        if i[0] == target:
            item = 1


    cur = db.cursor()
    sql = "SELECT itemID FROM Item WHERE name = '%s' " % (target)
    cur.execute(sql)
    rez = cur.fetchall()

    cur = db.cursor()
    sql = "SELECT playerID FROM Item WHERE name = '%s' " % (target)
    cur.execute(sql)
    playerid = cur.fetchall()


    if item == 1:
        if playerid[0][0] == 1: 
            cur = db.cursor()
            sql = "UPDATE item SET playerID = NULL WHERE itemID = '%i'  " % (rez[0][0])
            cur.execute(sql)
            db.commit()
            print ("You droped item: " + target)
        else:
            print("You just droped it")
        
    else:
      print("Item not found")
