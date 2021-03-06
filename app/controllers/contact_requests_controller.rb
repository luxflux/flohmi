class ContactRequestsController < ApplicationController
  before_action :set_article, only: [:new, :create]

  def index
    @contact_requests = policy_scope(ContactRequest).includes(:article).order(id: :desc)
    authorize @contact_requests
  end

  def show
  end

  def new
    @contact_request = @article.contact_requests.new
    authorize @contact_request
  end

  def create
    @contact_request = @article.contact_requests.new(contact_request_params)
    authorize @contact_request

    if @contact_request.save
      ContactRequestMailer.created(@contact_request).deliver_later
      redirect_to @article, notice: {
        title: 'Anfrage versandt',
        text: 'Vielen Dank für deine Anfrage! Wir werden uns demnächst bei Dir melden.',
      }
    else
      render :new
    end
  end

  def destroy
    @contact_request = ContactRequest.find(params[:id])
    authorize @contact_request
    @contact_request.destroy

    redirect_to contact_requests_url, notice: {
      title: 'Anfrage gelöscht',
      text: 'Die Anfrage wurde gelöscht',
    }
  end

  private
    def set_article
      @article = Article.find(params[:article_id])
    end

    def contact_request_params
      params.require(:contact_request).permit(:contact_request_id, :name, :email, :phone, :price, :message)
    end
end
