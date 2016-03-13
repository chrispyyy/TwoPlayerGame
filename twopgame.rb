

@lives = {
  'Player 1' => 3, 
  'Player 2' => 3
}

def generate_question(player)
  @randnum1 = rand(1..20)
  @randnum2 = rand(1..20)
  @question = "#{player}:   #{@randnum1} + #{@randnum2} = "
  puts @question
  @answer = @randnum2 + @randnum1
end

def prompt_player_for_answer
  puts "Player Answer: "
  @guess = gets.chomp.to_i
end

def verify_answer?
  @answer == @guess
end

def change_lives(player)
  if verify_answer?
    puts "#{player[0]} is correct"
  else
  
    puts "#{player[0]} is NOT correct"
    @lives[player[0]] -= 1
  end
end


def display_lives
  @lives.each do |player, lives|
    if lives <= 1
      puts "#{player} has #{lives} life left"
    else
      puts "#{player} has #{lives} lives left"
    end
  end
end

def endgame?
  @lives['Player 1'] == 0 || @lives['Player 2'] == 0
end

def play_round
  generate_question('Player 1')
  prompt_player_for_answer
  player1_answer = ["Player 1", verify_answer?]
  change_lives(player1_answer)
  display_lives unless endgame?
  
  if !endgame?
    generate_question('Player 2')
    prompt_player_for_answer
    player1_answer = ["Player 2", verify_answer?]
    change_lives(player1_answer)
    display_lives unless endgame?
  end
end

def gametime
  quit = true
  while quit
    play_round
    if endgame?
      puts "#{@lives}"
      quit = false
      break
    else
      puts "Play on!"
    end
  end
end
#
#
gametime
