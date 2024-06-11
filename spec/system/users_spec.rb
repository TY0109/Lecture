require 'rails_helper'

RSpec.describe "Users", type: :system do
  describe 'Login処理' do
    before do
      Rails.application.env_config["devise.mapping"] = Devise.mappings[:user]
      Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:line]
    end
    it 'LINEログインボタンを押すとログインできること' do
      visit new_user_session_path
      click_on  'LINE Login'
      expect(page).to have_text 'ログインしました'
    end
  end
end
