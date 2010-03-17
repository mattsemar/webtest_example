##- Base ui_map definitions

# Paths to various pages on site
@path = ""

# Text values for various parts of the site
@logged_in_check = Proc.new{ |browser| browser.element?("navAccountLink") }

# specific to login
@login = { }
@login[:user_id_lctr] = "email"
@login[:password_lctr] = "pass"
@login[:login_page_submit_btn] = "//input[@value='Login']"


@quiz =  { }
@quiz[:path] =                        "http://apps.facebook.com/crunchchallenge/teams"
@quiz[:play_game_btn] =               "//img[@alt='Play Game']"
@quiz[:play_game_verification_txt] =  "Ready to play?"

#******************************************
#search specific mappings
#******************************************
@search = { }
@search[:path] = "/"
@search[:search_field] = "q"
@search[:search_btn] = "//button[@type='submit']"
@search[:view_app] = "link=View Application"
@search[:app_id_regex] = /id=222136570931/


#@search[:count_keywords_scpt] = "window.document.getElementsByClassName('keywordname', null, window.document).length / 2"



#


