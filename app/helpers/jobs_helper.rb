module JobsHelper
    def index_display_header
        if @user
            content_tag(:h1, "#{@user.username}'s Jobs:")
        else
            content_tag(:h2, "All Jobs")
        end
    end

    def display_jobs
        if @user.jobs.empty?
            tag.h2(link_to("No jobs yet - create a job here", new_job_path))
        else
            user = @user == current_user ? 'Your' : "#{@user.username}'s"
            content_tag(:h2, "#{user} #{pluralize(@user.jobs.count, 'Job')}:")
        end
    end
end