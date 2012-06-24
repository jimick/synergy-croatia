module ApplicationHelper
  def navigation_pages
    pages = [[t("pages.news.page_title"),         {:controller => "pages", :action => "news"}],
             [t("pages.about.page_title"),        {:controller => "pages", :action => "about"}],
             [t("pages.archive.page_title"),      {:controller => "pages", :action => "archive"}],
             [t("testimonials.index.page_title"), {:controller => "testimonials", :action => "index"}],
             [t("pages.method.page_title"),       {:controller => "pages", :action => "method"}],
             [t("pages.partners.page_title"),     {:controller => "pages", :action => "partners"}]]

    pages.collect do |title, route|
      Struct.new(:title, :route).new(title, route)
    end
  end

  def render_markdown(text)
    Redcarpet::Markdown.new(SmartHTMLRenderer).render(text).html_safe rescue ""
  end

  def current_page_id
    t("pages.#{params[:action]}.page_title", :locale => :en).downcase.gsub(' ', '-')
  end

  def format_date_range(from, till)
    if from.year != till.year
      [from.strftime('%-d.%-m.%Y'), till.strftime('%-d.%-m.%Y.')]
    elsif from.month != till.month
      [from.strftime('%-d.%-m.'), till.strftime('%-d.%-m.%Y.')]
    else
      [from.strftime('%-d.'), till.strftime('%-d.%-m.%Y.')]
    end
  end

  def enumerate(array)
    if array.count <= 1
      array.first.to_s
    else
      array[0..-2].join(', ') + " #{t 'words.and'} " + array.last
    end
  end
end
