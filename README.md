# Lung Learner

Lung Learner is a fun, competitive application for medical students and physicians to practice their diagnostic abilities on-the-go. Using real data from patients who experienced respiratory failure, this application presents users with a case's information, records their diagnostic attempt, and responds with the correct expert explanation. Accuracy streaks, reminder notifications, and competitive leaderboards will incentivize both medical students and physicians to keep playing day after day, staying engaged to steadily improve  their patient-saving skills. Don't miss out on Lung Learner, the newest innovation in medical education!

## Setup Instructions

To run Lung Learner, simply clone this repository with the command: `git clone git@github.com:eecs495/LungLearner.git`. Once cloned, open `LungLearner.xcodeproj` in Xcode and run the application by either selecting the play button in the top-left corner or navigating to *Product > Run* in the tool bar. This will launch a simulator on the default device (an iPod touch 7th generation on most laptops). After a moment, the application will open and the main menu will appear. You might see a white screen for about one minute before anything shows up. 

## Code Strucutre

This project is divided into two subteams: frontend and backend. The code for both implementations is contained within this repository.

### Frontend

The frontend code is mainly located in the *LungLearner > Views* folder. The *Components* folder contains subviews that are used across multiple parent views, and the other files represent individual screens. The *Categories* folder contains the sequence of screens used to present the data for a new case in sequence. The last screen in this sequence, `XRay.swift`, leads to `ReviewCase.swift`, `DiagnoseCase.swift`, and then `Incorr.swift`. This sequence is accessed from `MainMenu.swift`, which also connects to `ReviewList.swift`. Lastly, `ReviewList.swift` can optionally navigate to `ReviewCase.swift` to view the data for an individual case. These frontend files connect to the backend database of cases through a `CaseDatabaseManager` variable during the application's initialization. This implementation can be found in `LungLearnerApp.swift`, the application's entry point.

### Backend

The backend code structure is rather straightforward. All current backend code
is contained in the *LungLearner > Backend* folder. `CaseDatabaseManager.swift`
contains code for acessing the preloaded SQLite case database using a class
wrapper. We experimented with a class wrapper structure in an attempt to
increase efficiency by reducing the number of database connections.
`CaseData.swift` contains the code for converting between SQLite rows and our
internal case data structures, as well as a function to provide dummy testing
data. `UserData.swift` contains the code for generating, modifying, and accessing the
locally stored per-user data, including case completion history and correctness
statistics. The preloaded database is contained under *LungLearner > Database >
CaseDb.sqlite3*. While the database only holds one entry as of yet, all current
code is set up to work with an arbitratily sized database.
