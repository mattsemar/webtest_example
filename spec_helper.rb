require "#{File.dirname(__FILE__)}/require"


Spec::Runner.configure do |config|
  config.before(:all) do
    init()
  end

  config.before(:each) do

  end

  # The system capture need to happen BEFORE the closing the Selenium session
  config.append_after(:each) do
    if actual_failure?
      "extra code for failures goes here"

    end

  end

  config.append_after(:all) do
    @selenium.stop if @selenium.session_started?
  end

  def selenium_driver
    @selenium
  end

  def browser
    @selenium
  end

  def name
    description
  end


  def flunk(message)
    should(nil, message)
  end

  def page
    @selenium
  end

  def init()
    @ui_map = UIMap.new()

    @user = "company@one.com"
    @password = "1"
    @url = "http://dev4-slamtext.castdot.com/"
    if @selenium and !@selenium.session_started?
      @selenium.start
      @selenium.open
    else
      @selenium = Selenium::SeleniumDriver.new("localhost", 4444, "*chrome", @url, 60)
      @selenium.start
    end
    @selenium.open(@url)

    @selenium.window_maximize()
    setup_aux()
  end

end


