module JobsHelper
    def index_display_header
        if @user
            "#{@user.username}'s Jobs:"
        else
            "All Jobs"
        end
    end

    def display_jobs
        if @user.jobs.empty?
            tag.h2(link_to("No jobs yet - Create a job Here", new_job_path))
        else
            content_tag(:h2, "Your Jobs:")
            render partial: "jobs/jobs", locals: {jobs: @user.jobs}
            # user = @user == current_user ? 'Your' : "#{@user.username}'s"
            # content_tag(:h2, "#{user} #{pluralize(@user.jobs.count, 'Job')}:")
        end
    end
end