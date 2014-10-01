class Dragon
  attr_accessor :name, :magical, :age

  def initialize(opts = {})
    @magical = opts.fetch(:magical, false)
  end

  def fly
    'flying'
  end

  def breathe_fire
    if @magical
      'screaming villagers'
    else
      'air'
    end
  end

  def lay_eggs
    if age > 21
      "just layed #{egg_count} eggs!"
    else
      time_left = (21 - @age)
      "you still have #{time_left} years"
    end
  end

  def hatch!
    if egg_count
      egg_count.times do
        Dragon.new
      end
    end
  end

  def egg_count
    @egg_count ||= rand(10)
  end

  # can fly
  # has a name
  # can only breathe fire if its magical
  # has an age
  # can hatch eggs
end
