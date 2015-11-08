class CertificatesController < ApplicationController
  before_action :load_conversation
  before_action :load_certificate, only: [:show, :edit, :update, :destroy]

  def show
    @certificate = Certificate.find(params[:id])
  end

  def create
    @certificate = @conversation.certificates.new(certificate_params)
    @certificate.user_id = current_user.id
    #@conversation = Conversation.find(params[:id])
    #@certificate.conversation_id = @conversation.id
    respond_to do |format|
      if @certificate.save
        format.html { redirect_to conversation_certificate_path(@conversation, @certificate), notice: 'Изображение загружено' }
        format.json { render action: 'show', status: :created, location: @certificate }
      else
        format.html { redirect_to conversation_path(@conversation), notice: 'Ошибка при загрузке изображения, выберете файл формата jpg, jpeg, gif, png' }
        format.json { render json: @certificate.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @certificate.destroy
    respond_to do |format|
      format.html { redirect_to conversation_path(@conversation), notice: 'Изображение удалено' }
      format.json { head :no_content }
    end
  end

  private
    def certificate_params
      #params.require(:certificate).permit(:image_url, :user_id, :conversation_id)
      params.fetch(:certificate, {}).permit(:image_url, :user_id, :conversation_id)
    end

    def load_conversation
      @conversation = Conversation.find(params[:conversation_id])
    end

    def load_certificate
      @certificate = Certificate.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.

end
