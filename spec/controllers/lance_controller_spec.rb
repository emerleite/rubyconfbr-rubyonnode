require 'spec_helper'

describe LanceController do
  it 'should post to emerleite.no.de' do
    lance = {:texto => 'Gol do Flamengo', :link => 'http://www.youtube.com/watch?v=zr3N1hm7W7M'}
    HTTParty.should_receive(:post).with("http://emerleite.no.de/lance",
      :headers => {"Content-Type" => "application/json"},
      :body => lance.to_json)
    post :enviar, :texto => 'Gol do Flamengo', :link => 'http://www.youtube.com/watch?v=zr3N1hm7W7M'
    flash[:notice].should eq("lance enviado com sucesso")
    response.should redirect_to :action => "novo"
  end
  
  it 'it should render index template' do
    get :novo
    response.should render_template("lance/novo")
  end
end
