# NOTE: input is read in as the puzzle input
def parse_part(c)
    parts = c.split(" ")
    parts[0] = "$map['" + parts[0] + "']"
    parts.join(" ")
end
lines = input.split("\n")
$map = {}
overall_max = 0
lines.each do |line|
    parts = line.split("if").map(&:strip)
    
    action = parts[0].gsub(/inc/, "+=").gsub(/dec/, "-=")
    condition = parts[1]
    
    variable_action = action.split(" ")[0]
    variable_condition = condition.split(" ")[0]

    $map[variable_action] = 0 unless $map[variable_action]
    $map[variable_condition] = 0 unless $map[variable_condition]
    
    eval(parse_part(action)) if eval(parse_part(condition))
    overall_max = [$map.values.max, overall_max].max
end
puts "Answer A: #{$map.values.max}" 
puts "Answer B: #{overall_max}"