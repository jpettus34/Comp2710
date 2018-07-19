# Dr. Taneja
# COMP3220 - 002 : Programming Languages
# Assignment_1


# Database of movies
class Database
	def self.getListOfMovies()
		movies = []
		File.open("data.txt").each do |line|
			movies.push(line.chomp)
		end
		return movies
		File.close
	end
end

# Search controller class
class SearchController

	attr_accessor :searchSuggestionList
	

	def self.defaultSearchSuggestionList()
		# Subtask - 1
		#<TODO: write your code here>
		 #@searchSuggestionList = ["lord of the rings", "harry potter", "prisoners", "star wars"]
		 @searchSuggestionList = Database.getListOfMovies()

	end

	def self.getSearchSuggestionList()
		return @searchSuggestionList
	end

	def self.updateList(movieName)
		# Subtask - 3
		#<TODO: write your code here>
		#add movieName to the beginning of searchsuggestionList. If it is a duplicate, remove the second duplicate.
		 updated = @searchSuggestionList.unshift(movieName)
		return updated.uniq!

	end

	def self.saveListToFile()
		#####
		# Subtask - 5 
		#
		# 1.save updated search suggestion list to data.txt file 
		#
		#####
		#<TODO: write your code here>
		newMovieDatabase = (self.getSearchSuggestionList + Database.getListOfMovies).uniq!
		IO.write("myMovies.txt", newMovieDatabase.join("\n"))



	end

end




######
#
# Main starts here
#
######

# Initialize default list ...
SearchController.defaultSearchSuggestionList()

#####
# Subtask - 2 
#
# 1.create endless loop 
# 2.get an input from terminal
# 3.update search suggestion list
# 4.loop should end when user write "exit"
#
#####
#<TODO: write your code here>\

until (searchText = gets.chomp.to_s.downcase) == "exit"
 
  SearchController.updateList(searchText)
  puts SearchController.getSearchSuggestionList

end

#####
# Subtask - 4 
#
# 1.save updated "searchSuggestionList" to data.txt file
#
#####
#<TODO: write your code here>

SearchController.saveListToFile()

