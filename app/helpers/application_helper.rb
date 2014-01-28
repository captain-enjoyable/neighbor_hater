module ApplicationHelper
  def random_taunt
    TauntRepository.random
  end
end
