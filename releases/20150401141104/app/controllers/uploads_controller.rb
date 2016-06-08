class UploadsController < LoggedUserController
  skip_load_and_authorize_resource

  def image
    setup_uploader(ImageUploader)
  end

  def destroy_image
    setup_destroyer(ImageUploader)
  end

  private

    def setup_uploader(uploader_constructor)
      uploader = uploader_constructor.new
      uploader.cache! params[:file]

      upload_data = {
          'cache_name'    => uploader.cache_name,
          'name'          => uploader.filename,
          'size'          => uploader.size,
          'url'           => uploader.url,
          'large'         => { :url => uploader.versions[:large].url },
          'delete_url'    => uploads_destroy_path(:id => uploader.cache_name),
          'delete_type'   => 'DELETE'
      }

      render(:json => upload_data.to_json, :status => :created, :location => uploader.url)
    rescue Exception => e
      render(:json => [{:error => e.message}].to_json, :status => :unprocessable_entity)
    end

    def setup_destroyer(uploader_constructor)
      uploader = uploader_constructor.new
      uploader.retrieve_from_cache!(params[:id])
      uploader.remove!
      render(:json => {})
    end

end
