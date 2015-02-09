Stock Helper
==

Looking for an alternative to using instance variables across steps in Cucumber?

# Example Usages

**An alternative to having a whole bunch instance variables with unknown values polluting your steps**

Without stock:

     When /^I do my important Cucumber step thing$/ do
     	@my_instance_variable = ‘some instance variable that will pollute my steps’
     end

     When /^I do my other important Cucumber step without knowing what’s in my instance variables$/ do
     	@my_instance_variable = ‘another value for my instance variable that is polluting my steps’
     end

- I have any number of instance variables that have an unknown state

With stock:

    When /^I do my important Cucumber step thing$/ do
     	stock.thing_i_can_now_keep_track_of = ‘predictable’
    end

    When /^I do my other important Cucumber step without knowing what’s in stock$/ do
    	stock.thing_i_can_now_keep_track_of = ‘predictable’
    end

- I am not using instance variables across steps and can now clear everything in stock easily. See below.

**Making a teardown that easily clears variables between steps**

hooks.rb

     After do
     	stock.clear
     end
	
