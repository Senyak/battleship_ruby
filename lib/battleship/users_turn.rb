
class InvalidShoot < StandardError; end

def user_turn(b)
  hit = true

  while hit

    break if b.av_getter_c == 0

    puts "Enter coordinates of new shot in format 'A1':"
    shoot = gets.chomp
    exit if shoot == 'over'
    m = shoot.upcase.match( /(?<y>[A-J])(?<x>\d+)/ )
    if m.nil?
      throw InvalidShoot
    end

    x = m['x'].to_i
    y = Field.to_int(m['y'])

    if x<0 or x>9
      throw InvalidShoot
    end

    if b.board_getter_c.field_getter[x,y] == 2
      puts "There is a hit! Nice shot!"
      b.board_getter_c.field_setter(x,y,-2)

      if ship_length(b.board_getter_c.field_getter,x,y) == 0
        puts "Congratulations, the enemy ship has been destroyed!"
        b.dec_av_c
      end

    elsif b.board_getter_c.field_getter[x,y] == -2 or b.board_getter_c.field_getter[x,y] == -1
      throw InvalidShoot
    else
      puts "There is no ship here - miss"
      hit = false
    end

  end

  false

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
end
