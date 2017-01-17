require 'rails_helper'


feature 'a message indicating there are no jobs posted' do

  scenario 'display blank page' do
    visit '/jobs'
    expect(page).to have_content('No job posted')
  end
end

feature 'job have been added' do

  before do
    Job.create(title: 'junior dev', description: 'we need someone to create a CMS for our job system',
    permanent: true)
  end

  scenario 'display jobs' do
    visit '/jobs'
    expect(page).to have_content('junior dev')
    expect(page).not_to have_content('No job posted')
  end
end
