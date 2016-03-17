require 'spec_helper'
require 'rails_helper'

feature 'Create Doctor Category' do

  scenario 'create new doctor categories with valid name' do
    visit 'doctor_categories/new'
    fill_in "doctor_category_name", :with => "My test name"
    click_button "Create Doctor category"
    expect(page).to have_content 'doctor category uploaded'
  end

  scenario 'create new doctor categories with blank name' do
    visit 'doctor_categories/new'
    fill_in "doctor_category_name", :with => ""
    click_button "Create Doctor category"
    expect(page).to have_content 'New Doctor Category'
  end

  scenario 'create new doctor categories with alpha numeric letters' do
    visit 'doctor_categories/new'
    fill_in "doctor_category_name", :with => "423434**^^^"
    click_button "Create Doctor category"
    expect(page).to have_content 'New Doctor Category'
  end

end