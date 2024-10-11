require 'spec_helper'

describe PotionShop do
  it '1.Vende poções para koffeah e recebe 40 moedas' do
    potions = { healing: { price: 10, herb: 3 } }
    ingredients = { herb: 12 }
    customers= { koffeah: { healing: 4 } }
    order_delivered = { koffeah: 40 }

    expect(PotionShop.new(potions, ingredients).sell(customers)).to eq order_delivered
  end

  it '2.Vende poções para pamb e recebe 15 moedas' do
    potions = { healing: { price: 10, herb: 3 },
                antivenon: { price: 5, herb: 1, snake: 1 } }
    ingredients = { herb: 4, snake: 2 }
    customers= { pamb: { healing: 1, antivenon: 1 } }
    order_delivered = { pamb: 15 }

    expect(PotionShop.new(potions, ingredients).sell(customers)).to eq order_delivered
  end

  it '3.Vende poções para pamb, recebe 8 moedas' do
    potions = { small_healing: { price: 3, herb: 1 },
                antigas: { price: 5, herb: 1, mushroom: 1 } }
    ingredients = { herb: 4, mushroom: 2 }
    customers= { koffeah: { small_healing: 2 },
                 pamb: { small_healing: 1, antigas: 1 } }
    order_delivered = { pamb: 8 }

    expect(PotionShop.new(potions, ingredients).sell(customers)).to eq order_delivered
  end

  it '4.Não vende poções porque faltam ingredientes para pedido completo' do
    potions = { healing: { price: 10, herb: 3 },
                antivenon: { price: 5, herb: 1, snake: 1 } }
    ingredients = { herb: 4, snake: 2 }
    customers= { pamb: { healing: 1, antivenon: 2 } }
    order_delivered = { }

    expect(PotionShop.new(potions, ingredients).sell(customers)).to eq order_delivered
  end

  it '5.Vende poções para sheinoo e recebe 20 moedas' do
    potions = { tafmanne: { price: 15, herb: 3, alcohol: 3, caffeine: 1 },
                omeprazol: { price: 5, herb: 1, salt: 1, calcium: 3 } }
    ingredients = { herb: 4, caffeine: 2, salt: 10, calcium: 5, alcohol: 3 }
    customers= { komma: { omeprazol: 2, tafmanne: 1 },
                 sheinoo: { tafmanne: 1, omeprazol: 1 } }
    order_delivered = { sheinoo: 20 }

    expect(PotionShop.new(potions, ingredients).sell(customers)).to eq order_delivered
  end

  it '6.Não vende pedido se não tiver receita para alguma das poções' do
    potions = { nescau: { price: 5, milk: 3, cacao: 5 },
                avocado_vitamin: { price: 12, avocado: 1, milk: 1 } }
    ingredients = { herb: 4, milk: 2, avocado: 2 }
    customers= { ampeeh: { nescau: 1, gelol: 2 } }
    order_delivered = { }

    expect(PotionShop.new(potions, ingredients).sell(customers)).to eq order_delivered
  end

  it '7.Vende apenas para o cliente cujo pedido dá mais moedas' do
    potions = { mana: { price: 15, stardust: 3, bicornhorn: 1 },
                polyjuice: { price: 10, bicornhorn: 1, bitofperson: 1 } }
    ingredients = { herb: 4, bicornhorn: 1, stardust: 3, bitofperson: 1 }
    customers= { komma: { mana: 1 },
                 sheinoo: { polyjuice: 1 } }
    order_delivered = { komma: 15 }

    expect(PotionShop.new(potions, ingredients).sell(customers)).to eq order_delivered
  end

  it '8.Vende apenas para o cliente cujo pedido dá mais moedas' do
    potions = { malevolent: { price: 15, stardust: 3, bicornhorn: 1, horseradish: 1 },
                polyjuice: { price: 10, bicornhorn: 1, bitofperson: 1, herb: 3 },
                luck: { price: 35, egg: 2, horseradish: 3, squill: 3, water: 1 },
                amortentia: { price: 30, egg: 1, rose: 1, peppermint: 1, moonstone: 1, squill: 1 },
                aquavitae: { price: 15, herb: 3, water: 4, rose: 3, peppermint: 1 } }
    ingredients = { herb: 8, bicornhorn: 3, stardust: 3, bitofperson: 1,
                    peppermint: 3, squill: 3, egg: 4, horseradish: 4, water: 5,
                    rose: 2, moonstone: 1 }
    customers= { scimna: { amortentia: 1 },
                 camnos: { luck: 1, malevolent: 1 },
                 dhiamilyth: { polyjuice: 1, gatorade: 1 },
                 gryrnafas:{ aquavitae: 1, amortentia: 2 },
                 elribyh: { malevolent: 3, luck: 1 } }
    order_delivered = { camnos: 50 }

    expect(PotionShop.new(potions, ingredients).sell(customers)).to eq order_delivered
  end
end
