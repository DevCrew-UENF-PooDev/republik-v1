module ApplicationHelper
  def inline_svg(path, options = {})
    file_path = Rails.root.join("app/assets/images", path)
    if File.exist?(file_path)
      file = File.read(file_path)
      doc = Nokogiri::HTML::DocumentFragment.parse(file)
      svg = doc.at_css("svg")
      options.each { |key, value| svg[key.to_s] = value }
      doc.to_html.html_safe
    else
      "(SVG not found)"
    end
  end
end
