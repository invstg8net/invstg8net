class Researcher < ActiveRecord::Base
  has_many :answers

  def self.select_researchers_for_question(question)
    return Researcher.order('RANDOM()').limit(3).all #TODO - Something smarter than this please
  end
end