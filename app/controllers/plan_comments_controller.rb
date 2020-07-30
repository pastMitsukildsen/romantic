class PlanCommentsController < ApplicationController
	def create
	  	plan = Plan.find(params[:plan_id])
		comment = PlanComment.new(plan_comment_params)
	    comment.user_id = current_user.id
		comment.plan_id = plan.id
		comment.save
		redirect_to plan_path(plan)
	end

	def destroy
		PlanComment.find_by(id: params[:id], plan_id: params[:plan_id]).destroy
	    redirect_to plan_path(params[:plan_id])
	end

	private
	def plan_comment_params
	    params.require(:plan_comment).permit(:comment)
	end
end
