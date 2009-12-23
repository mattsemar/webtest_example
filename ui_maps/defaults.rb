##- Base ui_map definitions

# Paths to various pages on site
@path= "/index.jsp"

# Text values for various parts of the site
@logged_in_text = "Logged in as "

# specific to login
@login = { }
@login[:login_btn_lctr] = "loginimage"
@login[:user_id_lctr] = "id_email"
@login[:password_lctr] = "id_password"
@login[:login_page_submit_btn] = "//input[@value='Log in']"

#******************************************
#Keywords specific mappings
#******************************************
@keyword = { }
@keyword[:path] = "/manageKeywords"
@keyword[:create_btn_lctr] = "//div[@id='bigMenu']/span[1]/span[2]"
@keyword[:new_keywd_ta_lctr] = "newKeywordBox"
@keyword[:submit_keyword_creation_btn_lctr]    = "//input[@value='Create']"
