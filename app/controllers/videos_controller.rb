class VideosController < ApplicationController

  before_action :set_videoed

  def index
    if @videoed
      @videos = @videoed.videos
      render :index, layout: @videoed.class.model_name.route_key
    end
  end

  # def new
  #   if @videoed
  #     @video = @videoed.videos.build
  #     render layout: @videoed.class.model_name.route_key
  #   end
  # end

  # def create
  #   @video = Video.new(video_params)
  #   if @video.save
  #     @videoed = @video.videoed
  #     redirect_to @videoed
  #   else
  #     render :new, layout: @videoed.class.model_name.route_key if @videoed
  #   end 
  # end

  # def edit
  #   @video = Video.find(params[:id])
  #   render layout: @videoed.class.model_name.route_key
  # end

  # def update
  #   @video = Video.find(params[:id])
  #   if @video.update(video_params)
  #     set_videoed
  #     redirect_to @videoed
  #   else
  #     raise @video.errors.full_messages.to_s
  #     render :edit, layout: @video.videoed.class.model_name.route_key
  #   end
  # end

  # def destroy
  #   @video = Video.find(params[:id])
  #   @video.destroy
  #   set_videoed
  #   redirect_to @videoed
  # end

private

  def set_videoed
    if @video
      @videoed = @video.videoed
    elsif params[:school_id]
      @videoed = School.find(params[:school_id])
    end
    if @videoed
      variable_name = @videoed.class.model_name.element
      instance_variable_set("@#{variable_name}", @videoed)
    end
  end

  def video_params
    params.require(:video).permit([:videoed_id, :videoed_type, :youtube_id, :featured])
  end
end
