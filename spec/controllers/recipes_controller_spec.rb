require 'spec_helper'

describe RecipesController do
  render_views
  describe "index" do
    before do
      Recipe.create!(name: 'Анализ крови')
      Recipe.create!(name: 'Анализ мочи')
      Recipe.create!(name: 'Анализ кала')
      Recipe.create!(name: 'Развернутый анализ крови')

      xhr :get, :index, format: :json, keywords: keywords
    end

    subject(:results) { JSON.parse(response.body) }

    def extract_name
      ->(object) { object["name"] }
    end

    context "when the search finds results" do
      let(:keywords) { 'крови' }
      it 'should 200' do
        expect(response.status).to eq(200)
      end
      it 'should return two results' do
        expect(results.size).to eq(2)
      end
      it "should include 'Анализ крови'" do
        expect(results.map(&extract_name)).to include("Анализ крови")
      end
      it "should include 'Развернутый анализ крови'" do
        expect(results.map(&extract_name)).to include("Развернутый анализ крови")
      end
    end

    context "when the search doesn't find results" do
      let(:keywords) { 'foo' }
      it 'should return no results' do
        expect(results.size).to eq(0)
      end
    end
  end
end
