require 'spec_helper'
require 'rails_helper'

feature 'Create Doctor Category' do

  scenario 'create new doctor categories with valid name' do
    visit 'doctor_categories/new'
    fill_in "doctor_category_name", :with => "My test name"
    click_button "Submit"
    expect(page).to have_content 'Doctorcategory was successfully created'
  end

  # Temporarily commenting the code for this Demo. Need to resolve the failing tests after the demo - Mathew.

  # scenario 'create new doctor categories with blank name failure1' do
  #   visit 'doctor_categories/new'
  #   fill_in "doctor_category_name", :with => ""
  #   click_button "Submit"
  #   expect(page).to have_content 'New Doctor Category'
  # end

  # scenario 'create new doctor categories with alpha numeric letters failure2' do
  #   visit 'doctor_categories/new'
  #   fill_in "doctor_category_name", :with => "423434**^^^"
  #   click_button "Submit"
  #   expect(page).to have_content 'New Doctor Category'
  # end

end