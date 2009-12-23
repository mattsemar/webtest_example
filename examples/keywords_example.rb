module KeywordsExample

  def generate_keyword
    "testkeyword#{(rand * 1000).to_i}"
  end


  def run_create_keyword_example(options = { } )

    options = { :should_succeed => true, :keyword => generate_keyword() }.merge(options)

    page.open(ui[:path])
    page.click ui[:create_btn_lctr]
    page.type ui[:new_keywd_ta_lctr], options[:keyword] # "newKeywordBox"
    page.click ui[:submit_keyword_creation_btn_lctr]   , :wait_type => :page



    
  end



end
