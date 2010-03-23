##- Base ui_map definitions

@user = "mattlsemar@yahoo.com"
@password = "password1234"

# Paths to various pages on site
@url = "http://www.facebook.com"

# Text values for various parts of the site
@logged_in_check = Proc.new{ |browser| browser.element?("navAccountLink") }

# specific to login
@login = { }
@login[:user_id_lctr] = "email"
@login[:password_lctr] = "pass"
@login[:login_page_submit_btn] = "//input[@value='Login']"

@login[:login_prompt_text] = "Login to Facebook to enjoy the full functionality of "


@quiz =  { }
@quiz[:path] =                        "http://apps.facebook.com/crunchchallenge/teams"
@quiz[:play_game_btn] =               "//img[@alt='Play Game']"
@quiz[:play_game_verification_txt] =  "Ready to play?"

#******************************************
#main page specific mappings
#******************************************
@main = { }

#@search[:count_keywords_scpt] = "window.document.getElementsByClassName('keywordname', null, window.document).length / 2"



#


