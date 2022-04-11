class User
  
	def name=(name)
		@name = name
	end

	def name
	 	@name
	end

	def mark=(mark)
		@mark = (1..5).include? (mark) ? mark : 5
	end

	def mark
		@mark
	end
  #attr_accessor :name, :evalutation

  #def initialize(name, evalutation)
  	#@name = name
  	#if (1..5).include? evalutation
  	  #@evalutation = evalutation
  	#else
  	  #@evalutation = 5
  	#end
  #end
  

end


=begin

users = 3.times.map do
		puts 'Name'
		name = gets.chomp
		puts 'Mark'
		evalutation = gets.to_i

		User.new(name, evalutation)
	end

p users


users = []

puts 'Name'
name = gets.chomp
puts 'Mark'
evalutation = gets.to_i

users << User.new(name, evalutation)

puts 'Name'
name = gets.chomp
puts 'Mark'
evalutation = gets.to_i

users << User.new(name, evalutation)

puts 'Name'
name = gets.chomp
puts 'Mark'
evalutation = gets.to_i

users << User.new(name, evalutation)

p users
=end

__END__
#module Form
  class User
    def user_name=(name)
     @name = user_name
    end

    def name
      @name
    end

    def user_mark=(mark)
      @mark = user_mark
        #if (1..5).include? evalutation
          #@evalutation = evalutation
        #else
         # @evalutation = 5
       # end
    end

    def mark
      @mark
    end 
  end
#end
    def make_user(name, mark)
      user = User.new
      user.name = name
      user.mark = mark
      user
    end

users = []

print 'Имя'
name = gets.chomp
print 'Оценка'
mark = gets.to_i

users << make_user(name, mark)

puts users