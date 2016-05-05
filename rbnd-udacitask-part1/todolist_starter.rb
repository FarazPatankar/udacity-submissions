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

    def sort_tasks
        @tasks.sort! { |task_1, task_2| task_1.created_at <=> task_2.created_at }
    end

    def show_incomplete
        puts "*" * 20
        puts "Incomplete tasks in #{@title.upcase}"

        @tasks.each_with_index do |task, index|
            if !task.status
                puts "#{index + 1}. #{task.description.capitalize}"
            end
        end

        puts "*" * 20
        puts ""
    end

    def show_complete
        puts "*" * 20
        puts "Completed tasks in #{@title.upcase}"

        @tasks.each_with_index do |task, index|
            if task.status
                puts "#{index + 1}. #{task.description.capitalize}"
            end
        end

        puts "*" * 20
        puts ""
    end

end

class Item
	attr_reader :description, :created_at
	attr_accessor :status
    # methods and stuff go here
    def initialize(description)
    	@description = description
    	@status = false
        @created_at = Time.now
    end

    def mark_as_complete
    	@status = true
    end

    def completed?
    	@status
    end
end
