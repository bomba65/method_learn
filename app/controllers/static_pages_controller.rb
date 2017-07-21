class StaticPagesController < ApplicationController
  def home
  end

  def about
  end
  
  def console
    @language = "ruby"
  end
  
  def pythonsave
    @code = params[:code]
    path = "hello.py"
    content=@code
    File.open(path, "w+") do |f|
      f.write(content)
    end
  end

  def python

    @value = `python hello.py`

    if $? == 0
      @comand = {"status":1, "output":@value};
    else
      @comand = {"status":2, "output":$?};
    end


    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @comand }
    end
  end

  def rubysave
    @code = params[:code]
    path = "hello.rb"


    content=@code
    File.open(path, "w+") do |f|
      f.write(content)
    end
  end

  def ruby

    @value = `ruby hello.rb`

    if $? == 0
      @comand = {"status":1, "output":@value};
    else
      @comand = {"status":2, "output":$?};
    end


    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @comand }
    end
  end
  
end
