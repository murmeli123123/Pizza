#this need put to main func

#elif action == "combine":
    # combFunc(input_command)



def combFunc(input_command):

    if len(input_command) >= 3:

        item_one = input_command[1].lower()
        item_two = input_command[len(input_command)-1].lower()
        # if len(input_command) >= 3:
    
        count = 0
        cur = db.cursor()
        sql = "SELECT name FROM item WHERE playerID = 1 and groupID > 0"
        cur.execute(sql)
        itemrez = cur.fetchall()
        for i in itemrez:

            if i[0] == item_one or i[0] == item_two:
                count = count + 1

        if count == 2:
            cur = db.cursor()
            sql = "SELECT groupID FROM item WHERE name = '%s' or name = '%s'" % (item_one, item_two)
            cur.execute(sql)
            result = cur.fetchall()

            if result[0][0] == result[1][0]:
                print(result[0][0])
                print(result[1][0])
                cur = db.cursor()
                sql = "UPDATE item SET playerID = NULL WHERE groupID = '%i'" % (result[0][0])
                cur.execute(sql)

                cur = db.cursor()
                sql =  "SELECT resultID FROM item WHERE groupID = '%i'" % (result[0][0])
                cur.execute(sql)
                groupid = cur.fetchall()

                cur = db.cursor()
                sql =  "SELECT resultID FROM itemGroup WHERE groupID = '%i'" % (result[0][0])
                cur.execute(sql)
                groupid = cur.fetchall()


                cur = db.cursor()
                sql = "UPDATE item SET playerID = 1 WHERE itemID = '%i'" % (groupid[0][0])
                cur.execute(sql)
                db.commit
            else:
                print("You can't do it! Try other items!")
        else:
            print("You dont have this item")

    else:
        print("What you want to combine? ")
