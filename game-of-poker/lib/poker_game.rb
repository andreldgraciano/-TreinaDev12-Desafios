class PokerGame
  def structure_hands(hands)
    hands = hands.split("\n")
    hands.each do |hand|
      name0_hand1 = hand.split(':')
      hand = name0_hand1[1].strip.gsub(/10/, 'X')
      cards = hand.chars.each_slice(2).map(&:join)
      cards.map! { |item| item.chars }
      cards.map! { |item| item[0] = item[0].to_i if item[0].match?(/\d/); item }
      cards.map! do |item|
        item[0] = case item[0]
          when "A"
            1
          when "X"
            10
          when "J"
            11
          when "Q"
            12
          when "K"
            13
          else
            item[0]
          end
        item
      end
      @players << {name: name0_hand1[0], hand: cards}
    end
  end
  
  def initialize(hands)
    @players = []
    structure_hands(hands)
  end
  
  def analyze_hand(hand, name)
    value_card = hand.map(&:first)
    value_card.sort!

    suits_card = hand.map { |hand| hand[1] }

    count = Hash.new(0)
    hand.each do |card|
      value = card[0]
      count[value] += 1
    end

    number_of_pairs = count.values.count(2)

    return "#{name}: Sequência de mesmo naipe" if suits_card.all? { |suit| suit == suits_card[0] } && value_card.each_cons(2).all? { |a, b| b == a + 1 }
    
    return "#{name}: Quadra" if count.any? { |_, amount| amount == 4 }
    
    return "#{name}: Fullhouse" if count.values.sort == [2, 3]
    
    return "#{name}: Flush" if suits_card.all? { |suit| suit == suits_card[0] }
    
    return "#{name}: Sequência" if value_card.each_cons(2).all? { |a, b| b == a + 1 }
    
    return "#{name}: Trio" if count.any? { |_, amount| amount == 3 }
    
    return "#{name}: Dois Pares" if number_of_pairs == 2
    
    return "#{name}: Par" if count.any? { |_, amount| amount == 2 }
    
    return "#{name}: Carta"
  end

  def sort_output(output)
    hierarchy = {
    "Sequência de mesmo naipe" => 0,
    "Quadra" => 1,
    "Fullhouse" => 2,
    "Flush" => 3,
    "Sequência" => 4,
    "Trio" => 5,
    "Dois Pares" => 6,
    "Par" => 7,
    "Carta" => 8
    }

    output.sort_by! { |hand| hierarchy[hand.split(": ")[1]] }
  end

  def play
    output = []
    @players.each do |player|
      player_hand = analyze_hand(player[:hand], player[:name])
      output << player_hand
    end
    output = sort_output(output)
  end
end
