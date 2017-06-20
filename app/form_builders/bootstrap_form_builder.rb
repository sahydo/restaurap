class BootstrapFormBuilder < ActionView::Helpers::FormBuilder
	#delegamos ciertos metodos a un objeto
	delegate :content_tag, to: :@template
	#metaprogramación en ruby
	[:password_field,:file_field,:text_field,:text_area,:url_field,:email_field,:number_field].each do |metodo|
		#*args recibe todo lo que se escribe despues del primer argumento del input en el _form
		
		#define un metodo para todos los fields en el arreglo
		define_method metodo do |name, *args|
			options = args.extract_options!
			additional_classes = "form-control floating-label"
			if options.has_key?(:class)
				options[:class] += additional_classes
			else
				options[:class] = additional_classes
			end
			#para crear html
			options[:placeholder] = name.capitalize
			content_tag :div, class:"form-group" do
				super(name,options)
			end
		end
	end	

	def errors
		#object hace referencia al producto @producto que se quiere guardar
		if object.errors.any?
			content_tag :div, class:"red large-padding white-text" do
				content_tag(:h2, "Errores") +
				content_tag(:ul) do
					lis = ""
					object.errors.full_messages.each do |err|
						lis+= content_tag :li, err
					end
					lis.html_safe
				end
			end	
		end
	end

	def submit(*args)
		content_tag :div do
			super(*args,class:"btn btn-success")
		end
	end
end