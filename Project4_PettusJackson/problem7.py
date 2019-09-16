#reads in the file
def read_File():
	file = open('data.txt','r')
	numberList = file.read().split('\n')
	file.close()
	numberList= list(map(int, numberList))
	return numberList

#calculates the mean
def calc_Avg():
	numberList = read_File()
	listLength = len(numberList)
	totalSum = 0

	for num in numberList:
		totalSum += num

	mean = float(totalSum) / listLength
	return round(mean, 3)

#gets the minimum value from the list
def get_Min():
	numberList = read_File()
	minNum = min(n for n in numberList)
	return minNum

#gets the maximum value from the list
def get_Max():
	numberList = read_File()
	maxNum = max(n for n in numberList)
	return maxNum

#gets the total number of counties in which data was reported from
def totalCounties():
	numberList = read_File()
	total = len(numberList)
	return total

#This function prints the results from the previous functions in a string
def main():
	numberList = read_File()
	print("RESULTS FROM DATA:\n") 
	print ("The average number of people affected in one county: ")
	print(str(calc_Avg()))
	print("\n")
	print ("The minimum number of people affected in a particular county: ")
	print (str(get_Min()))
	print ("\n")
	print ("The maximum number of people affected in a particular county: ")
	print (str(get_Max()))
	print ("\n")
	print ("The total number of counties tested: ")
	print (str(totalCounties()))


if __name__== "__main__":
	main()