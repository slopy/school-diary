class RemoveStudentsReferencesFromSubjectItems < ActiveRecord::Migration
  def change
    remove_reference :subject_items, :student, index: true, foreign_key: true
  end
end
