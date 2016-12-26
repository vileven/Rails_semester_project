class StaticPagesController < ApplicationController
  def home
    # if params[:set_locale]
    #   locale = params[:set_locale].to_s.strip.to_sym
    #   I18n.locale = I18n.available_locales.include?(locale) ?
    #       locale :
    #       I18n.default_locale
    #   @locale = params[:set_locale]
    # end
  end

  def help
  end

  def about
  end
end
