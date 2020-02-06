if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      # Amazon S3用の設定
      :provider              => 'AWS',
      :region                => ENV['S3_REGION'],     # 例: 'ap-northeast-1'
      :aws_access_key_id     => ENV['S3_ACCESS_KEY'],
      :aws_secret_access_key => ENV['S3_SECRET_KEY']
    }
    config.fog_directory     =  ENV['S3_BUCKET']
    # 画像のエンドポイントを設定（defaultではhtpps://〜だが、http://〜に変更。）（謎）
    config.asset_host = 'http://' + ENV['S3_BUCKET'] + '.s3.amazonaws.com'
  end
end