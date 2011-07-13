class Search < ActiveRecord::Base
  
  def posts
    @posts ||= find_posts
  end

  private

  def find_posts
    Post.find(:all, :conditions => conditions)
  end

  def keyword_conditions
    ["posts.title LIKE ?", "%#{keywords}%"] unless keywords.blank?
  end

  def minimum_price_conditions
    ["posts.price >= ?", minimum_price] unless minimum_price.blank?
  end

  def maximum_price_conditions
    ["posts.price <= ?", maximum_price] unless maximum_price.blank?
  end

  def category_conditions
    ["posts.category_id = ?", category_id] unless category_id.blank?
  end

  def conditions
    [conditions_clauses.join(' AND '), *conditions_options]
  end

  def conditions_clauses
    conditions_parts.map { |condition| condition.first }
  end

  def conditions_options
    conditions_parts.map { |condition| condition[1..-1] }.flatten
  end

  def conditions_parts
    private_methods(false).grep(/_conditions$/).map { |m| send(m) }.compact
  end
      
end
