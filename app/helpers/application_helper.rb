module ApplicationHelper
  # Returns full title on a per-page basis
  def full_title(page_title)
    base_title = Personalisation.find(1).data
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  # Avatars
  def avatar_url(user)
    gravatar_id = Digest::MD5::hexdigest(user.email).downcase
    "http://gravatar.com/avatar/#{gravatar_id}.png"
  end

  # Markdown
  def markdown
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML.new(
                                           :filter_html => true,
                                           :hard_wrap => true,
                                           :save_links_only => true),
                                       :autolink => true,
                                       :fenced_code_blocks => true,
                                       :strikethrough => true,
                                       :no_intra_emphasis => true,
                                       :superscript => true)
  end

end
