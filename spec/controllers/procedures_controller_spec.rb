require 'spec_helper'

describe ProceduresController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'show'" do
    it "returns http success" do
      get 'show'
      response.should be_success
    end
  end

  describe "GET 'show_procedur'" do
    it "returns http success" do
      get 'show_procedur'
      response.should be_success
    end
  end

end
