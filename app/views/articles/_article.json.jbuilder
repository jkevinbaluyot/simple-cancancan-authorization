json.extract! article, :id, :user_id, :title, :body, :published_date, :created_at, :updated_at
json.url article_url(article, format: :json)