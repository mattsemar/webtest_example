require File.expand_path(File.dirname(__FILE__) + "/spec_helper")

describe "Main Page" do
  include  MainExample, TestHelper

  attr_accessor :ui

  def setup_aux()
    @ui = @ui_map.main
    page.open(@url)
  end

  context "nominate hero link" do

    context "when user logged out" do
      it "should display login page" do
        run_click_nominate(:logged_in => false, :prompt_login => true)
      end
    end

    context "when user logged in" do
      it "should bypass login page" do
        run_click_nominate(:logged_in => true, :prompt_login => false)
      end
    end


  end


end
