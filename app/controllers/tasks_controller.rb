class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :require_user

  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.all.joins(:priority).joins(:status).order('"task_priorities"."level" DESC').order('"task_statuses"."order" ASC')
    # Search by title
    if params[:q] && params[:q].length > 0
      @tasks = @tasks.where("LOWER(title) LIKE '%#{params[:q].downcase}%'")
    end
    # Search by status
    if params[:status] && params[:status].length > 0
      @tasks = @tasks.where("status_id = #{params[:status]}")
    end
    # Search by priority
    if params[:priority] && params[:priority].length > 0
      @tasks = @tasks.where("priority_id = #{params[:priority]}")
    end
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  # GET /tasks/1/edit.json
  def edit
    if request.format.json?
      render :json => { :task => @task, :statuses => TaskStatus.all.order(order: :asc), :priorities => TaskPriority.all.order(level: :desc) }
    end
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)
    @task.user = current_user

    respond_to do |format|
      if @task.save
        flash[:success] = "Task was successfully created."
        format.html { redirect_to @task }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        flash[:success] = "Task was successfully updated."
        format.html { redirect_to @task }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      flash[:success] = "Task was successfully deleted"
      format.html { redirect_to tasks_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:title, :description, :user_id, :assignee_id, :status_id, :priority_id)
    end
end
