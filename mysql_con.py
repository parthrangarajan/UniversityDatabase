#Source code for University Database Frontend Connection.

#Importing the connector.
import mysql.connector

#Importing Error from connector which helps in identifing if any error happens.
from mysql.connector import Error

#Initialization of connection.
unidb = mysql.connector.connect(host="localhost",user="root",passwd="yamara272520sh04",database="unidb")

#Initialization of cursor.
mycursor = unidb.cursor()

#Function to Display all tables.
def displaytables():
	print("""
	
1:centerofexcellence.
2:class.
3:coemembers.
4:competed_projects.
5:courses.
6:department.
7:examgiven.
8:exams.
9:projects.
10:promembers.
11:retired.
12:staff.
13:students.
14:studiesin.
15:subjects.
16:subjecttaught.

""")

#Function to Display Views.
def displayviews():
	print("""
	
1:coe_n_members.
2:project_n_members.
3:staff_and_subjectcount.
4:staff_of_administration_dept.
5:teachers_of_fine_arts.
6:teachers_of_management_and_finance.
7:teachers_of_science_and_technology.

""")

#Function to Display Functions.
def displayfunctions():
	print("""
	
1:overall_grade.
2:staffcount_in_dept.
3:studentcount_in_class.


""")

#Function to Display Procedures.
def displayprocedures():
	print("""
	
1:classstud.
2:staffdept.
3:staffteaches.


""")

#Function to Describe Tables.
def describe(s):
	try:
		mycursor.execute(f"describe {s}")
		print("\n\n")
		for i in mycursor:
			print(i)
		print("\n\n")
	except Error as e:
		print("Error occured ",e)

#Function to Display all Rows of a Table.
def selectall(s):
	try:
		mycursor.execute(f"select * from {s}")
		print("\n\n")
		print(mycursor.column_names)
		for i in mycursor:
			print(i)
		print("\n\n")
	except Error as e:
		print("Error occured ",e)

#Function to Write a Custom Query.
def customquery():
	print("Custom Query")
	print("Select a Table:")
	displaytables()
	table = input("Enter table name:")
	describe(table)
	coloumn = ""
	i = input("Enter coloum(s):")
	coloumn = coloumn + i
	while True:
		i = input("Enter coloum(s) or '/' to complete the query:")
		if i == '/':
			break 
		else:
	 		coloumn = coloumn + "," + i
	print("\n\n")
	while True:
		w = input("Add a where clause?(Y/N):")
		if w not in ["Y","y","N","n"]:
			print("Please enter a valid choice.")
			continue
		break
	if w in ["N","n"]:
		try:
			mycursor.execute(f"select {coloumn} from {table}")
			print(mycursor.column_names)
			for i in mycursor:
				print(i)
		except Error as e:
			print("Error occured ",e)
	else:
		describe(table)
		w = input("Enter coloum to apply condition on:")
		d = input("Enter data for condition:")
		try:
			mycursor.execute(f"select {coloumn} from {table} where {w} = {d}")
			print("\n\n")
			print(mycursor.column_names)
			for i in mycursor:
				print(i)
		except Error as e:
			print("Error occured ",e)

#Function to Execute a Function.
def execute_function(s,d):
	try:
		mycursor.execute(f"select {s}({d})")
		print("\n\n")
		for i in mycursor:
			print(i)
		print("\n\n")
	except Error as e:
		print("Error occured ",e)

#Function to Execute a Procedure.
def execute_procedure(s,d):
	try:
		mycursor.execute(f"call {s}({d})")
		print("\n\n")
		print(mycursor.column_names)
		for i in mycursor:
			print(i)
		print("\n\n")
	except Error as e:
		print("Error occured ",e)

#Function to Insert into centerofexcellence Table.
def insert_into_centerofexcellence():
	describe("centerofexcellence")
	id = input("Enter ID:")
	name = input("Enter Name:")
	selectall("staff")
	cooid = input("Enter coordinatorID from above table:")
	try:
		mycursor.execute(f'insert into centerofexcellence values({id},"{name}",{cooid})')
		unidb.commit()
	except Error as e:
		print("Error occured,",e)

