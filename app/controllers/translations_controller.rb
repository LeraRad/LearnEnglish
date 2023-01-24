class TranslationsController < ApplicationController
  before_action :set_defaults

  def index
  end

  def translate
  end

  private

  def set_defaults
    @languages = fetch_languages
  end

  def api_request(path, method: :get, body: nil)
    params = {
      headers: {
        'x-rapidapi-key': '7d1e217d28mshaf776daaf633643p1ee1acjsn848bd7bba27b',
        'content-type': 'application/x-www-form-urlencoded'
      }
    }

    params[:body] = body if body

    response = Excon.send(method,
      "https://google-translate1.p.rapidapi.com/#{path}",
      params
    )

    JSON.parse(response.body)
  end

  def fetch_languages
    languages = api_request('language/translate/v2/languages')

    keys = languages['data']['languages'].map { |l| l['language'].upcase }

    I18nData
      .languages
      .slice(*keys)
      .each_with_object([]) do |(iso, name), memo|
        memo << [name, iso]
      end
  end
end

