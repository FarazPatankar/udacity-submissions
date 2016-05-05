class TodoList
	attr_reader :title, :tasks
    # methods and stuff go here
    def initialize(title)
    	@title = title
    	@tasks = []
    end

    def rename_list(new_title)
    	@title = new_title
    end

    def add_item(item)
    	@tasks.push(item)
    end

    def remove_item(item)
    	@tasks.delete(item)
    end

    def list_printer
        puts "*" * 20
        puts @title.upcase

        @tasks.each_with_index do |task, index|
        puts "#{index + 1}. #{task.description.capitalize}"
        end

        puts "*" * 20
        puts ""
    end

end

class Item
	attr_reader :description
	attr_accessor :status
    # methods and stuff go here
    def initialize(description)
    	@description = description
    	@status = false
    end

    def mark_as_complete
    	@status = true
    end

    def completed?
    	@status
    end
end
