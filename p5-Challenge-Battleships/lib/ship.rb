class Ship
  def initialize(length)
    @status = {
      length: length,
      orientation: nil,
      placed: false,
      row: nil,
      col: nil,
      alive: true}
  end

  def length
    @status[:length]
  end

  def place(placement)
    @status[:length] = placement[length]
    @status[:orientation] = placement[orientation]
    @status[:row] = placement[row]
    @status[:col] = placement[col]
    @status[:placed] = true
  end

  def placed
    @status[:placed]
  end
end
