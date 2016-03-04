require 'mechanize'

class Scrapers::AntonScraper 
  def self.login_and_scrape
    agent = Mechanize.new
    url = "https://www.strava.com/login"
    login_page = agent.get(url) #Get the starting page

    puts login_page.title

    email_field = login_page.field_with(id: "email")
    email_field.value = ENV['USER_EMAIL']
    password_field = login_page.field_with(id: "password")
    password_field.value = ENV['USER_PASSWORD']

    agent.click("Log In")
  end


  # loop do
  #   # What you want to do on the page - ex. extract something...
  #   item = page.parser.css('.some_item').text
  #   item.save

  #   if link = page.link_with(:text => "Continue") # As long as there is still a nextpage link...
  #     page = link.click
  #   else # If no link left, then break out of loop
  #     break
  #   end
  # end
end