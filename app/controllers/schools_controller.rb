class SchoolsController < ApplicationController
  before_action :set_scope, only: [:index]

  def index
    if @scope
      @schools = School.send(@scope)
      @schools = @schools.paginate(page: params[:page]) if @schools.count > 50
    else
      @schools = School.all.order(name: :asc).paginate(page: params[:page])
    end
    render layout: "application"
  end

  def search
    @schools = School.search(params[:query]).order(name: :asc).paginate(page: params[:page])
    render :index, layout: "application"
  end


  def show
    @school = School.find(params[:id])
  end

  def set_scope
    return unless params[:scope]
    @scope = params[:scope] if School.scopes.include? params[:scope]
  end

end
