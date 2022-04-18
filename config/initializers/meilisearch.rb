MeiliSearch::Rails.configuration = {
  meilisearch_host: ENV['MEILISEARCH_HOST'],
  meilisearch_api_key: ENV['MEILISEARCH_API_KEY'],
  timeout: 2,
  max_retries: 1
}
