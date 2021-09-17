class ActiveStorage::AttachmentsController < ApplicationController
  def destroy
    @attachment = ActiveStorage::Attachment.find(params[:id])
    @record = @attachment.record
    authorize @record

    @attachment.purge_later
  end
end
