class RenameSecurityAnswerDigestColumns < ActiveRecord::Migration[8.0]
  def change
    rename_column :users, :security_answer_1_digest, :security_answer_1
    rename_column :users, :security_answer_2_digest, :security_answer_2
  end
end
