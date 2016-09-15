LAME_SUBS = { 'a' => 4, 'e' => 3, 'i' => 1, 'o' => 0, 's' => 5, 'z' => 2, 'g' => 6, 'b' => 8, 't' => 7, 'q' => 9 }

def str2lame(str)
  str.split('').map {|c| LAME_SUBS[c] || c }.join
end

if __FILE__ == $0
  if ARGV.empty?
    while str = $stdin.readline.chomp
      puts str2lame str
    end
  else
    ARGV.each {|str| puts str2lame str }
  end
end
