class SmsSenderWorker
  include Sidekiq::Worker

  def perform(url, params)
    response = RestClient.post url, params
  end
end