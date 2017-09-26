def player(board,board_score,line_score,p_symbol)
  n= gets.chomp.to_i 
  if(n/4 < 1)
    board[0][2*(n-1)] = p_symbol
    
  elsif(n/7 < 1)
    board[2][2*(n-4)] = p_symbol 
    
  else
    board[4][2*(n-7)] = p_symbol 
  end
  
  if n==1
    line_score[0]+=1
    line_score[3]+=1
    line_score[6]+=1
    for i in 0..8
      if i!=5 && i!=7 && n!=i-1
        board_score[i]-=0.5        
      end
    end
  elsif n==2
    line_score[0]+=1
    line_score[4]+=1
    
    for i in 0..8
      if i!=3 && i!=5 && i!=6 && i!=8 && n!=i-1
        board_score[i]-=0.5        
      end
    end
  elsif n==3
    line_score[0]+=1
    line_score[5]+=1
    line_score[7]+=1
    for i in 0..8
      if i!=3 && i!=7 && n!=i-1
        board_score[i]-=0.5        
      end
    end
  elsif n==4
    line_score[1]+=1
    line_score[3]+=1
    
    for i in 0..8
      if i!=1 && i!=2 && i!=7 && i!=8 && n!=i-1
        board_score[i]-=0.5        
      end
    end
  elsif n==5
    line_score[1]+=1
    line_score[4]+=1
    line_score[7]+=1
    line_score[6]+=1
   
    for i in 0..8
      if n!=i-1
        board_score[i]-=0.5     
      end
    end
  elsif n==6
    line_score[1]+=1
    line_score[5]+=1

    for i in 0..8
      if i!=0 && i!=1 && i!=6 && i!=7 && n!=i-1
        board_score[i]-=0.5        
      end
    end
  elsif n==7
    line_score[2]+=1
    line_score[3]+=1
    line_score[7]+=1
    for i in 0..8
      if i!=1 || i!=5 && n!=i-1
        board_score[i]-=0.5        
      end
    end
  elsif n==8
    line_score[2]+=1
    line_score[4]+=1
    for i in 0..8
      if i!=0 && i!=2 && i!=3 && i!=5 && n!=i-1
        board_score[i]-=0.5        
      end
    end
  elsif n==9
    line_score[2]+=1
    line_score[5]+=1
    line_score[6]+=1
    
    for i in 0..8
      if i!=1 || i!=3 && n!=i-1
        board_score[i]-=0.5        
      end
    end
  end  

  board_score[n-1] = 0
end

