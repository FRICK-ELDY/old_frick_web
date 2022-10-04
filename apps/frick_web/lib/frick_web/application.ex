defmodule FrickWeb.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      FrickWeb.Telemetry,
      # Start the Endpoint (http/https)
      FrickWeb.Endpoint
      # Start a worker by calling: FrickWeb.Worker.start_link(arg)
      # {FrickWeb.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: FrickWeb.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    FrickWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
