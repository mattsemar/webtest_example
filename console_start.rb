#$setup.start
@user = "company@one.com"
@password = "1"
@url = "http://dev4-slamtext.castdot.com/"

browser_key = "*chrome"
browser_key = "*chrome ./script/selenium-firefox" unless (`uname -a` =~ /Darwin Kernel Version 10/).nil?
puts "browser_key : #{browser_key}"
@selenium = Selenium::SeleniumDriver.new("localhost", 4444, browser_key,@url , 60)
@selenium.start
@selenium.open("/")

class  T
  include TestHelper

  def initialize(ui_map, password, email, selenium)

    @ui_map = ui_map
    @password = password
    @user = email
    @selenium = selenium
  end

  def page
    @selenium
  end
end

@ui_map = UIMap.new()

t = T.new(@ui_map, @password, @user, @selenium)

