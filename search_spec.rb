require File.expand_path(File.dirname(__FILE__) + "/spec_helper")

describe "Search" do
  include  SearchExample, TestHelper

  attr_accessor :ui


  def setup_aux()
    @ui = @ui_map.search
    login() if !logged_in?
  end
  
  it "should have correct application id in View Application link on search results page" do
    run_search(:should_succeed => true, :term => "Nestle Crunch Challenge")
  end


end
