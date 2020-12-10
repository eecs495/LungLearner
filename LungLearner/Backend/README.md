# LungLearner Backend
This collection of backend files manages the databases, both local and remote,
that are used by the application.

## The Databases
Two databases are locally stored: The Case Database, and the User Database

### The Case Database
This is prepackaged with the application, and is stored in the Database directory.
This is an sqlite3 database that contains the details of every case provided to
us by the University of Michigan doctors. Each case has a unique ID, assigned to
it by us, and a unique caseID, assigned to it by the Doctors. These cases are
returnd to the frontend using the CaseDatabaseManager, found in
CaseDatabaseManager.swift, and are structured according to the data structures
found in CaseData.swift.

### The User Database
This is automatically generated on the first app startup, and it contains records
of the cases the user has completed, including whether the case was diagnosed
correctly, what steps the user took in diagnosing, and the date of diagnosis in
unix time. This database is also an sqlite3 databse.

Both of these local databases are controlled using the SQLite.swift library found
[here](https://github.com/stephencelis/SQLite.swift).

There are also two remote databases: The Remote Image Server and the Remote Leaderboard
Database

### The Remote Image Server
This is an Amazon S3 instance that contains the X-Ray images for all of the cases.
We originally planned to store the X-Rays locally, but at ~500KB per image, storing
1000 images on the user's device would not be practical. Since the images were
given to us raw, we had to compress the images using the compression technique
found [here](https://sempioneer.com/python-for-seo/how-to-compress-images-in-python/).
In brief, we used the python Image library to open the images then resave them
with the parametersoptimize=true and quality=30. The S3 instance is public, so
to access an X-Ray all you have to do is download from "https://lungxrays.s3.amazonaws.com/caseId.jpg",
where caseId is replaced with the caseId of the appropriate case.
