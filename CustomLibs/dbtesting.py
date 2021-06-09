import cx_Oracle
import os



os.environ['PATH'] = 'C:\\development\\instantclient-basiclite-windows.x64-19.8.0.0.0dbru\\instantclient_19_8'
dsn = cx_Oracle.makedsn(host='edb-dev.int.colorado.edu', port=1521, sid='eddev')
con = cx_Oracle.connect(user='ANAN4615', password='Colorado2020!', dsn=dsn)


print ("Connected!!")

cursor = con.cursor()
querystring = "select * from dirsvcs.DIR_PERSON where SID='000206000'"
cursor.execute(querystring)

print ("Success!!")

for row in cursor.fetchall():
      print(row)


con.close()