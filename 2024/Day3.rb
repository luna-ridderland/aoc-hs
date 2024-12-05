def part1(data)
    valids = data.scan(/mul\(\d+,\d+\)/)
    nums = valids.map {|v| v.gsub(/mul\(|\)/,'').split(",").map{|a| a.to_i}}
    p nums.map{|m,n| m*n}.sum
    
end
def part2(data)
    valids = data.gsub(/don't\(\).*do\(\)/, "").scan(/mul\(\d+,\d+\)/)
    nums = valids.map {|v| v.gsub(/mul\(|\)/,'').split(",").map{|a| a.to_i}}
    p nums.map{|m,n| m*n}.sum
end

if __FILE__ == $0
    
    data = File.open("data/Day3.txt", 'r').read

    part1(data)
    part2(data)
    
end