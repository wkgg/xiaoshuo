class Chapter < ActiveRecord::Base
  belongs_to :novels

    def previous(offset = 0)
      self.class.first(:conditions => ['id > ?', self.id], :limit => 1, :offset => offset, :order => "id ASC")
    end

    def next(offset = 0)
      self.class.first(:conditions => ['id < ?', self.id], :limit => 1, :offset => offset, :order => "id DESC")
    end
end
