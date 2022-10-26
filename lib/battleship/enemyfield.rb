require "matrix"

class Enemy_Field
  def initialize
    fields = [
      [[2,0,0,0,0,0,0,0,0,0],
       [2,0,0,2,2,2,0,0,0,2],
       [2,0,0,0,0,0,0,2,0,2],
       [2,0,0,0,0,0,0,2,0,0],
       [0,0,0,2,2,2,0,0,0,0],
       [0,0,0,0,0,0,0,0,0,0],
       [0,0,0,0,0,0,0,2,0,0],
       [0,0,0,0,0,2,0,2,0,2],
       [0,0,0,0,0,0,0,0,0,0],
       [0,0,0,2,0,0,0,0,2,0]],
      [[0,0,0,0,0,0,0,0,0,0],
       [2,0,0,2,2,2,0,0,0,0],
       [2,0,0,0,0,0,0,2,0,0],
       [2,0,0,0,0,0,0,2,0,0],
       [2,0,0,2,2,2,0,0,0,0],
       [0,0,0,0,0,0,0,0,0,0],
       [0,0,2,0,0,0,0,2,0,0],
       [0,0,2,0,0,2,0,2,0,2],
       [0,0,0,0,0,0,0,0,0,0],
       [0,0,0,2,0,0,0,0,2,0]],
      [[0,0,0,0,0,0,0,0,0,0],
       [0,0,0,2,2,2,0,0,0,2],
       [2,0,0,0,0,0,0,0,0,2],
       [2,0,0,0,0,0,0,0,0,0],
       [2,0,0,2,2,2,0,0,0,0],
       [2,0,0,0,0,0,0,0,0,0],
       [0,0,2,0,0,0,0,2,0,0],
       [0,0,2,0,0,2,0,2,0,2],
       [0,0,0,0,0,0,0,0,0,0],
       [0,0,0,2,0,0,0,0,2,0]],
      [[0,2,0,0,2,0,0,0,0,0],
       [0,0,0,0,0,0,0,0,0,0],
       [0,0,0,2,2,2,0,2,0,2],
       [2,0,0,0,0,0,0,2,0,2],
       [2,0,0,2,2,2,0,0,0,0],
       [2,0,0,0,0,0,0,0,0,2],
       [2,0,2,0,0,0,0,0,0,0],
       [0,0,2,0,0,0,0,0,0,0],
       [0,0,0,0,0,0,0,0,0,0],
       [0,0,0,0,0,0,0,0,2,0]],
      [[0,2,0,0,2,0,0,0,0,0],
       [0,0,0,0,0,0,0,0,0,0],
       [0,0,0,2,2,2,0,2,0,2],
       [0,0,0,0,0,0,0,2,0,2],
       [0,0,2,2,2,2,0,0,0,0],
       [2,0,0,0,0,0,0,0,0,2],
       [2,0,0,0,0,0,0,0,0,0],
       [2,0,0,2,2,0,0,0,0,0],
       [0,0,0,0,0,0,0,0,0,0],
       [0,0,0,0,0,0,0,0,2,0]],
      [[0,2,0,0,2,0,0,0,0,2],
       [0,0,0,0,0,0,0,0,0,2],
       [0,2,2,2,0,0,0,2,0,0],
       [0,0,0,0,0,0,0,2,0,0],
       [0,0,0,2,2,2,0,0,0,0],
       [0,2,0,0,0,0,0,0,0,2],
       [0,2,0,0,0,0,0,0,0,0],
       [0,2,0,0,2,2,0,0,0,0],
       [0,2,0,0,0,0,0,0,0,0],
       [0,0,0,0,2,0,0,0,0,0]],
      [[0,0,0,2,0,0,0,0,0,0],
       [0,0,0,2,0,0,0,0,0,0],
       [0,0,0,2,0,0,0,0,0,0],
       [2,2,0,0,0,0,0,2,0,0],
       [0,0,0,0,0,0,0,2,0,0],
       [0,2,0,0,0,0,0,0,0,2],
       [0,0,0,0,0,0,0,0,0,0],
       [0,0,0,0,2,2,2,0,0,2],
       [2,2,0,0,0,0,0,0,0,0],
       [0,0,0,0,2,0,2,2,2,2]],
      [[2,0,0,2,0,0,0,0,0,0],
       [0,0,0,2,0,0,2,0,0,0],
       [0,0,0,2,0,0,0,0,0,0],
       [0,0,0,0,0,0,0,2,2,0],
       [0,0,0,0,0,0,0,0,0,0],
       [0,0,0,0,2,2,0,0,0,0],
       [2,0,0,0,0,0,0,0,0,2],
       [0,0,0,0,2,2,2,0,0,2],
       [2,2,0,0,0,0,0,0,0,2],
       [0,0,0,0,0,0,2,0,0,2]],
      [[0,0,0,2,0,0,0,0,0,0],
       [0,0,0,2,0,0,0,0,0,0],
       [0,0,0,2,0,2,0,0,0,0],
       [0,2,0,0,0,0,0,2,0,0],
       [0,2,0,0,0,0,0,2,0,0],
       [0,2,0,2,0,0,0,0,0,2],
       [0,0,0,0,0,0,0,0,0,0],
       [0,0,0,0,2,2,0,0,0,2],
       [2,0,0,0,0,0,0,0,0,0],
       [2,0,0,0,0,0,2,2,2,2]]
    ]
    f = fields.sample
    @field = Matrix[f[0],f[1],f[2],f[3],f[4],f[5],f[6],f[7],f[8],f[9]]
    @field.transpose if rand(10) % 2 == 0
    @available_ships = [4, 3, 2, 1]
  end

  def field_getter
    @field
  end

  def field_setter(x,y,v)
    @field[x,y] = v
  end

  def show_field
    for i in 0..9 do
      for j in 0..9 do
        print " — ".unicode_normalize if @field[i,j] == 0
        print " ☓ ".unicode_normalize if @field[i,j] == 1
        print " ☐ ".unicode_normalize if @field[i,j] == 2
      end
      puts " "
    end
  end

  #def attack(x,y)

  #  if @field[x,y]==2
  #    @field[x,y]=0

  #  else
  #    return "Unfortunately you missed"
  #end

