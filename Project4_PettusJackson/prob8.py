from read_JSON import *

# Read JSON file 
fileObject = ReadJSONFile('./cities_in_USA.json')

# Get Data List
cityDataList = fileObject.getCities()



'''
TODO_1: Create a Dictionary to store cities and states

example:
{
	"Alabama" : [Auburn, Alabaster, Alexander City, ...]
	"California" : [Ashland, Englewood, ...]
	"Florida" : [Ensley, Estero, ...]
}
'''

stateWithCities = {}

# <TODO: Write your code here>

for x in cityDataList:
    stateWithCities.setdefault(x.state, []).append(x.name)



'''
TODO_2: Create another dictionary of states with total number of cities

example:
{
	"Alabama" : "100"
	"California" : "200"
	"Florida" : "150"
}
'''

stateWithCitiesCount = {}
#<TODO: Write your code here>
for x in cityDataList:
    stateWithCitiesCount[x.state] = stateWithCitiesCount.get(x.state, len(stateWithCities[x.state]))


'''
TODO_3: Create a list of states which have cities count Greater than or equal to 300 (>=300)

example:
["California", "Texas" ....]
'''

statesWith300PlusCities = []
#<TODO: Write your code here>
for x in cityDataList:
	if len(stateWithCities[x.state]) >= 300 and x.state not in statesWith300PlusCities:
		statesWith300PlusCities.append(x.state)


'''
TODO_4: Take an recurring input(STATE) from User, and Return analysis 

NOTE : You can follow the same requirement like Project_1:Ruby (How to handle recurring inputs?)

How many cities are there ?
List of cities ?

example:

Enter state name : Alabama

Result 

Number of cities : 150
Names of cities : [Auburn, Alabaster, Alexander City, ...]
'''

#<TODO: Write your code here>
def main():
	enteredState = input("Enter state name: ")
	listOfCities = stateWithCities[enteredState]
	cityCount = len(stateWithCities[enteredState])

	while enteredState != "exit":
		listOfCities = stateWithCities[enteredState]
		cityCount = len(stateWithCities[enteredState])

		print ("\nNumber of cities: " + str(cityCount))
		print ("Names of cities: " + str(listOfCities))

		enteredState = input("\nEnter state name: ")

if __name__== "__main__":
	main()



