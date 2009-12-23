module KeywordsExample

  def generate_keyword()
    "kwd#{(rand * 1000).to_i}"
  end

  def create_keyword(options = { })
    options = { :min_sz => 2, :max_sz => 8 }.merge(options)

    ret = generate_keyword()
    while ( ret.length < options[:min_sz] )
      ret += generate_keyword
    end

    ret[0..rand_num(options[:min_sz], options[:max_sz] - 1)]
  end


  def count_keywords
    page.get_eval(ui[:count_keywords_scpt]).to_i
  end

  def run_create_keyword_example(options = { } )

    options = { :should_succeed => true,
                :keyword => create_keyword(),
                :message => "error message we expect from the server "
    }.merge(options)

    page.open(ui[:path])

    expected_num_keywords = count_keywords() + ( options[:should_succeed] ? 1 : 0 )


    page.click ui[:create_btn_lctr]
    page.type ui[:new_keywd_ta_lctr], options[:keyword] # "newKeywordBox"
    click_wait ui[:submit_keyword_creation_btn_lctr]

    count_keywords.should eql expected_num_keywords
    if options[:should_succeed]
      page.text(ui[:last_keyword_lctr]).should eql options[:keyword]
    else
      page.text?(options[:message]).should be_true
    end
  end




end
