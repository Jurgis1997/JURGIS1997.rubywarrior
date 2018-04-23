class Player

  def play_turn(warrior)
    while space.wall(:backward) == true
      if !warrior.feel(:backward).wall? && !warrior.feel(:backward).captive?
        going_back(warrior)
      elsif warrior.feel(:backward).captive?
        warrior.rescue!(:backward)
    end
    if warrior.feel.captive?
      warrior.rescue!
    elsif !warrior.feel.empty?
      warrior.attack!
    elsif warrior.health < 20 && !taking_damage?(warrior)
      warrior.rest!
    else
      warrior.walk!
    end
    @health = warrior.health
  end
  def taking_damage?(warrior)
    warrior.health < @health
  end
  def going_back(warrior)
    warrior.walk!(:backward)
  end
end
