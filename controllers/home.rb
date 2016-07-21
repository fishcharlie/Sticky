class Sticky < Sinatra::Base

  set :method_override, true

  # index
  get '/' do
    @notes = Note.all
    erb(:"home")
  end

  # create
  post '/stickies' do
    @note = Note.new(params[:note])
    if @note.save
      redirect("/")
    else
      erb(:"/stickies/new")
    end
  end

  get '/new/stickies' do
    erb(:"new")
  end

  # delete
  delete '/stickies/:id/delete' do
    @note = Note.find(params[:id])
    if @note.destroy
      redirect('/')
    else
      redirect("/")
    end
  end




end
