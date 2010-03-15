module SearchExample

  def run_search(options = { } )

    options = { :should_succeed => true,
                :term => "none",
                :message => "error message we expect from the server "
    }.merge(options)

    page.open(ui[:path])

    page.click ui[:search_field]
    page.type  ui[:search_field], options[:term]
    page.click ui[:search_btn]

    sleep 5

    if options[:should_succeed]
      page.text(ui[:view_app]).should eql "View Application"
    else
      page.text?(options[:message]).should be_true
    end
  end




end
