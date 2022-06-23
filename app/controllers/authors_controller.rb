class AuthorsController < ApplicationController
  def index
    #render the view app/views/articles/index.html.erb
    @authors = Author.all



  end
end
