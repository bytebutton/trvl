class ImageUploader < BaseUploader

  version :thumb do
    process :resize_to_fill => [50, 50]
  end

  version :middle do
    process :resize_to_fill => [75, 75]
  end

  version :large do
    process :pdf_cover
    process :convert        => :png
    process :resize_to_fill => [130, 130]
  end

  def pdf_cover
    if file.content_type.eql?('application/pdf')
      manipulate! do |frame, index|
        frame if index.zero?
      end
    end
  end

  def default_url
    ActionController::Base.helpers.asset_path('default-image.png')
  end

  def extension_white_list
    %w(jpg jpeg gif png pdf)
  end

end
