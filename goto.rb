def reset
  $iptr = 0
  $program = []
  $labels = {}
  $binding = binding
end

def label(lname)
  $labels[lname] = $iptr
end

def goto(lname)
  $iptr = $labels[lname]
end

def run
  while $iptr < $program.size
    i = $iptr
    eval $program[i], $binding
    if i==$iptr
      $iptr = $iptr + 1
    end
  end
end

def read
  reset
  while "~~~" != (line=gets.strip)
    $program << line
  end
end

def type
  $program.each{|line| puts line}
  puts "~~~"
end


# n = 0
# label :st
# puts n
# n = n + 1
# goto :st if n < 5
# ~~~