require File.expand_path(File.dirname(__FILE__) + "/spec_helper")

describe "Keywords" do
  include  KeywordsExample, TestHelper

  attr_accessor :ui


  def setup_aux()
    @ui = @ui_map.keyword

    login() if !logged_in?
  end
  
  it "should allow user to create keyword" do
    run_create_keyword_example(:should_succeed => true)
  end

  it "should prevent creation of duplicate keywords" do
    run_create_keyword_example(:should_succeed => false, :keyword => "mad")
  end

  

end
