class CreateQuestions < ActiveRecord::Migration
  def self.up
    create_table :questions do |t|
      t.integer :survey_id
      t.string :question_text
      t.string :question_type

      t.timestamps
    end
  end

  def self.down
    drop_table :questions
  end
end
