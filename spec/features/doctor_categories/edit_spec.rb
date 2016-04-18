require 'spec_helper'
require 'rails_helper'

feature 'Edit Doctor Category' do

  scenario 'Edit doctor category from index page' do
  	dc = FactoryGirl.create(:doctor_category)
    visit "doctor_categories/#{dc.id}/edit"
    fill_in "doctor_category_name", :with => "My test name"
    click_button "Submit"
    expect(page).to have_content 'Doctorcategory was successfully updated'
  end

  scenario 'Edit doctor category with blank name' do
  	dc = FactoryGirl.create(:doctor_category)
    visit "doctor_categories/#{dc.id}/edit"
    fill_in "doctor_category_name", :with => ""
    click_button "Submit"
    expect(page).to have_content 'Edit Doctor Category'
  end


  scenario 'Edit doctor category with alpha numeric letters' do
  	dc = FactoryGirl.create(:doctor_category)
    visit "doctor_categories/#{dc.id}/edit"
    fill_in "doctor_category_name", :with => "45565**%$^"
    click_button "Submit"
    expect(page).to have_content 'Edit Doctor Category'
  end

end