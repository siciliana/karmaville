class User < ActiveRecord::Base
  has_many :karma_points

  attr_accessible :first_name, :last_name, :email, :username, :karma_sum 

  # validates :first_name, :presence => true
  # validates :last_name, :presence => true

  # validates :username,
  #           :presence => true,
  #           :length => {:minimum => 2, :maximum => 32},
  #           :format => {:with => /^\w+$/},
  #           :uniqueness => {:case_sensitive => false}

  # validates :email,
  #           :presence => true,
  #           :format => {:with => /^[\w+\-.]+@[a-z\d\-.]+\.[a-z]+$/i},
  #           :uniqueness => {:case_sensitive => false}


  # default_scope order("karma_points_count DESC")
  
  def self.by_karma
    # joins(:karma_points).group('users.id').order('SUM(karma_points.value) DESC')
  end

  def total_karma
    self.karma_points.sum(:value)
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def update_total_karma
    self.update_attributes(:karma_sum => total_karma)
  end

end
