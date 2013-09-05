class ItemsearchController < ApplicationController
  def index
    render 'itemsearch/index'
  end

  def search
    keyword = params['keyword']
    httpClient = HTTPClient.new

    @jsonData = nil
    @errorMeg = nil

    begin
      data = httpClient.get_content('https://app.rakuten.co.jp/services/api/IchibaItem/Search/20130805', {
          'applicationId' => '1012796101019679286',
          'affiliateId'   => '11b23d60.6b9736c8.11b23d61.a207a096',
          'keyword'       => keyword
      })
      @jsonData = JSON.parse data
      p @jsonData
    rescue HTTPClient::BadResponseError => e
    rescue HTTPClient::TimeoutError => e
    end

    render 'itemsearch/index'
  end
end
