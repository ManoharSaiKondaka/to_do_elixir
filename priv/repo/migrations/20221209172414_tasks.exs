defmodule First.Repo.Migrations.Tasks do
  use Ecto.Migration

  def change do
    create table(:to_do) do
      add :task, :string
      add :status,:string
    end

  end
end
