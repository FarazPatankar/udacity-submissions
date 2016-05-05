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

    def sort_by_date
        @tasks.sort! { |task_1, task_2| task_1.created_at <=> task_2.created_at }
    end

    def sort_by_priority
        @tasks.sort! { |task_1, task_2| task_2.priority <=> task_1.priority }
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
	attr_reader :description, :created_at, :priority
	attr_accessor :status
    # methods and stuff go here
    def initialize(description, priority)
    	@description = description
    	@status = false
        @created_at = Time.now
        @priority = priority
    end

    def mark_as_complete
    	@status = true
    end

    def completed?
    	@status
    end

    def print_item
        puts "*" * 20
        if @status
            puts "The task '#{@description}' has been completed"
        else
            puts "The task '#{@description}' has not been completed"
        end
        puts "*" * 20
    end
end
