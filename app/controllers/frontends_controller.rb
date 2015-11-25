class FrontendsController < ApplicationController

  # root_path
  def index
    @categories = Category.all
    @data = MainDatum.first
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def frontend_params
      params.require(:frontend).permit(:index)
    end
end