end
class Enemy
  def initialize (u_f, c_f, board)
    @field = c_f
    @user_field = u_f
    @ships_count = 20
    @last_hit = [-1,-1]
    @b = board
  end
  def amount_ships
    @ships_count
  end

  def u_field_getter
    @user_field
  end

  def attack
    if @last_hit != [-1,-1]
      flag = [1, -1, -1]

      while flag[0] == 1
        flag = shot_near(@user_field, @last_hit[0], @last_hit[1])

        if flag[0] == 0
          puts 'You are lucky... Сomputer missed'
          break
        end

        x = flag[1]
        y = flag[2]
        @last_hit = [x,y]
        @b.update_board(@user_field)
        puts 'Computer got into your ship'
        @b.show_board
        puts '  '
      end

    else

      x=-1
      y=-1
      while true
        x = rand(10)
        y= rand(10)

        if  @user_field[x,y]>=0
          break
        end

      end

        if @user_field[x,y] == 2
          @user_field[x,y] = -2
          @ships_count-=1

          puts 'Attack was successful'
          @b.update_board(@user_field)

          if ship_length(@user_field,x,y) == 0
            puts 'Unfortunately computer destroyed your ship'
            @last_hit = [-1,-1]
            @b.dec_av_u
            @b.show_board
            puts '  '
            puts "Oh, no, here computer goes again"
            attack

          else
            @last_hit = [x,y]
            puts 'Computer got into your ship'
            @b.show_board
            puts '  '

            flag = [1, -1, -1]

            while flag[0] == 1
              puts "Oh, no, here computer goes again"
              flag = shot_near(@user_field, @last_hit[0], @last_hit[1])

              if flag[0] == 0
                puts 'You are lucky... Сomputer missed'
                break
              end

              x = flag[1]
              y = flag[2]
              @last_hit = [x,y]
              @b.update_board(@user_field)
              puts 'Computer got into your ship'
              @b.show_board
              puts '  '
            end

          end

        else
          puts 'You are lucky... Сomputer missed'
          puts ' '
          @user_field[x,y] = -1
          @b.update_board(@user_field)
          @b.show_board
          puts '  '
        end

      @b.update_board(@user_field)
    end
  end

  def shot_near(f,x,y)
      y1 = y
      x1 = x-1

      while f[x1,y] == -2
        x1 = x1-1
        if x1 < 0 or f[x1,y] == -1
          x1 = x
          break
        end
      end

      if x1 == x
        while f[x1+1,y] == -2
          x1 = x1+1
          if x1 > 9 or f[x1,y] == -1
            x1 = x
          end
        end
      end

      if x1 == x
        y1 = y-1
        while f[x,y1] == -2
          y1 -= 1
          if y1 < 0 or f[x,y1] == -1
            y1 = y
            break
          end
        end

        if y1 == y
          while f[x,y1+1] == -2
            y1 += 1
            if y1 > 9 or f[x,y1] == -1
              y1 = y
            end
          end
        end

      end

      if f[x1,y1] == 2
        f[x1,y1] = -2
        @ships_count-=1
        [1,x1-1,y1]
      else
        f[x1,y1] = -1
        @last_hit = [x,y]
        [0,x1-1,y1]
      end
  end


end
