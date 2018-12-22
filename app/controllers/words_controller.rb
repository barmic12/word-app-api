class WordsController < ApplicationController
  before_action :authenticate_user!
  def create
    begin
      @word = Word.new(word_params)
      @word.save
      render_resource(@word, :created)
    rescue ActionController::ParameterMissing => e
      render_error(400, 'Parametr Missing', e)
    end
  end

  private

  def set_word

  end

  def word_params
    params.require(:word).permit(:description, :list)
  end
end
