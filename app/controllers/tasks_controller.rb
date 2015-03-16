class TasksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @task = @list.tasks.new
  end

  def create
    @list = List.find(params[:list_id])
    @task = @list.tasks.new(task_params)
    @task.done = false
    if @task.save
      flash[:notice] = "Task successfully added!"
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def edit
    @list = List.find(params[:list_id])
    @task = Task.find(params[:id])
  end

  def update
    @list = List.find(params[:list_id])
    @task = Task.find(params[:id])
    if @task.update(task_params)
      flash[:notice] = "Task successfully updated."
      redirect_to list_path(@list)
    else
      render :edit
    end
  end

  def destroy
    @list = List.find(params[:list_id])
    task = Task.find(params[:id])
    task.destroy
    flash[:notice] = "Task successfully deleted."
    redirect_to list_path(@list)
  end

private
  def task_params
    params.require(:task).permit(:description, :done)
  end
end
