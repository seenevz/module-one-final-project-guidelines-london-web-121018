class Pokemon < ActiveRecord::Base
belongs_to :battles
belongs_to :trainers, trough: :battles    
end
