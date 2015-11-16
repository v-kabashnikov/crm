class PartsController < ApplicationController
  before_action :set_part, only: [:update, :destroy, :upload]
  load_and_authorize_resource
  def create
    part = Part.new(part_params)

    if part.save
      redirect_to :back, notice: 'Часть успешно создана'
    else
      redirect_to :back, notice: 'Ошибка'
    end
  end

  def upload
    if @part.update(upload_params)
      redirect_to :back, notice: 'Файл загружен'
    else
      redirect_to :back, notice: 'Ошибка'
    end
  end

  def update
    if @part.update(part_params)
      redirect_to :back, notice: 'Часть успешно обновлена'
    else
      redirect_to :back, notice: 'Ошибка'
    end
  end

  def destroy
    @part.destroy
    redirect_to :back, notice: 'Часть усешно удален'
  end

  private
  def set_part
    @part = Part.find(params[:id])
  end

  def upload_params
    params.require(:part).permit(:file)
  end

  def part_params
    params.require(:part).permit(:name, :deadline, :order_id, :description, :file, :status)
  end
end
