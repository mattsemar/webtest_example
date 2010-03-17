module QuizExample

  def run_play_game(options = { } )

    options = { :should_succeed => true, :verification_text => "XXXXXXXXXXXXXXXXX" }.merge(options)

    page.click(ui[:play_game_btn])
    sleep 5
#   Here we make sure that the text 'Ready to play?' appears on the page
    if options[:should_succeed]
      page.text?(options[:verification_text]).should be_true
    else
      raise "Don't know what to do in this case."
    end
  end




end
