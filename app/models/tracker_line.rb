# == Schema Information
#
# Table name: tracker_lines
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  obj_id     :integer
#  obj_type   :string(255)
#

class TrackerLine < ActiveRecord::Base
  attr_accessible :obj_id, :obj_type

  belongs_to :obj, :polymorphic => true

  # So, we store only object in our model. And now we must provide some common values, so you can read it in
  # tracker.

  def title
    # Title of the tracker line
    case obj_type
      when "Post"
        obj.subject
      when "Comment"
        obj.subj
    end
  end
end
