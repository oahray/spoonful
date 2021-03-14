# frozen_string_literal: true

require 'rails_helper'

describe RecipesHelper do
  before do
    allow(ENV).to receive(:fetch)
      .with('default_per_page')
      .and_return('10')
  end

  describe '#total_pages' do
    it 'returns the total pages based on total count and limit' do
      expect(helper.total_pages(100)).to be(10)
      expect(helper.total_pages(52)).to be(6)
    end
  end

  describe '#page' do
    it 'returns page value in params' do
      allow(helper).to receive(:params)
        .and_return({ page: 3 })

      expect(helper.page).to be(3)
    end

    it 'defaults to page 1' do
      expect(helper.page).to be(1)
    end
  end

  describe '#skip' do
    it 'returns 0 for page 1' do
      allow(helper).to receive(:page)
        .and_return(1)

      expect(helper.skip).to be(0)
    end

    it 'returns correct skip for pages' do
      allow(helper).to receive(:page)
        .and_return(3)

      expect(helper.skip).to be(20)
    end
  end

  describe '#limit' do
    context 'if per_page is not sent in params' do
      it 'returns default page limit' do
        expect(helper.limit).to be(10)
      end
    end

    context 'if per_page is not sent in params' do
      it 'returns per_page in params' do
        allow(helper).to receive(:params)
          .and_return({ per_page: 2 })

        expect(helper.limit).to be(2)
      end
    end
  end

  describe '#page_link' do
    context 'when page number is less than 2' do
      it 'returns link for first page' do
        expect(helper.page_link(1)).to eq('/recipes?page=1&per_page=10')
        expect(helper.page_link(0)).to eq('/recipes?page=1&per_page=10')
        expect(helper.page_link(-5)).to eq('/recipes?page=1&per_page=10')
      end
    end

    it 'returns correct page link' do
      expect(helper.page_link(2)).to eq('/recipes?page=2&per_page=10')
      expect(helper.page_link(14)).to eq('/recipes?page=14&per_page=10')
    end
  end

  describe '#pagination_data' do
    it 'returns pagination data' do
      allow(helper).to receive(:page)
        .and_return(2)

      result = helper.pagination_data(5)
      expect(result[:current_page]).to eq(2)
      expect(result[:last_page]).to eq(5)
      expect(result[:first_page_path]).to eq('/recipes?page=1&per_page=10')
      expect(result[:previous_page_path]).to eq('/recipes?page=1&per_page=10')
      expect(result[:next_page_path]).to eq('/recipes?page=3&per_page=10')
      expect(result[:last_page_path]).to eq('/recipes?page=5&per_page=10')
    end
  end
end
