# CEG-CMS
## _DBMS - CS6106 - PROJECT `2020-21`_

### Developed by-
- <a target='_blank' href='https://github.com/bmspr1502/'>Pranava Raman B M S</a> - `2019103555`
- <a target='_blank' href='https://github.com/DHEEPAKRAAJ123/'>Dheepak Raaj R</a> - `2019103516`
- <a target='_blank' href='https://github.com/Sugavanesh10/'>Sugavaneshwaran K</a> - `2019103585`

# How to use the app

- Install XAMPP and start Apache and MySQL server from XAMPP Control Panel
- Clone the repository inside your `xampp/htdocs/` folder
- Create a database `cmsproj` inside the phpMyAdmin of your localhost
- Import the latest `cmsproj.sql` file from the repository to the database
- Goto [http://localhost/dbmsproject/](http://localhost/dbmsproject/)

## Views

1. STUDENT
2. PROFESSOR
3. ADMIN

### 1. STUDENT

* view student details
* view all available courses:
  -  course details
  -  study materials uploaded by the professor
  -  notifications from the professor
  -  participate in discussion with fellow students and professor
* view admin notification
* send request for updation of details

### 2. PROFESSOR:-

* view courses details they are taking
  - enrolled student detials
  - send study materials ( files, youtube video, website link, html code)
  - send course notifications
  - Participate in discussions with the students
* view professor details
* view admin notifications

### 3. ADMIN

* create, update and delete students, professors
* send overall notification, specific notification to professors
* create and delete courses and assign professor


## Tables Used

* STUDENT_DETAILS (ALL DETAILS OF STUDENTS)
* STUDENT_COURSES (MAPPING BETWEEN STUDENTS AND COURSES (WHICH STUDENT ENROLLED TO WHICH COURSE))
* PROF_DETAILS  (ALL DETAILS OF PROFESSORS)
* COURSE_DETAILS (ALL COURSE NAMES AND ASSIGNED PROFESSOR)
* COURSE_DATA (ALL STUDY MATERIALS OF EACH COURSES)
* COURSE_NOTIFICATIONS (ALL NOTIFICATIONS OF EACH COURSE)
* COURSE_FORUM_QN (QUESTIONS ASKED IN COURSE DISCUSSION PAGE)
* COURSE_FORUM_ANS (ANSWER OF EACH QUESTION ANSWERED IN THE COURSE DISCUSSION PAGE)
* ADMIN_NOTIFICATION (ALL NOTIFICATIONS SENT BY ADMIN)
* STUDENT_UPDATE  (ALL REQUEST SENT FROM STUDENT TO ADMIN)
* ADMIN_LOGIN  (ADMIN LOGIN CREDENTIALS)S)
