#!/usr/bin/env ruby

# Design a Responsive Automation Script Parser

class ScriptParser
  def initialize(script)
    @script = script
    @commands = []
  end

  def parse
    # Split script into individual commands
    commands = @script.split("\n")

    # Iterate through each command and extract the action and parameters
    commands.each do |command|
      if command.start_with?("move_to")
        action, x, y = command.split(" ")
        @commands << { action: action, x: x, y: y }
      elsif command.start_with?("click")
        action = command.split(" ")[0]
        @commands << { action: action }
      elsif command.start_with?("wait_for")
        action, time = command.split(" ")[0..1]
        @commands << { action: action, time: time }
      end
    end

    return @commands
  end
end

# Test case
script = <<-SCRIPT
move_to 100 200
click
wait_for 5
move_to 300 400
click
SCRIPT

parser = ScriptParser.new(script)
parsed_commands = parser.parse

puts "Parsed Commands:"
parsed_commands.each do |command|
  puts command.inspect
end