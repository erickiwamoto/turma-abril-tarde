


# tipos = Array.new


# tipos.push('Selecione um tipo')
# tipos.push('Prime')
# tipos.push('Exclusivo')
# tipos.push('Gold')
# tipos.push('Platinum')

# # tipos.delete_at 0

# puts tipos

# puts 'teste'



class Person
    attr_accessor :name

    def initialize(name)
        self.name = name
        puts 'Hi ' + name + '. Welcome to QA Ninja.'
    end

    def says(value)
        self.name + ' says: ' + value
    end

end

fernando = Person.new('Fernando')

puts fernando.says('Hello')