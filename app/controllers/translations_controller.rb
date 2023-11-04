class TranslationsController < ApplicationController
  def translate
    @content = params[:content]
    begin
      @translated = EasyTranslate.translate(@content, to: :bg, key: Rails.application.credentials.google_translate_api_key)

      render json: { translated: @translated, status: :ok }
    rescue StandardError => e
      render json: {status: 505, message: e.message }
    end
  end
end
