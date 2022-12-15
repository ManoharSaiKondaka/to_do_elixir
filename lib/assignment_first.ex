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
  def add(task) do
    add_task = %First.Task{task: task,status: "incomplete"}
  First.Repo.insert(add_task)
  end

  def len() do
    query = from task in First.Task ,
          select: task
    data=First.Repo.all(query)
    #IO.inspect(data)
  end
  def default() do
      First.Repo.insert_all(First.Task,[
        %{task: " ",status: " " },
        %{task: " ",status: " " },
        %{task: " ",status: " "},
        %{task: " ",status: " "}
      ])
  end

  def display_task() do
    if length(len())==0 do
      default()
    end
    query = from task in First.Task ,
          order_by: [asc: :id],
          select: task
    data=First.Repo.all(query)
    tasks = data|> Enum.map(&(&1.task))
    reverse_tasks=Enum.take(tasks, -4) #|> IO.inspect(charlists: :as_lists)
    #IO.inspect(reverse_tasks)
  end
  def display_id() do
    if length(len())==0 do
      default()
    end
    query = from task in First.Task ,
          order_by: [asc: :id],
          select: task
    data=First.Repo.all(query)
    ids = data|> Enum.map(&(&1.id))
    reverse_ids=Enum.take(ids, -4) #|> IO.inspect(charlists: :as_lists)
    #IO.inspect(reverse_ids)
  end
  def display_status() do
    if length(len())==0 do
      default()
    end
    query = from task in First.Task ,
          order_by: [asc: :id],
          select: task
    data=First.Repo.all(query)
    statuses= data|> Enum.map(&(&1.status))
    reverse_statuses=Enum.take(statuses, -4) #|> IO.inspect(charlists: :as_lists)
    #IO.inspect(reverse_statuses)
  end
  def changeset(task , params \\ %{}) do
    task
    |> Ecto.Changeset.cast(params , [:task,:status])
    |> Ecto.Changeset.validate_required([:task , :status])
  end

  def update_task(id,task) do

    old_task=First.Task |> First.Repo.get(id)
    old_task
    |> changeset(%{task: task})
    |> First.Repo.update()

  end

  def delete_task(id) do
    old_task=First.Task |> First.Repo.get(id)
    |> First.Repo.delete()

  end

  def toggle_status(id,status) do
    old_task=First.Task |> First.Repo.get(id)
    if status=="complete" do
        old_task
        |> changeset(%{status: "incomplete"})
        |> First.Repo.update()
    else
        old_task
        |> changeset(%{status: "complete"})
        |> First.Repo.update()
    end
  end


end
