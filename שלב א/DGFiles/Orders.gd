
[General]
Version=1

[Preferences]
Username=
Password=2676
Database=
DateFormat=dd/mm/yyyy
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=TAMAR
Name=ORDERS
Count=400

[Record]
Name=OID
Type=NUMBER
Size=3
Data=Random(0, 999)
Master=

[Record]
Name=ORDERDATE
Type=DATE
Size=
Data=Random(1/1/2022, 1/6/2024)
Master=

[Record]
Name=RETURNDATE
Type=DATE
Size=
Data=Random(1/1/2022, 1/6/2024)
Master=

[Record]
Name=EID
Type=NUMBER
Size=3
Data=List(select EId from Employee)
Master=

[Record]
Name=DID
Type=NUMBER
Size=3
Data=List(select DId from Dress)
Master=

[Record]
Name=CID
Type=NUMBER
Size=3
Data=List(select CId from Customer)
Master=

