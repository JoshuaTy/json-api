use Mix.Config

# Configure your database
config :my_app, MyApp.Repo,
  username: "postgres",
  password: "1234",
  database: "my_app_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox,
  timeout: 120_000,
  queue_target: 5000,
  queue_interval: 100_000
  
config :pbkdf2_elixir, :rounds, 1

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :my_app, MyAppWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
