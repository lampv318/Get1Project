class PageController < ApplicationController
  def show
    return render template: "page/show.html.erb" if is_root?

    if valid_page?
      render template: "page/#{params[:page]}"
    else
      render file: "page/404.html.erb", status: :not_found
    end
  end

  private
  def is_root?
    params[:page].nil?
  end

  def valid_page?
    File.exist?(Pathname.new(Rails.root + "app/views/page/#{params[:page]}.html.erb"))
  end
end
