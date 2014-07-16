module AppConfig
  extend self

  def pusher_key
    ENV['PUSHER_KEY']
  end
end

