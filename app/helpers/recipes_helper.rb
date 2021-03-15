# frozen_string_literal: true

module RecipesHelper
  def total_pages(total_count)
    (total_count.to_f / limit).ceil
  end

  def page
    (params[:page] || 1).to_i
  end

  def skip
    limit * (page - 1)
  end

  def limit
    (params[:per_page] || ENV['DEFAULT_PER_PAGE']).to_i
  end

  def page_link(page = 1)
    return recipes_path(page: 1, per_page: limit) if page < 2

    recipes_path(page: page, per_page: limit)
  end

  def pagination_data(total_pages)
    {
      current_page: page,
      last_page: total_pages,
      first_page_path: page_link(1),
      previous_page_path: page_link(page - 1),
      next_page_path: page_link(page + 1),
      last_page_path: page_link(total_pages)
    }
  end
end
