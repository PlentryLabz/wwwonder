class ApplicationUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :fog

  def store_dir
    "system/uploads/#{model.class.model_name.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url
    "/images/fallback/#{model.class.model_name.underscore}/" + [mounted_as, version_name].compact.join("_")
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  def filename
    file.extension.to_s if original_filename.present?
  end
end