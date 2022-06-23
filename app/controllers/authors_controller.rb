class AuthorsController < ApplicationController
  def index
    #render the view app/views/articles/index.html.erb
    authors = Author.all
    @author = authors.first
    @user = @author.user


  end
end
