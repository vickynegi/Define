class AuthorsController < ApplicationController
  def index
    @author = Author.all
  end

  def create
    Author.create(first_name:params['first_name'], last_name: params['last_name'], dob: params['dob'])
    
  end

  def edit
  end

  def update
    @author = Author.find_by(id: params['id'])
    response = {}
    if @author.update(first_name:params['first_name'], last_name: params['last_name'], dob: params['dob'])
      response = {status: 200, 'message' => 'Record has been Updated'}
    else
      response = {status: 400, 'message' => 'Record has not been Updated'}
    end
    render json: response
  end

  def delete
    @author = Author.find_by(id: params['id'])
    if @author.delete
      response = {status: 200, 'message' => 'Record has been deleted'}
    else
      response = {status: 200, 'message' => 'Record has not been deleted'}
    end
    render json: response
  end

  def new
  end

  def show
    @author = Author.find_by(id: params[:id])
    @arr = []
    @arr << @author
    @arr << @author.books
    render :json => { :html_content => @arr }
  end
end
