get '/words' do
  @words = Word.all
  erb :"/words/index"
end

get '/words/:id' do
  id = params[:id]
  @word = Word.find_by_id(id)
  #@anagrams = Word.find_anagrams(@word)
  erb :"/words/show"
end

post '/' do
	@word = params[:word]
	begin
		Word.valid_input(@word)
		redirect "/anagrams/#{@word}"
	rescue Exception => error
		@error = error.message
		erb :index
	end
end