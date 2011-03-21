module SurveysHelper
  def add_question_link(name)
    link_to_function name do |page|
      page.insert_html :before, :questions, :partial => "question", :object => Question.new
    end
  end
end