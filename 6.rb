input = "4 1 15 12 0 9 9 5 5 8 7 3 14 5 12 3"
$numbers = input.split(" ").map(&:to_i)
$cache = {}
curr_i = $numbers.index($numbers.max)
count = 0
loop do
    count += 1
    curr = $numbers[curr_i]
    [curr, $numbers.count].min.times {|j| $numbers[(curr_i + 1 + j) % $numbers.count] += 1}
    $numbers[curr_i] = [$numbers[curr_i] - $numbers.count, 0].max
    break if $cache[($numbers.join("-"))]
    $cache[$numbers.join("-")] = count
    curr_i = $numbers.index($numbers.max)
end
puts count - $cache[$numbers.join("-")]
