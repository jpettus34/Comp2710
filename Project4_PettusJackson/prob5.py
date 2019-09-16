#problem 5

def string_fun(strIn):
	ans = ''
	for i in range(1, len(strIn) + 1):
		ans = ans + strIn[0:i]
	return ans

def main():
    print(string_fun("auburn"))

if __name__== "__main__":
    main()
