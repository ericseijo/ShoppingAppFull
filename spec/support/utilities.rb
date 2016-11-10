include ApplicationHelper

def sign_in(user)
  visit new_user_session_path
  fill_in "Email", with: user.email
  fill_in "Password", with: user.password
  click_button "Sign in"
end

# for use in request specs
def sign_in_as_a_valid_user(profile)
  #@user ||= FactoryGirl.create :user
  post_via_redirect profile_session_path, 'profile[login]' => profile.login, 'profile[password]' => profile.password
end

def last_email
  ActionMailer::Base.deliveries.last
end

def reset_email
  ActionMailer::Base.deliveries = []
end

def select_date(date, options = {})
  field = options[:from]
  select date.year.to_s,   :from => "#{field}_1i"
  select Date::MONTHNAMES[date.month], :from => "#{field}_2i"
  select date.day.to_s,    :from => "#{field}_3i"
end

RSpec::Matchers.define :have_error_message do |message|
  match do |page|
    page.should have_selector('div.alert.alert-error', text: message)
  end
end

RSpec::Matchers.define :be_the_same_time_as do |expected|
  match do |actual|
    expected.to_i == actual.to_i
  end
end
