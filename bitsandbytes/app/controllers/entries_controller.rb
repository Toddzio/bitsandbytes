class EntriesController < ApplicationController
	def index
    @entries= Entry.all
  end

  def new
    @entries = Entry.new
    @board = Board.find(params[:board_id])
  end

  def create
    @entry = Entry.new
    @entry.board_id = params["entry"]["board_id"]
    @entry.upvote = params["entry"]["upvote"]
    @entry.url = params["entry"]["url"]
    @entry.note = params["entry"]["note"]
    @entry.save
    redirect_to '/boards/'
  end

  def upvote
    @entry = Resource.find(params[:id])
    @vote = @entry.upvote + 1
    @entry.upvote = @vote
    @entry.save
    redirect_to '/boards/'
  end

  def edit
  end

  def update
  end

  def destroy
    @entry = Entry.find(params[:id])
    @entry.destroy
    redirect_to '/boards/'
  end
end  
  private
  def entries_params
    params.require(:url).permit(:user_id, :notes, :upvotes, :board_id)
  end

