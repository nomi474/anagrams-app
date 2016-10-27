module ApplicationHelper
	def word_form_method(word)
		if word.new_record?
			@method = "post"
		else
			@method = "put"
		end
		return @method
	end
	
	def word_form_action(word)
		if word.new_record?
			@action = "/words"
		else
			@action = "/words/#{word.id}"
		end
		return @action
	end
	
	def word_form_class(word)
		if word.new_record?
			@class = "new-word"
		else
			@class = "edit-word"
		end
		return @class
	end
	
	def word_form_id(word)
		id =  params[:id]
		if word.new_record?
			@form_id = "new-word"
		else
			@form_id = "word-#{id}"
		end
		return @form_id
	end	
end