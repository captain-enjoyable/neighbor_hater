class TauntRepository
  def self.random
    taunts.sample
  end

  def self.taunts
    Array.wrap(YAML.load_file(Rails.root.join("config/taunts.yml")))
  end
end