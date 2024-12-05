def part1(data)
    rowlen = 10 #140
    score = data.scan("XMAS").length
    p score
    score += data.scan("SAMX").length
    p score
    score += data.scan(/X(.|\n){#{rowlen - 1}}M(.|\n){#{rowlen - 1}}A(.|\n){#{rowlen - 1}}S/).length
    p score
    score += data.scan(/S(.|\n){#{rowlen - 1}}A(.|\n){#{rowlen - 1}}M(.|\n){#{rowlen - 1}}X/).length
    p score
    score += data.scan(/X(.|\n){#{rowlen}}M(.|\n){#{rowlen}}A(.|\n){#{rowlen}}S/).length
    p score
    score += data.scan(/S(.|\n){#{rowlen}}A(.|\n){#{rowlen}}M(.|\n){#{rowlen}}X/).length
    p score
    score += data.scan(/X(.|\n){#{rowlen + 1}}M(.|\n){#{rowlen + 1}}A(.|\n){#{rowlen + 1}}S/).length
    p score
    score += data.scan(/S(.|\n){#{rowlen + 1}}A(.|\n){#{rowlen + 1}}M(.|\n){#{rowlen + 1}}X/).length


    p score
end

def part2(data)

end
if __FILE__ == $0
    
    data = File.open("test", 'r').read

    p part1(data)
    part2(data)
    
end