require_relative 'todolist_starter.rb'

# Creates a new todo list
list = TodoList.new("My List")

# Add four new items
wake_up = Item.new("wake up", 1)
work = Item.new("work", 0)
shower = Item.new("shower", 2)
brush_teeth = Item.new("brush teeth", 2)

list.add_item(wake_up)
list.add_item(brush_teeth)
list.add_item(shower)
list.add_item(work)

# Print the list
list.list_printer

# Sort by priority and print
list.sort_by_priority
list.list_printer

# Delete the first item
list.remove_item(wake_up)

# Print the list
list.list_printer

# Delete the second item
list.remove_item(brush_teeth)

# Print the list
list.list_printer

# Update the completion status of the first item to complete
list.tasks.first.mark_as_complete

# Print the list
list.list_printer

# Update the title of the list
list.rename_list("Daily chores")

# Print the list
list.list_printer

# Sort tasks
list.sort_by_date

# Print the list
list.list_printer

# Show incomplete tasks
list.show_incomplete

# Show completed tasks
list.show_complete

# Demonstration of item printing method
wake_up.print_item