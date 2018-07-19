#problem 5

def string_fun(str):
  	ans = ""
 	for i in range(1, len(str) +1):
    	ans = ans + str[0:i]
    
 	print ans

def main():
    string_fun("auburn")

if __name__== "__main__":
    main()
