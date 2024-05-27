
[General]
Version=1

[Preferences]
Username=
Password=2415
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=TAMAR
Name=PAYMENT
Count=400

[Record]
Name=PID
Type=NUMBER
Size=3
Data=Random(0, 999)
Master=

[Record]
Name=PRICE
Type=NUMBER
Size=3
Data=Random(300, 5000)
Master=

[Record]
Name=ISPAID
Type=NUMBER
Size=3
Data=Random(0, 1)
Master=

[Record]
Name=FINEPRICE
Type=NUMBER
Size=3
Data=Random(0, 200)
Master=

[Record]
Name=OID
Type=NUMBER
Size=3
Data=List(select OId from Orders)
Master=

