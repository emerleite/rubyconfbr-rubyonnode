require 'spec_helper'

describe LanceController do
  it 'should post to emerleite.no.de' do
    lance = {:equipe => 'flamengo', :texto => 'Gol do Flamengo'}
    
    HTTParty.should_receive(:post).with("http://#{AppConfig['node_host']}/lance?token=#{AppConfig['node_token']}",
      :headers => {"Content-Type" => "application/json"},
      :body => lance.to_json)
    post :enviar, :equipe => 'flamengo', :texto => 'Gol do Flamengo'
    
    flash[:notice].should eq("lance enviado com sucesso")
    response.should redirect_to :action => "novo"
  end
end
