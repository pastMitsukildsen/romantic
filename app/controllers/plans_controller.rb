class PlansController < ApplicationController
	 before_action :authenticate_user!

  def new
  	@plan = Plan.new
  end

  def index
  	@plans = Plan.all.page(params[:page]).per(9)
  end

  def show
  	@plan = Plan.find(params[:id])
    @plan_comment = PlanComment.new
    @user = @plan.user
  end

  def edit
  	@plan = Plan.find(params[:id])
  end

  def create
    params[:plan][:user_id] = current_user.id
  	@plan = Plan.new(plan_params)
  	if @plan.save
  		redirect_to plan_path(@plan)
  		flash[:success] = "投稿が完了しました"
  	else
  		flash[:danger] = "投稿に失敗しました"
  		render "new"
  	end
  end

  def update
  	plan = Plan.find(params[:id])
  	if plan.update(plan_params)
  		redirect_to plan_path(plan)
  		flash[:success] = "投稿を更新しました"
  	else
  		flash[:danger] = "投稿の更新に失敗しました"
  		render "edit"
  	end
  end

  def destroy
  	plan = Plan.find(params[:id])
  	plan.destroy
  	redirect_to user_path(plan.user)
  	flash[:success] = "投稿を削除しました"
  end

  private

  def plan_params
  	params.require(:plan).permit(:title, :body, :image, :genre, :point, :user_id)
  end
end
