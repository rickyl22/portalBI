class AsignadoMailer < ApplicationMailer

	default from: "ricardolira48@gmail.com"


	def asignar(comp,titulo,dias,email)
			@comp = comp
			@titulo = titulo
			@dias = dias
			mail to: email, subject: "Caso Asignado" 
	end

end