class ModifyLandmarks < ActiveRecord::Migration
  def change
  	change_column :landmarks, :figure_id, :integer
  end
end
