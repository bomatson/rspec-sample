class Dragon
  attr_accessor :name, :magical, :scales

  def initialize(opts = {})
    @magical = opts.fetch(:magical, false)
  end

  def fly
    'flying'
  end

  # can fly
  # has a name
  # can only breathe fire if its magical
  # has a scale count
  # can hatch eggs
end
