if Rails.env.test? || Rails.env.development?
  CarrierWave.configure do |config|
    config.storage = :file
    config.enable_processing = false
  end

  AvatarUploader

  CarrierWave::Uploader::Base.descendants.each do |klass|
    next if klass.anonymous?
    klass.class_eval do
      storage :file

      def cache_dir
        "#{Rails.root}/tmp/uploads"
      end

      def store_dir
        "#{Rails.root}/public/uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
      end
    end
  end
else
  CarrierWave.configure do |config|
  end
end