module QuizExample

  def run_play_game(options = { } )

    options = { :should_succeed => true }.merge(options)

    page.click(ui[:play_game_btn])
    sleep 5

    if options[:should_succeed]
      page.text?("Ready to play?").should be_true
    else
      raise "Undefined behavior "
    end
  end




end
