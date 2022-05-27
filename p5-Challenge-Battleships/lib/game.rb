require 'ship'

class Game
  def initialize
    @ship_placement = []  # let's assume it's an array first.

    #  @rows and @cols are the board.
    #  rows and cols must be numbers, 
    #  as seen as format_board method
    @rows = 10
    @cols = 10

    # Still not sure how to provide the initial unplaced ship
    ship4 = Ship.new(4)
    ship5 = Ship.new(5)
    ship6 = Ship.new(6)
    @fleet = [ship4, ship5, ship6]
  end

  def unplaced_ships
    #this is an array, as seen as ships_unplaced_message method
    
    return @fleet.select{ |ship| ship.placed == false } # temporary method, probably not final solution
  end

  def rows
    # number
    @rows
  end

  def cols
    # number
    @cols
  end

  def place_ship(placement)
    
    if placement[:orientation] == :horizontal
      col = placement[:col]
      placement[:length].times do
        @ship_placement.push([col, placement[:row]])
        col += 1
      end
    elsif placement[:orientation] == :vertical
      row = placement[:row]
      placement[:length].times do
        @ship_placement.push([placement[:col], row])
        row += 1
      end
    end
  end

  def ship_at?(x, y)
    # return true if ship is here
    # return false if no hsip is here
    return @ship_placement.include?([x, y]) ? true : false
  end

end
