json.extract! comment, :id, :article_id, :user_id, :body, :created_at, :updated_at
json.url article_comment_url(comment, format: :json)
