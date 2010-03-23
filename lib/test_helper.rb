module TestHelper


  def login()
    page.open "/"
    fill_login
    debugger if logged_in? != true
  end

  def fill_login()
    page.type @ui_map.login[:user_id_lctr], @user
    page.type @ui_map.login[:password_lctr], @password
    click_wait @ui_map.login[:login_page_submit_btn]
  end

  def logged_in?
    @ui_map.logged_in_check.call(page)
  end

  def logout()
    location = page.location
    click_wait("link=Logout")
    page.open(location)
  end


  # Click an object and wait for the browser to catch up
  # use :wait_type => :ajax_request_count_zero to use the selenium.wait_for_condition functionality to make sure no
  # more ajax requests are being serviced.
  def click_wait(locator, options = {} )
    options = { :duration => 30, :hover_locator => nil,  :wait_type => :page }.merge(options)
    duration = options[:duration]
    hover_locator = options[:hover_locator]
    capture = options[:capture]
    wait_type = options[:wait_type]

    if hover_locator
      begin
        $logger.debug "hovering over #{hover_locator}"
        @selenium.mouse_over(hover_locator)
        @selenium.wait_for_element(locator, :timeout_in_seconds => duration)
      rescue Exception => e
        $logger.error e
      end
    end
    if wait_type == :ajax_request_count_zero
#        puts "using new wait type"
      @selenium.click(locator)
      @selenium.wait_for_condition("typeof(selenium.browserbot.getCurrentWindow().Ajax) != 'undefined' && selenium.browserbot.getCurrentWindow().Ajax.activeRequestCount == 0;", 30);
    else
      @selenium.click(locator, :wait_for => wait_type)
    end

  end

  def rand_num(lower, upper)
    sz = (upper - lower) + 1
    rand(sz) + lower
  end

  def rand_indexes(lower, upper)
    left = rand_num(lower, upper)
    left -= 1 if left == upper
    right = rand_num(left+1, upper)
    [ left, right ]
  end

  # Using a selenium element locator, return href attribute
  def link_href(locator)
    page.get_eval("this.browserbot.findElement('#{locator}')")
  end

  # If the user is logged out and we want them to be logged in, log them in
  # If they are logged out and we want logged in. Log them out
  def sync_login_status(should_be_logged_in)
    if should_be_logged_in and !logged_in?
      login()
    elsif !should_be_logged_in and logged_in?
      logout()
    end
  end

end
