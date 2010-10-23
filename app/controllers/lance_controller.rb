class LanceController < ApplicationController
  def enviar
    HTTParty.post("http://emerleite.no.de/lance", 
      :headers => {"Content-Type" => "application/json"},
      :body => {:texto => params[:texto], :link => params[:link]}.to_json
    )
    flash[:notice] = "lance enviado com sucesso"
    redirect_to :novo
  end
end
