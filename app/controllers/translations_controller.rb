class TranslationsController < ApplicationController
  def translate
    @message = params[:message_id]
    @content = params[:content]
    begin
      @translated = Rails.cache.fetch("message/#{@message}/translation/bg", expires_in: 12.hours) do
        Rails.logger.info "Cache miss for message/#{@message}/translation/bg"
        EasyTranslate.translate(@content, to: :bg, key: Rails.application.credentials.google_translate_api_key)
      end
      render json: { translated: @translated, status: :ok }
    rescue StandardError => e
      render json: {status: 505, message: e.message }
    end
  end
end
