class AddDefaultState < ActiveRecord::Migration
  def change
    Survey.find_each do |survey|
      survey.update_attribute(:state, 'initial')
    end
  end
end
