class AdminBanner < Upmin::Model
  actions :delete

  def delete
    model.destroy!
  end
end
