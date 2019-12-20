import pymysql

class Database:
    def __init__(self):
        host = "127.0.0.1"
        user = "root"
        password = ""
        db = "proyecto01_tp"
        self.con = pymysql.connect(host=host, user=user, password=password, db=db, cursorclass=pymysql.cursors.
                                   DictCursor)
        self.cur = self.con.cursor()

    def test(self):
        self.cur.execute("SELECT id, name FROM test")
        result = self.cur.fetchall()
        return result

    def getHeuristics(self):
        self.cur.execute("SELECT * FROM heuristics")
        return self.cur.fetchall()

    def getFunctions(self):
        self.cur.execute("SELECT * FROM functions")
        return self.cur.fetchall()

    def getFunctionDetails(self, id):
        self.cur.execute("SELECT * FROM functions WHERE id="+str(id))
        return self.cur.fetchall()
