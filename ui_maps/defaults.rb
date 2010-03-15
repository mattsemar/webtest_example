##- Base ui_map definitions

# Paths to various pages on site
@path = "/index.jsp"

# Text values for various parts of the site
@logged_in_text = "Logged in as "

# specific to login
@login = { }
@login[:user_id_lctr] = "email"
@login[:password_lctr] = "pass"
@login[:login_page_submit_btn] = "//input[@value='Login']"


@quiz =  { }
@quiz[:path] = "http://apps.facebook.com/crunchchallenge/teams"
@quiz[:play_game_btn] =  "//img[@alt='Play Game']"

#******************************************
#search specific mappings
#******************************************
@search = { }
@search[:path] = "/"
@search[:search_field] = "q"
@search[:search_btn] = "//button[@type='submit']"
@search[:view_app] = "link=View Application"

#@search[:count_keywords_scpt] = "window.document.getElementsByClassName('keywordname', null, window.document).length / 2"



#


