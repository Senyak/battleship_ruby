
class InvalidShot < StandardError; end

def user_turn(b)
  hit = true

  while hit

    break if b.av_getter_c == 0

    b.show_board

    puts "Enter coordinates of new shot in format 'A1':"
    shoot = gets.chomp
    return 'over' if shoot == 'over'
    m = shoot.strip.upcase.match( /^(?<y>[A-J])(?<x>\d+)$/ )
    if m.nil?
      raise InvalidShot.new "Oh no I'm afraid you can't shoot here\n\n"
    end

    x = m['x'].to_i-1
    y = to_integer(m['y'])-1

    if x<0 or x>9 or y<0 or y>9
      raise InvalidShot.new "Oh no, I'm afraid you won't find enemy ships outside the field\n\n"
    end

    if b.board_getter_c[x,y] == 2
      puts "There is a hit! Nice shot!"
      b.board_setter_c(x,y,-2)

      if ship_length(b.board_getter_c,x,y) == 0
        puts "Congratulations, the enemy ship has been destroyed!"
        b.dec_av_c
      end

    elsif b.board_getter_c[x,y] == -2 or b.board_getter_c[x,y] == -1
      raise InvalidShot.new "Oh no, you've already shot here, find another place\n\n"
    else
      puts "There is no ship here - miss"
      b.board_setter_c(x,y,-1)
      hit = false
    end

  end

  false

end

def to_integer(str)
  case str
  when 'A' then return 1
  when 'B' then return 2
  when 'C' then return 3
  when 'D' then return 4
  when 'E' then return 5
  when 'F' then return 6
  when 'G' then return 7
  when 'H' then return 8
  when 'I' then return 9
  else return 10
  end
end

def ship_length(f,i,j)
  l = 0
  x= i
  y = j
  if (f[x+1,y] == 2 or f[x+1,y] == -2) or (f[x-1,y] == 2 or f[x-1,y] == -2)
    while f[x+1,y] == 2 or f[x+1,y] == -2
      l += 1 if f[x+1,y] == 2
      x += 1
    end
    x= i
    y = j
    while f[x-1,y] == 2 or f[x-1,y] == -2
      l += 1  if f[x-1,y] == 2
      x -= 1
    end

  elsif (f[x,y+1] == 2 or f[x,y+1] == -2) or (f[x,y-1] == 2 or f[x,y-1] == -2)
    x= i
    y = j
    while f[x,y+1] == 2 or f[x,y+1] == -2
      l += 1 if f[x,y+1] == 2
      y += 1
    end
    x= i
    y = j
    while f[x,y-1] == 2 or f[x,y-1] == -2
      l += 1 if f[x,y-1] == 2
      y -= 1
    end
  end

  l
end
