require 'spec_helper'

describe('adding recipe path', {:type => :feature}) do
  it "allows a user to add a recipe" do
    visit('/')
    click_link 'View All Recipes'
    fill_in('name', :with => 'souffle')
    fill_in('ingredient', :with => 'egg')
    fill_in('instruction', :with => 'beat')
    click_button 'Create Recipe'
    expect(page).to have_content 'souffle'
  end
end
