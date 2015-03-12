module HomeHelper

	def render_homework_content(homework)
		# markdown = Redcarpet::Markdown.new(renderer, extensions = {})
		markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true)
		markdown.render(homework.introduction).html_safe
	end
end
