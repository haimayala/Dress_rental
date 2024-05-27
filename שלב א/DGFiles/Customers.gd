
[General]
Version=1

[Preferences]
Username=
Password=2250
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=TAMAR
Name=CUSTOMER
Count=400

[Record]
Name=CID
Type=NUMBER
Size=3
Data=Random(0, 999)
Master=

[Record]
Name=CNAME
Type=VARCHAR2
Size=15
Data=FirstName '-'  LastName
Master=

[Record]
Name=CEMAIL
Type=VARCHAR2
Size=15
Data=Email
Master=

[Record]
Name=CPHONE
Type=VARCHAR2
Size=15
Data=Random(0500000000, 0599999999)
Master=

