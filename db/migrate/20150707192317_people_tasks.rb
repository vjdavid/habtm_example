class PeopleTasks < ActiveRecord::Migration
  def change
    create_table :people_tasks, id: false do |t|
      t.belongs_to :person, index: true
      t.belongs_to :task, index: true
    end
  end
end
