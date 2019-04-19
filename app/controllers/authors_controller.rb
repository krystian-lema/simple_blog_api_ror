class AuthorsController < ApplicationController
  before_action :set_author, only: [:show, :update, :destroy]

  # GET /authors
  def index
    @authors = Author.all

    render json: @authors
  end

  # GET /authors/1
  def show
    render json: @author
  end

  # POST /authors
  def create
    @author = Author.new(author_params)

    if @author.save
      render json: @author, status: :created, location: @author
    else
      render json: @author.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /authors/1
  def update
    if @author.update(author_params)
      render json: @author
    else
      render json: @author.errors, status: :unprocessable_entity
    end
  end

  # DELETE /authors/1
  def destroy
    @author.destroy
  end

  def create_many
    result_json = []
    created_authors = []
    errors = []
    many_authors_params.each do |param|
      author = param.permit(:firstname, :lastname, :bio)

      author_instance = Author.new(author)

      if author_instance.save
        # render json: @author, status: :created, location: @author
        created_authors << author_instance
      else
        # render json: @author.errors, status: :unprocessable_entity
        errors << author_instance.errors
      end
    end

    result_json = { 'created_authors' => created_authors, 'errors' =>  errors }
    render json: result_json 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_author
      @author = Author.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def author_params
      params.require(:author).permit(:firstname, :lastname, :bio)
    end

    def many_authors_params
      params.require(:authors)
    end
end
