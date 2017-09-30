#made by Andrei
#drop function
def dropfunc(target):
    cur.execute("SELECT name FROM item WHERE playerID = 1;")
    all_items = cur.fetchall()
    item_list = []
    for i in all_items:
        item_list.append(*i)

    cur.execute("SELECT name FROM item WHERE playerID = 1;")


    if target in item_list:
        cur.execute("SELECT itemID FROM item WHERE name = '%s';" % (target))
        item_name = cur.fetchall()[0][0]
        cur.execute("UPDATE item SET playerID = NULL WHERE itemID = '%i'  " % (item_name))
        print("You dropped " + target)
    else:
        print("Item not found in your inventary!")
