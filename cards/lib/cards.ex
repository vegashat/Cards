defmodule Cards do

  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    #Bad option
    #cards = for value <- values do
    #  for suit <- suits do
    #    "#{value} of #{suit}"
    #  end
    #end

    #List.flatten(cards)

    #Good options
    for suit <- suits, value <- values do
        "#{value} of #{suit}"
    end

  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  def deal(deck, numberOfCards) do
    Enum.split(deck, numberOfCards)
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

#  def load(filename) do
#    {status, binary} = File.read(filename)
#    :erlang.binary_to_term(binary)
#  end

  def load(filename) do

    case File.read(filename) do
      {:ok, binary} ->
        :erlang.binary_to_term(binary)
      {:error, _reason } ->
        "That file does not exists"
    end 

  end

   def create_hand(numberOfCards) do
      Cards.create_deck
      |> Cards.shuffle
      |> Cards.deal(numberOfCards)
   end

end
      