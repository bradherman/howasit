class Question < ActiveRecord::Base
  belongs_to  :user
  belongs_to  :survey
  has_many    :question_options, :dependent => :destroy
  
  accepts_nested_attributes_for :question_options
  
  def question_option_attributes=(question_option_attributes)
    question_option_attributes.each do |attribs|
      question_options.build(attribs)
    end
  end
end