#Function to Insert into class Table.
def insert_into_class():
	describe("class")
	id = input("Enter ID:")
	name = input("Enter Name:")
	selectall("courses")
	courseid = input("Enter courseID from above table:")
	selectall("staff")
	classteacherid = input("Enter class teacher id from above table:")
	sem = input("Enter Semister:")
	div = input("Enter Division:")
	year = input("Enter Year:")
	try:
		mycursor.execute(f'insert into class values({id},"{name}","{courseid}",{classteacherid},{sem},"{div}",{year})')
		unidb.commit()
	except Error as e:
		print("Error occured,",e)

#Function to Insert into coemembers Table.
def insert_into_coemembers():
	describe("coemembers")
	id = input("Enter coeID:")
	memid = input("Enter memID:")
	try:
		mycursor.execute(f"insert into coemembers values({id},{memid})")
		unidb.commit()
	except Error as e:
		print("Error occured,",e)

#Function to Insert into courses Table.
def insert_into_courses():
	describe("courses")
	id = input("Enter ID:")
	name = input("Enter Name:")
	selectall("department")
	depid = input("Enter DepartmentID from above table:")
	selectall("staff")
	courseheadid = input("Enter coursehead id from above table:")
	try:
		mycursor.execute(f'insert into courses values("{id}","{name}",{depid},{courseheadid})')
		unidb.commit()
	except Error as e:
		print("Error occured,",e)

#Function to Insert into department Table.
def insert_into_department():
	describe("department")
	id = input("Enter ID:")
	name = input("Enter Name:")
	selectall("staff")
	deptheadid = input("Enter departmenthead ID from above table:")
	try:
		mycursor.execute(f'insert into department values({id},"{name}",{deptheadid})')
		unidb.commit()
	except Error as e:
		print("Error occured,",e)

#Function to Insert into examgiven Table.
def insert_into_examgiven():
	describe("examgiven")
	selectall("students")
	stuid = input("Enter StudentID from above table:") 
	selectall("exams")
	examid = input("Enter exam ID from above table:")
	marks = input("Enter marks obtained:")
	try:
		mycursor.execute(f'insert into examgiven values({stuid},{examid},{marks},NULL)')
		unidb.commit()
	except Error as e:
		print("Error occured,",e)

#Function to Insert into exams Table.
def insert_into_exams():
	describe("exams")
	examid = input("Enter examID:")
	selectall("subjects")
	subid = input("Enter SubjectID from above table:")
	date = input("Enter date of exam as (yyyy-mm-dd):")
	typ = input("Enter the type of exam:")
	total = input("Enter total marks:")
	try:
		mycursor.execute(f'insert into exams values({examid},"{subid}","{date}","{typ}",{total})')
		unidb.commit()
	except Error as e:
		print("Error occured,",e)

#Function to Insert into projects Table.
def insert_into_projects():
	describe("projects")
	id = input("Enter ID:")
	topic = input("Enter Topic:")
	selectall("centerofexcellence")
	coeid = input("Enter coeID from above table:")
	try:
		mycursor.execute(f'insert into projects values({id},"{topic}",{coeid})')
		unidb.commit()
	except Error as e:
		print("Error occured,",e)

#Function to Insert into promembers Table.
def insert_into_promembers():
	describe("promembers")
	selectall("projects")
	proid = input("Enter projectID from above table:")
	selectall("students")
	stuid = input("Enter StudentID from above table:")
	try:
		mycursor.execute(f"insert into promembers values({proid},{stuid})")
		unidb.commit()
	except Error as e:
		print("Error occured,",e)

