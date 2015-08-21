class CommentsController < ApplicationContoller
	def create
		@comment = Comment.new(comment_params)
	end
	def update
		@comment = Comment.update(comment_params)
	end
	 private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:body)
    end
end