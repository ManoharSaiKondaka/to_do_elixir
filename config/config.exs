import Config

config :assignment_first, ecto_repos: [First.Repo]
config :assignment_first,First.Repo,
  database: "assignment_first",
  username: "postgres",
  password: "idfy",
  hostname: "localhost"
#import_config "#{config_env()}.exs" #uncomment this line when testing
