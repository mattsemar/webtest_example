require File.expand_path(File.dirname(__FILE__) + "/spec_helper")

describe "Quiz" do
  include  QuizExample, TestHelper

  attr_accessor :ui

  def setup_aux()
    @ui = @ui_map.quiz
    login() if !logged_in?
    page.open("http://apps.facebook.com/crunchchallenge/teams")
  end
  
  it "should show quiz when Play Game link is clicked" do
    run_play_game :should_succeed => true,
                  :verification_text => ui[:play_game_verification_txt]
  end

  
end
