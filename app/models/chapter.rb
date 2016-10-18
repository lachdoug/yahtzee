class Chapter < ApplicationRecord

  has_many :pages

  default_scope { order(order: :asc) }

  after_initialize :set_defaults

  def next_chapter
    return nil if self == self.class.all.last
    self.class.all.select{ |p| p.order > self.order }.first
  end

  def previous_chapter
    return nil if self == self.class.all.first
    self.class.all.reverse.select{ |p| p.order < self.order }.first
  end

  private

  def set_defaults
    self.order ||= ( self.class.all.last || self ).order.to_i + 1
  end

end
