#encoding: utf-8

module MessageDialog
  def player_hand_info(**params)
    player = params[:player]

    puts "--------------#{player.name}さんの手札 #{player.hand.size}枚-------------"
    puts ""

    player.hand.each.with_index(1) do |card, i|
      printf("%-6s", "#{card}")
      puts "" if i % 8 == 0
    end

    puts <<~TEXT

           
           ----------------------------------------------


         TEXT
  end
end
