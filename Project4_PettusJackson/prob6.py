#problem 6


#function to create the table data structure
def create_Table():
	# table = []
	# table.append({"State":"Alabama", "Gender":"F", "1985":"Ashley", "1995":"Jessica", "2005":"Madison", "2015":"Ava"})
	# table.append({"State":"Alabama", "Gender":"M", "1985":"Christopher", "1995":"William", "2005":"William", "2015":"William"})
	# table.append({"State":"California", "Gender":"F", "1985":"Jessica", "1995":"Jessica", "2005":"Emily", "2015":"Sophia"})
	# table.append({"State":"California", "Gender":"M", "1985":"Michael", "1995":"Daniel", "2005":"Daniel", "2015":"Noah"})
	# table.append({"State":"Florida", "Gender":"F", "1985":"Jessica", "1995":"Ashley", "2005":"Emily", "2015":"Isabelle"})
	# table.append({"State":"Florida", "Gender":"M", "1985":"Michael", "1995":"Michael", "2005":"Joshua", "2015":"Liam"})
	# table.append({"State":"New York", "Gender":"F", "1985":"Jessica", "1995":"Ashley", "2005":"Emily", "2015":"Olivia"})
	# table.append({"State":"New York", "Gender":"M", "1985":"Michael", "1995":"Michael", "2005":"Michael", "2015":"Liam"})

	newTable = {}
	newTable['State'] = ['Alabama', 'Alabama', 'California', 'California', 'Florida', 'Florida', 'New York', 'New York']
	newTable['Gender'] = ['M', 'F', 'M', 'F', 'M', 'F', 'M', 'F']
	newTable['1985'] = ['Ashley', 'Christopher', 'Jessica', 'Michael', 'Jessica', 'Michael', 'Jessica', 'Michael']
	newTable['1995'] = ['Jessica', 'William', 'Jessica', 'Daniel', 'Ashley', 'Michael', 'Ashley', 'Michael']
	newTable['2005'] = ['Madison', 'William', 'Emily', 'Daniel', 'Emily', 'Joshua', 'Emily', 'Michael']
	newTable['2015'] = ['Ava', 'William', 'Sohpia', 'Noah', 'Isabelle', 'Liam', 'Olivia', 'Liam']
	return newTable

#function to return the number of times Michael was the most popular baby name in 1985
def get_Michael_1985():
	table = create_Table()
	return table['1985'].count('Michael')

	# michael_count = 0
	# table = create_Table()
	# for row in table:
	# 	if(row["1985"] == "Michael"):
	# 		michael_count += 1

	# return michael_count

#function to return a list of all the female baby names in 2015
def get_Female_2015():
	names = []
	for n in create_Table()['2015']:
		if create_Table()['2015'].index(n)%2 == 0:
			names.append(n)
	return names
	
	# table = create_Table()
	# names = []
	# for row in table:
	# 	if(row["Gender"] == "F"):
	# 		names.append(row["2015"])
	# return names

def main():
    print("\nNumber of times Michael was the most popular baby name in 1985: " + str(get_Michael_1985()))
    print("\nFemale most popular baby names in 2015: " + str(get_Female_2015()))

if __name__== "__main__":
    main()


