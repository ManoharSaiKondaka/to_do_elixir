defmodule AssignmentFirst.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false
  require Logger
  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Starts a worker by calling: AssignmentFirst.Worker.start_link(arg)
      # {AssignmentFirst.Worker, arg}
      First.Repo,
      {Plug.Cowboy, scheme: :http, plug: Assignment.Try2.Router, options: [port: 4000]},
      #{Plug.Cowboy, scheme: :http, plug: Try.Router, options: [port: 8000]},
      #{Plug.Cowboy, scheme: :http, plug: Try.Router, options: [port: 8001]},
      #{Plug.Cowboy, scheme: :http, plug: Assign.First.Plug, options: [port: 4005]}

    ]
    Logger.info("running the web servers..")
    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: AssignmentFirst.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
