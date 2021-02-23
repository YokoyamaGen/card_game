#encoding: utf-8

module MessageDialog
  def player_hand_info(**params)
    player = params[:player]

    puts "#{player.name}さんの手札".center(50 - player.name.size, "-")
    puts ""

    player.hand.each.with_index(1) do |card, i|
      printf("%-6s", "#{card}")
      puts "" if i % 8 == 0
    end

    puts <<~TEXT

           
           -------------------------------------------------------


         TEXT
  end
end
