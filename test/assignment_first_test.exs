defmodule AssignmentFirstTest do
  use ExUnit.Case
  setup do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(First.Repo)
  end
  #doctest AssignmentFirst

  test "greets the world" do
    assert AssignmentFirst.hello() == :world
  end
  test "check adding" do
    assert 1+4==5
  end
  # test "view" do
  #   query=from(to_do in First.Task )
  #   IO.inspect First.Repo.all(query)
  # end
end