#Function to Insert into staff Table.
def insert_into_staff():
	describe("staff")
	sid = input("Enter staffID:")
	fn = input("Enter First Name:")
	mn = input("Enter Middle Name:")
	ln = input("Enter Last Name:")
	dob = input("Enter DOB as (yyyy-mm-dd):")
	age = input("Enter age:")
	qual = input("Enter Qualification:")
	yos = input("Enter Years of Service:")
	pos = input("Enter Position:")
	selectall("department")
	did = input("Enter Department ID from above table:")
	em = input("Enter email:")
	cno = input("Enter contact no.:")
	add = input("Enter Address:")
	try:
		mycursor.execute(f'insert into staff values({sid},"{fn}","{mn}","{ln}","{dob}",{age},"{qual}",{yos},"{pos}",{did},"{em}","{cno}","{add}")')
		unidb.commit()
	except Error as e:
		print("Error occured,",e)

#Function to Insert into students Table.
def insert_into_students():
	describe("students")
	stuid = input("Enter GRN:")
	fn = input("Enter First Name:")
	mn = input("Enter Middle Name:")
	ln = input("Enter Last Name:")
	dob = input("Enter DOB as (yyyy-mm-dd):")
	age = input("Enter age:")
	sem = input("Enter Email:")
	smno = input("Enter student mobile no.:")
	pmno = input("Enter parent mobile no.:")
	pem = input("Enter parent email:")
	add = input("Enter Address:")
	jd = input("Enter join date as (yyyy-mm-dd):")
	try:
		mycursor.execute(f'insert into students values({stuid},"{fn}","{mn}","{ln}","{dob}",{age},"{sem}","{smno}","{pmno}","{pem}","{add}","{jd}")')
		unidb.commit()
	except Error as e:
		print("Error occured,",e)

#Function to Insert into studiesin Table.
def insert_into_studiesin():
	describe("studiesin")
	selectall("students")
	stuid = input("Enter StudentID from above table:")
	selectall("class")
	cid = input("Enter classID from above table:")
	rno = input("Enter Roll No.:")
	try:
		mycursor.execute(f"insert into studiesin values({stuid},{cid},{rno})")
		unidb.commit()
	except Error as e:
		print("Error occured,",e)

#Function to Insert into subjects Table.
def insert_into_subjects():
	describe("subjects")
	subid = input("Enter Subject ID:")
	name = input("Enter Name:")
	typ = input("Enter Type:")
	selectall("courses")
	cid = input("Enter course ID from above table:")
	credit = input("Enter Credit:")
	try:
		mycursor.execute(f'insert into subjects values("{subid}","{name}","{typ}","{cid}",{credit})')
		unidb.commit()
	except Error as e:
		print("Error occured,",e)
	
#Function to Insert into subjecttaught Table.
def insert_into_subjecttaught():
	describe("subjecttaught")
	selectall("class")
	cid = input("Enter classID from above table:")
	selectall("subjects")
	subid = input("Enter SubjectID from above table:")
	selectall("staff")
	sid = input("Enter staff ID from above table:")
	try:
		mycursor.execute(f'insert into subjecttaught values({cid},"{subid}",{sid})')
		unidb.commit()
	except Error as e:
		print("Error occured,",e)

#Function to Delete from a Table.
def delete_from(s):
	describe(s)
	cn = input("Enter coloumn name to apply delete condition:")
	selectall(s)
	d = input('Enter the data for the condition(enter string in ""):')
	try:
		mycursor.execute(f'delete from {s} where {cn} = {d}')
		unidb.commit()
	except Error as e:
		print("Error occured,",e)

#Function to Update a table value.
def update(s):
	selectall(s)
	cs = input("Enter a column name from above to update value:")
	ds = input('Enter data to be updated (Enter string in ""):')
	c = input("Enter column name to apply condition on:")
	d = input('Enter data for the condition (Enter string in ""):')
	try:
		mycursor.execute(f"update {s} set {cs} = {ds} where {c} = {d}")
		unidb.commit()
	except Error as e:
		print("Error occured ",e)


