# frozen_string_literal: true

class Recipe < ContentfulModel::Base
  # include Contentable
  self.content_type_id = 'recipe'

  def photo_url
    photo&.image_url
  end

  def tag_names
    tags&.map(&:name)
  end

  def chef_name
    chef&.name || 'Anonymous'
  end
end
