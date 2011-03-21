module QuestionsHelper
  def add_question_option_link(name)
    link_to_function name do |page|
      page.insert_html :before, :question_options, :partial => "question_option", :object => QuestionOption.new
    end
  end
end