a=1
while(a):
	print("""

Menu:
1:Display all contents of Data Base.
2:Write a custom select query.
3:Describe table.
4:Display all contents of a table(Select all).
5:Insert into.
6:Delete from.
7:Views
8:Functions
9:Procedures
10:Update
0:Exit""")
	while True:
		try:
			c = int(input("Enter your choice:"))
		except:
			print("Please enter a valid choice.")
			continue
		break
	print("\n\n")
	if c == 1:
		print("Tables:")
		displaytables()  
		print("Views:")
		displayviews()
		print("Functions:")
		displayfunctions()
	
	elif c == 2:
		customquery()


	elif c == 3:
		print("Select a Table:")
		displaytables()
		while True:
			try:
				t = int(input("Enter your choice:"))
			except:
				print("Please enter a valid choice.")
				continue
			break
		if t == 1:
			describe("centerofexcellence")
		elif t == 2:	
			describe("class")
		elif t == 3:
			describe("coemembers")
		elif t == 4:
			describe("completed_projects")
		elif t == 5:
			describe("courses")
		elif t == 6:
			describe("department")
		elif t == 7:
			describe("examgiven")
		elif t == 8:
			describe("exams")
		elif t == 9:	
			describe("projects")	
		elif t == 10:
			describe("promembers")
		elif t == 11:
			describe("retired")
		elif t == 12:
			describe("staff")
		elif t == 13:
			describe("students")
		elif t == 14:
			describe("studiesin")
		elif t == 15:
			describe("subjects")
		elif t == 16:
			describe("subjecttaught")


	elif c == 4:
		print("Select a Table:")
		displaytables()
		while True:
			try:
				t = int(input("Enter your choice:"))
			except:
				print("Please enter a valid choice.")
				continue
			break
		if t == 1:
			selectall("centerofexcellence")
		elif t == 2:	
			selectall("class")
		elif t == 3:
			selectall("coemembers")
		elif t == 4:
			selectall("completed_projects")
		elif t == 5:
			selectall("courses")
		elif t == 6:
			selectall("department")
		elif t == 7:
			selectall("examgiven")
		elif t == 8:
			selectall("exams")
		elif t == 9:	
			selectall("projects")	
		elif t == 10:
			selectall("promembers")
		elif t == 11:
			selectall("retired")
		elif t == 12:
			selectall("staff")
		elif t == 13:
			selectall("students")
		elif t == 14:
			selectall("studiesin")
		elif t == 15:
			selectall("subjects")
		elif t == 16:
			selectall("subjecttaught")

	elif c == 5:
		print("Select a Table:")
		print("""
	
1:centerofexcellence.
2:class.
3:coemembers.
4:courses.
5:department.
6:examgiven.
7:exams.
8:projects.
9:promembers.
10:staff.
11:students.
12:studiesin.
13:subjects.
14:subjecttaught.

""")
		while True:
			try:
				t = int(input("Enter your choice:"))
			except:
				print("Please enter a valid choice.")
				continue
			break
		if t == 1:
			insert_into_centerofexcellence()
		elif t == 2:	
			insert_into_class()
		elif t == 3:
			insert_into_coemembers()
		elif t == 4:
			insert_into_courses()
		elif t == 5:
			insert_into_department()
		elif t == 6:
			insert_into_examgiven()
		elif t == 7:
			insert_into_exams()
		elif t == 8:	
			insert_into_projects()
		elif t == 9:
			insert_into_promembers()
		elif t == 10:
			insert_into_staff()
		elif t == 11:
			insert_into_students()
		elif t == 12:
			insert_into_studiesin()
		elif t == 13:
			insert_into_subjects()
		elif t == 14:
			insert_into_subjecttaught()

	elif c == 6:
		print("Select a Table:")
		displaytables()
		while True:
			try:
				t = int(input("Enter your choice:"))
			except:
				print("Please enter a valid choice.")
				continue
			break
		if t == 1:
			delete_from("centerofexcellence")
		elif t == 2:	
			delete_from("class")
		elif t == 3:
			delete_from("coemembers")
		elif t == 4:
			delete_from("completed_projects")
		elif t == 5:
			delete_from("courses")
		elif t == 6:
			delete_from("department")
		elif t == 7:
			delete_from("examgiven")
		elif t == 8:
			delete_from("exams")
		elif t == 9:	
			delete_from("projects")	
		elif t == 10:
			delete_from("promembers")
		elif t == 11:
			delete_from("retired")
		elif t == 12:
			delete_from("staff")
		elif t == 13:
			delete_from("students")
		elif t == 14:
			delete_from("studiesin")
		elif t == 15:
			delete_from("subjects")
		elif t == 16:
			delete_from("subjecttaught")


	elif c == 7:
		print("Select a view:")
		displayviews()
		while True:
			try:
				v = int(input("Enter your choice:"))
			except:
				print("Please enter a valid choice.")
				continue
			break
		if v == 1:
			selectall("coe_n_members")
		elif v == 2:	
			selectall("project_n_members")
		elif v == 3:
			selectall("staff_and_subjectcount")
		elif v == 4:
			selectall("staff_of_administration_dept")
		elif v == 5:
			selectall("teachers_of_fine_arts")
		elif v == 6:
			selectall("teachers_of_management_and_finance")
		elif v == 7:
			selectall("teachers_of_science_and_technology")

	elif c == 8:
		print("Select a function:")
		displayfunctions()
		while True:
			try:
				f = int(input("Enter your choice:"))
			except:
				print("Please enter a valid choice.")
				continue
			break
		if f == 1:
			while True:
				try:
					d = int(input("Enter GRN of student:"))
				except:
					print("Please enter a valid input.")
					continue
				break
			execute_function("overall_grade",d)
		elif f == 2:	
			while True:
				try:
					d = int(input("Enter ID of department:"))
				except:
					print("Please enter a valid input.")
					continue
				break
			execute_function("staffcount_in_dept",d)
		elif f == 3:
			while True:
				try:
					d = int(input("Enter ID of Class:"))
				except:
					print("Please enter a valid input.")
					continue
				break
			execute_function("studentcount_in_class",d)

	elif c == 9:
		print("Select a procedure:")
		displayprocedures()
		while True:
			try:
				f = int(input("Enter your choice:"))
			except:
				print("Please enter a valid choice.")
				continue
			break
		if f == 1:
			while True:
				try:
					d = int(input("Enter ID of a Class:"))
				except:
					print("Please enter a valid input.")
					continue
				break
			execute_procedure("classstud",d)
		elif f == 2:	
			while True:
				try:
					d = int(input("Enter ID of a department:"))
				except:
					print("Please enter a valid input.")
					continue
				break
			execute_procedure("staffdept",d)
		elif f == 3:
			while True:
				try:
					d = int(input("Enter ID of a Staff Mamber:"))
				except:
					print("Please enter a valid input.")
					continue
				break
			execute_procedure("staffteaches",d)
	
	elif c == 10:
		print("Select a Table:")
		displaytables()
		while True:
			try:
				t = int(input("Enter your choice:"))
			except:
				print("Please enter a valid choice.")
				continue
			break
		if t == 1:
			update("centerofexcellence")
		elif t == 2:	
			update("class")
		elif t == 3:
			update("coemembers")
		elif t == 4:
			update("completed_projects")
		elif t == 5:
			update("courses")
		elif t == 6:
			update("department")
		elif t == 7:
			update("examgiven")
		elif t == 8:
			update("exams")
		elif t == 9:	
			update("projects")	
		elif t == 10:
			update("promembers")
		elif t == 11:
			update("retired")
		elif t == 12:
			update("staff")
		elif t == 13:
			update("students")
		elif t == 14:
			update("studiesin")
		elif t == 15:
			update("subjects")
		elif t == 16:
			update("subjecttaught")

	elif c == 0:
		a = 0

mycursor.close()
unidb.close()			

