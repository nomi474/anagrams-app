get '/words' do
  @words = Word.all
  erb :"/words/index"
end

get '/words/new' do
  @word = Word.new
  erb :"/words/new"
end

	get '/words/:id/edit' do
		@word = Word.find(params[:id])
		erb :'/words/edit'		
	end

get '/words/:id' do
  @word = Word.find(params[:id])
  #@anagrams = Word.find_anagrams(@word)
  erb :"/words/show"
end


put '/words/:id' do
		@word = Word.find(params[:id])
		@word.text = params[:text]
		@word.save
		erb :"/words/show"
	end
	
post '/words' do
		@word = Word.create(text: params[:text])
   redirect "/words/#{@word.id}"
end

