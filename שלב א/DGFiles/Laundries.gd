
[General]
Version=1

[Preferences]
Username=
Password=2074
Database=
DateFormat=dd/mm/yyyy
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=TAMAR
Name=LAUNDRY
Count=400

[Record]
Name=LID
Type=NUMBER
Size=3
Data=Random(0, 999)
Master=

[Record]
Name=COST
Type=NUMBER
Size=3
Data=Random(50, 350)
Master=

[Record]
Name=LNAME
Type=VARCHAR2
Size=15
Data=Company
Master=

[Record]
Name=PICKINGDATE
Type=DATE
Size=
Data=Random(1/1/2022,1/6/2024)
Master=

[Record]
Name=OID
Type=NUMBER
Size=3
Data=List(select OId from Orders)
Master=

