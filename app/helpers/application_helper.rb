module ApplicationHelper
	def get_correct_path(comment)
		if comment.commentable.class == Post 
			post_comment_path(comment.commentable, comment) 
		else 
			comment_comment_path(comment.commentable, comment)
		end
	end

	def get_site_thumbnail(post)
		require 'httparty'
		begin
			resp = HTTParty.get(post.url)
			doc = Nokogiri::HTML(resp.body)
			img = doc.at('meta[property="og:image"]')['content']
  			image_tag img, class: "post-thumbnail img img-responsive", id: "post_#{post.id}_thumbnail"
		rescue 
			
		end
	end
end
