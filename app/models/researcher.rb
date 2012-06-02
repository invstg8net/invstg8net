class Researcher < ActiveRecord::Base
  has_many :answers

  def self.select_researchers_for_question(question)
    return Researcher.limit(3).all #TODO
  end
end