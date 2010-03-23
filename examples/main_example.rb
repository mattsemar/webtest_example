module MainExample

  def run_click_nominate(options = { } )

    options = { :logged_in => false,
                :prompt_login => true
    }.merge(options)

    
    sync_login_status(options[:logged_in])

    page.open(@url)
#    click_wait(ui[:tab_lctr], :wait_type => :ajax)
    page.click(ui[:tab_lctr])
    # TODO: Should never use sleep.  Figure out how to get the tab's loaded status using javascript
    sleep 20

    click_wait(ui[:nominate_link])

    if options[:prompt_login]
      page.text?(@ui_map.login[:login_prompt_text]).should be_true
      # TODO: find out if the login page should redirect to the requested url after user logs in
      # if so, uncomment line below and remove return
      # fill_login()
      return
    end

    page.location.should =~ ui[:nominate_loc_regex]

  end




end
