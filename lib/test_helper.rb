module TestHelper


  def login()
    page.open "/"
    page.type @ui_map.login[:user_id_lctr], @user
    page.type @ui_map.login[:password_lctr], @password
    click_wait @ui_map.login[:login_page_submit_btn]

    debugger if logged_in? != true

  end

  def logged_in?
    page.is_element_present("navAccountLink") 
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


end
