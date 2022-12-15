import Config

config :assignment_first, ecto_repos: [First.Repo]
config :assignment_first,First.Repo,
  database: "assignment_first",
  username: "postgres",
  password: "idfy",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
