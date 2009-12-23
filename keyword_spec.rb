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
    run_create_keyword_example(:should_succeed => false, :keyword => "mad", :message => ui[:keyword_used_msg])
  end

  it "should handle attempt to create a keyword that is too long" do
    run_create_keyword_example(:should_succeed => false, :keyword => create_keyword(:min_sz => 25), :message => ui[:keyword_length_msg])
  end


  

end
