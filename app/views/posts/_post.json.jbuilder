json.extract! post, :id, :title, :date, :language, :code, :about, :slug, :created_at, :updated_at
json.url post_url(post, format: :json)
