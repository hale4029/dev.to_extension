require "rails_helper"

RSpec.describe "Collection", type: :feature do

  before :each do
    user = create(:user)
    @collection = create(:container, user_id: user.id)
    @article_1 = create(:article)
    @article_2 = create(:article)
    @article_3 = create(:article)
    @collection.articles << @article_1
    @collection.articles << @article_2
    @collection.articles << @article_3
    allow_any_instance_of(SessionCurrentUser).to receive(:session_current_user_id).and_return(user.id)
  end

  describe "visit collections page" do
    it "returns colection page" do
      visit "/collections"
      expect(page).to have_content("Collections")
    end

    it "visit collection show page" do
      visit "/collections"
      click_on "#{@collection.name}"
      expect(current_path).to eq("/collections/#{@collection.id}")
      expect(page).to have_content("#{@collection.name}")
      expect(page).to have_content("#{@article_1.title}")
      expect(page).to have_content("#{@article_2.title}")
      expect(page).to have_content("#{@article_3.title}")
    end
  end
end

  #   describe "PUT reading_list_items/:id" do
  #     it "returns archives item if no param" do
  #       put "/reading_list_items/#{reaction.id}"
  #       expect(reaction.reload.status).to eq("archived")
  #     end

  #     it "unarchives an item if current_status is passed as archived" do
  #       put "/reading_list_items/#{reaction.id}", params: { current_status: "archived" }
  #       expect(reaction.reload.status).to eq("valid")
  #     end

  #     it "raises NotAuthorizedError if current_user is not the reaction user" do
  #       expect { put "/reading_list_items/#{unauthorized_reaction.id}" }.to raise_error Pundit::NotAuthorizedError
  #     end
  #   end
#end