def computer(c_symbol,board_score,line_score,board)
    
  for i in 0..7
    if line_score[i] ==-2 
      puts i
      if i == 0
        for j in 0..2
          if board[0][j*2].to_i== j+1
            board[0][j*2] = c_symbol
            line_score[i]=-3
            return
          end
        end
      elsif i == 1  
        for j in 0..2
          if board[2][j*2].to_i== j+4
            board[2][j*2] = c_symbol
            line_score[i]=-3
            return
          end
        end
      elsif i == 2
        for j in 0..2
          if board[4][j*2].to_i== j+7
            board[4][j*2] = c_symbol
            line_score[i]=-3
            return
          end
        end  
      elsif i == 3
        for j in 0..2
          if board[j*2][0].to_i== 3*(j+1)-2
            board[j*2][0] = c_symbol
            line_score[i]=-3
            return
          end
        end  
      elsif i == 4
        for j in 0..2
          if board[j*2][2].to_i== 3*(j+1)-1
            board[j*2][2] = c_symbol
            line_score[i]=-3
            return
          end
        end  
      elsif i == 5
        for j in 0..2
          if board[j*2][4].to_i== 3*(j+1)
            board[j*2][4] = c_symbol
            line_score[i]=-3
            return
          end
        end  
      elsif i == 6
        for j in 0..2
          if board[j*2][j*2].to_i== 4*(j+1)-3
            board[j*2][j*2] = c_symbol
            line_score[i]=-3
            return
          end
        end
      elsif i == 7

        for j in 0..2
          if board[4-(j*2)][j*2].to_i== 9-2*(j+1)
            board[4-(j*2)][j*2] = c_symbol
            line_score[i]=-3
            return
          end
        end
      end
    end
  end
  for i in 0..7
    if line_score[i] ==2 # stop player from winning
      
      if i == 0
        for j in 0..2
          if board[0][j*2].to_i== j+1
            board[0][j*2] = c_symbol
            
            line_score[i]-=100
            x= j+1
          end
        end
      elsif i == 1  
        for j in 0..2
          if board[2][j*2].to_i== j+4
            board[2][j*2] = c_symbol
            line_score[i]=-100
            x=j+4
          end
        end
      elsif i == 2
        for j in 0..2
          if board[4][j*2].to_i== j+7
            board[4][j*2] = c_symbol
            line_score[i]=-100
            x=j+7
          end
        end  
      elsif i == 3
        for j in 0..2
          if board[j*2][0].to_i== 3*(j+1)-2
            board[j*2][0] = c_symbol
            line_score[i]=-100
            x=3*(j+1)-2
          end
        end  
      elsif i == 4
        for j in 0..2
          if board[j*2][2].to_i== 3*(j+1)-1
            board[j*2][2] = c_symbol
            line_score[i]=-100
            x=3*(j+1)-1
          end
        end  
      elsif i == 5
        for j in 0..2
          if board[j*2][4].to_i== 3*(j+1)
            board[j*2][4] = c_symbol
            line_score[i]=-100
            x=3*(j+1)
          end
        end  
      elsif i == 6
        for j in 0..2
          if board[j*2][j*2].to_i== 4*(j+1)-3
            board[j*2][j*2] = c_symbol
            line_score[i]=-100
            x=4*(j+1)-3
          end
        end
      elsif i == 7

        for j in 0..2
          if board[4-(j*2)][j*2].to_i== 8-2*(j+1)
            board[4-(j*2)][j*2] = c_symbol
            line_score[i]=-100
            x=8-2*(j+1)
          end
        end
      end
    end
    
  end
  
  if x!=nil
    n = x-1
    i=9
  else
    i=0
    n=0
  end
  
  
  while i<9
    if board_score[i]>n
      n = i
    end
    i+=1
  end
  n+=1
  
  if n==1
    line_score[0]-=1
    line_score[3]-=1
    line_score[6]-=1
  
  elsif n==2
    line_score[0]-=1
    line_score[4]-=1
    
  
  elsif n==3
    line_score[0]-=1
    line_score[5]-=1
    line_score[7]-=1
    
  elsif n==4
    line_score[1]-=1
    line_score[3]-=1
    
    
  elsif n==5
    line_score[1]-=1
    line_score[4]-=1
    line_score[7]-=1
    line_score[6]-=1
   
    
  elsif n==6
    line_score[1]-=1
    line_score[5]-=1

    
  elsif n==7
    line_score[2]-=1
    line_score[3]-=1
    line_score[7]-=1

  elsif n==8
    line_score[2]-=1
    line_score[4]-=1
    
  elsif n==9
    line_score[2]-=1
    line_score[5]-=1
    line_score[6]-=1
    
    
  end 
  
  if(n/4 < 1)
    board[0][2*(n-1)] = c_symbol
    
  elsif(n/7 < 1)
    board[2][2*(n-4)] = c_symbol 
    
  else
    board[4][2*(n-7)] = c_symbol 
  end
  
  board_score[n-1]=0
end

def check_game(line_score)
  for i in 0..7
    if(line_score[i]==3)
      puts "Player win."
      return true
    elsif(line_score[i]==-3)
      puts "Computer win."
      return true
    end
  end
  
  return false


end
board_score = [3,2,3,
               2,4,2,
               3,2,3]
line_score = [0,0,0,
              0,0,0,
              0,0]#row0 1 2,colum3 4 5,diagonal 7 8           
board = ["1|2|3\n",
         "-----\n",
         "4|5|6\n",
         "-----\n",
         "7|8|9\n"]#0,2,4
         





mode = 0
step =0
puts "Welcom to play OX game."
print "1. O(last) or 2. X(first):"
mode = gets.chomp.to_i
symbol = ''
if mode ==1
  p_symbol = 'O'
  c_symbol = 'X'
elsif mode ==2
  p_symbol = 'X'
  c_symbol = 'O'
end

while(step<9)
  
  if mode == 1
    computer(c_symbol,board_score,line_score,board)
    step+=1
    if step >=5
      if check_game(line_score)
        puts board
        break  
      end
    elsif step>=9
      break
    end
    
    puts "Where would you like to go?"
    puts board
    print "Enter a number in the board:"
    
    player(board,board_score,line_score,p_symbol)
    step+=1
    if step >=6
      if check_game(line_score)
        puts board
        break 
      end
    end
  else
    puts "Where would you like to go?"
    puts board
    print "Enter a number in the board:"
    
    player(board,board_score,line_score,p_symbol)
    step+=1
    if step >=5
      if check_game(board_score)
        puts board
        break  
      end
    end
    computer(c_symbol,board_score,line_score,board)
    step+=1
    if step >=6
      if check_game(board_score)
        puts board
        break 
      end
    end
  end
  #puts line_score
end
if step==9
  puts "Tie"
end