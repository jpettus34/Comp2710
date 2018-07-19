#problem 4
#given a list of strings, remove any duplicates and keep stable.
def remove_duplicates(strList):
    answer = []
    for word in strList:
       	if word not in answer:
           	answer.append(word)
    print answer
