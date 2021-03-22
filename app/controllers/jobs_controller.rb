class JobsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def new
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
            @job = @user.jobs.build
        else
            @job = Job.new
        end
        @job.build_category
    end

    def index
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
            @jobs = @user.jobs
        else
            @error = "That user doesn't exist" if params[:user_id]
            @jobs = Job.all
        end
    end

    def create
        @job = current_user.jobs.build(job_params)
        if @job.save
            redirect_to jobs_path
        else
            render :new
        end
    end

    def show
        @job = Job.find_by_id(params[:id])
        redirect_to jobs_path if !@job
    end

    private

    def job_params
         params.require(:job).permit(:title, :company, :content, :category_id, category_attributes: [:name])
    end
end
