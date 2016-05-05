require_relative 'todolist_starter.rb'

# Creates a new todo list
list = TodoList.new("My List")

# Add four new items
wake_up = Item.new("wake up")
brush_teeth = Item.new("brush teeth")
shower = Item.new("shower")
work = Item.new("work")

list.add_item(wake_up)
list.add_item(brush_teeth)
list.add_item(shower)
list.add_item(work)

# Print the list
list.tasks.each_with_index do |task, index|
	puts "#{index + 1} - #{task.description.capitalize}"
end

# Delete the first item
list.remove_item(wake_up)

# Print the list
list.tasks.each_with_index do |task, index|
	puts "#{index + 1} - #{task.description.capitalize}."
end

# Delete the second item
list.remove_item(brush_teeth)

# Print the list
list.tasks.each_with_index do |task, index|
	puts "#{index + 1}. #{task.description.capitalize}"
end

# Update the completion status of the first item to complete
list.tasks.first.mark_as_complete

# Print the list
list.tasks.each_with_index do |task, index|
	puts "#{index + 1}. #{task.description.capitalize}"
end

# Update the title of the list
list.rename_list("Daily chores")

# Print the list
list.tasks.each_with_index do |task, index|
	puts "#{index + 1}. #{task.description.capitalize}"
end