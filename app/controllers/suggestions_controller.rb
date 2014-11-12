class SuggestionsController < ApplicationController
  before_action :set_suggestion, only: [:show, :edit, :update, :destroy, :vote]

  respond_to :html

  def index
    @suggestions = Suggestion.all
    authorize @suggestions
    respond_with(@suggestions)
  end

  def show
    respond_with(@suggestion)
  end

  def new
    @suggestion = Suggestion.new
    respond_with(@suggestion)
    authorize @suggestion
  end

  def edit
  end

  def create
    @suggestion = Suggestion.new(suggestion_params)

    authorize @suggestion 
    @suggestion.vote_count = 0
    @suggestion.suggester_id = current_user.id

    @suggestion.save
    respond_with(@suggestion)
  end

  def update
    @suggestion.update(suggestion_params)
    respond_with(@suggestion)
  end

  def destroy
    @suggestion.destroy
    respond_with(@suggestion)
  end

  def vote
    @suggestion.vote_count = @suggestion.vote_count + 1
    @suggestion.save!
    redirect_to suggestions_path, notice: "Thank you for your vote!"
  end

  private
    def set_suggestion
      @suggestion = Suggestion.find(params[:id] || params[:suggestion_id])
      authorize @suggestion
    end

    def suggestion_params
      params.require(:suggestion).permit(:suggester_id, :description, :vote_count)
    end
end
