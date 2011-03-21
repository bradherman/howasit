class Survey < ActiveRecord::Base
  belongs_to  :user
  belongs_to  :business
  has_many    :questions
  
  accepts_nested_attributes_for :questions
#  accepts_nested_attributes_for :question_types
  
  validates_presence_of :name
  
  def question_attributes=(question_attributes)
    question_attributes.each do |attributes|
      questions.build(attributes)
    end
  end
end
