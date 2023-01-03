import First.Task
import Ecto.Query
import Ecto.Changeset
defmodule AssignmentFirst do
  @moduledoc """
  Documentation for `AssignmentFirst`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> AssignmentFirst.hello()
      :world

  """
  def hello do
    :world
  end
  def add(task,priority\\"medium") do
    add_task = %First.Task{task: task,status: "incomplete",priority: priority}
    First.Repo.insert(add_task)
  end

  def display() do
    query = from task in First.Task ,
          order_by: [asc: :id],
          select: task
    _data=First.Repo.all(query)

  end

  # def display_task() do
  #   query = from task in First.Task ,
  #         order_by: [asc: :id],
  #         select: task
  #   data=First.Repo.all(query)
  # end
  # def display_id() do
  #   query = from task in First.Task ,
  #         order_by: [asc: :id],
  #         select: task
  #   data=First.Repo.all(query)
  # end
  # def display_status() do
  #   query = from task in First.Task ,
  #         order_by: [asc: :id],
  #         select: task
  #   data=First.Repo.all(query)
  # end
  def changeset(task , params \\ %{}) do
    task
    |> Ecto.Changeset.cast(params , [:task,:status,:priority])
    |> Ecto.Changeset.validate_required([:task , :status,:priority])
  end

  def update_task(id,task,priority) do

    old_task=First.Task |> First.Repo.get(id)
    old_task
    |> changeset(%{task: task,priority: priority})
    |> First.Repo.update()
  end

  def delete_task(id) do
    _old_task=First.Task |> First.Repo.get(id)
    |> First.Repo.delete()
  end
  def clearAll do
    First.Repo.delete_all(First.Task)
  end

  def toggle_status(id,status) do
    old_task=First.Task |> First.Repo.get(id)
    IO.inspect(old_task)
    if status=="complete" do
        old_task
        |> changeset(%{status: "complete"})
        |> First.Repo.update()
    else
        old_task
        |> changeset(%{status: "incomplete"})
        |> First.Repo.update()
    end
  end


end
