# a little experiment to implement goto in ruby
# use at your own risk of velociraptor attack.

#usage:

# irb(main):166:0> read
# n = 0
# label :st
# puts n
# n = n + 1
# goto :st if n < 5
# ~~~
# => nil
# irb(main):167:0> run
# 0
# 1
# 2
# 3
# 4
# => nil
# irb(main):168:0>

def reset
  $iptr = 0
  $program = []
  $labels = {}
  $binding = binding
end

# bug: if this is evaluated during run,
# we only get backward goto's
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
