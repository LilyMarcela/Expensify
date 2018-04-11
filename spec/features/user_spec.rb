require 'rails_helper'

RSpec.feature "Login in" do
  background do
  end
  scenario "the login page exist" do 
    visit new_user_session_path
  end
end
