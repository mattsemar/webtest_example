module TestHelper


  def login()
    page.open "/"
    page.click @ui_map.login[:login_btn_lctr], :wait_type => :page
    
    page.type @ui_map.login[:user_id_lctr], @user
    page.type @ui_map.login[:password_lctr], @password
    page.click @ui_map.login[:login_page_submit_btn], :wait_type => :page
    logged_in?.should be_true

  end

  def logged_in?
    page.text(@ui_map.logged_in_text)   == true
  end


end
