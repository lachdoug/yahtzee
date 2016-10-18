class Page < ApplicationRecord

  belongs_to :chapter
  has_many :sections

  default_scope { order(order: :asc) }

  after_initialize :set_defaults

  def next_page
    return start_next_chapter if self == chapter.pages.last
    chapter.pages.find{ |p| p.order > self.order }
  end

  def previous_page
    return end_previous_chapter if self == chapter.pages.first
    chapter.pages.reverse.find{ |p| p.order < self.order }
  end

  def start_next_chapter
    next_chapter = chapter.next_chapter
    return self unless next_chapter.present?
    next_chapter_pages = chapter.next_chapter.pages
    return self unless next_chapter_pages.present?
    next_chapter_pages.first
  end

  def end_previous_chapter
    previous_chapter = chapter.previous_chapter
    return self unless previous_chapter.present?
    previous_chapter_pages = chapter.previous_chapter.pages
    return self unless previous_chapter_pages.present?
    previous_chapter_pages.first
  end

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
    self.order ||= ( chapter.pages.last || self ).order.to_i + 1
  end



end
