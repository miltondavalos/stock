Stock Helper
==

Looking for an alternative to using instance variables across steps in Cucumber?

# Example Usages

**An alternative to having a whole bunch instance variables with unknown values polluting your steps**

Without stock:

     When /^I do my important Cucumber step thing$/ do
     	@my_instance_variable = ‘something I do not want to change’
     end

     When /^I do my other important Cucumber step without knowing what’s in my instance variables$/ do
     	@my_instance_variable = ‘I should not be changing this.’
     end

- I execute the steps and I get no warning
- I have any number of instance variables that have an unknown state

With stock:

    When /^I do my important Cucumber step thing$/ do
     	stock. = ‘’
    end

    When /^I do my other important Cucumber step without knowing what’s in stock$/ do
    	stock. = ‘’
	# raises a warning when overriding a variable that is ‘in stock’ 
    end

- I execute the steps and get a warning when a variable in stock is used more than once

**Making a teardown that easily clears variables between steps**

hooks.rb

     After do
     	stock.clear
     end
	
