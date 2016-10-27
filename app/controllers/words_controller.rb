get '/words' do
  @words = Word.all
  erb :"/words/index"
end

get '/words/new' do
  @word = Word.new
  erb :"/words/new"
end

get '/words/:id' do
  id = params[:id]
  @word = Word.find_by_id(id)
  #@anagrams = Word.find_anagrams(@word)
  erb :"/words/show"
end

post '/words' do
		@word = Word.create(text: params[:word])
   redirect "/words/#{@word.id}"
end