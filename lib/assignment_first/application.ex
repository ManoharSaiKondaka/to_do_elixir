defmodule AssignmentFirst.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false
  require Logger
  use Application

  @impl true
  def start(_type, _args) do
    children = [
      First.Repo,
      
      {Plug.Cowboy, scheme: :http, plug: Dynamic.Router, options: [port: 8001]}
      

    ]
    Logger.info("running the web servers..")
    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: AssignmentFirst.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
