class LanceController < ApplicationController
  def enviar
    HTTParty.post("http://#{AppConfig['node_host']}/lance?token=#{AppConfig['node_token']}", 
      :headers => {"Content-Type" => "application/json"},
      :body => {:texto => params[:texto], :link => params[:link]}.to_json
    )
    flash[:notice] = "lance enviado com sucesso"
    redirect_to :novo
  end
end
