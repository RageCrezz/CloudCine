class AddUsernameAndSecurityQuestionsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :username, :string
    add_column :users, :security_question_1, :string
    add_column :users, :security_answer_1_digest, :string
    add_column :users, :security_question_2, :string
    add_column :users, :security_answer_2_digest, :string

    # Add a unique index for the username
    add_index :users, :username, unique: true
  end
end
