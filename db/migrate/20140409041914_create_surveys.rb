class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.string      :title
      t.references  :interviewer, index: true

      t.string      :state

      t.timestamps
    end
  end
end
