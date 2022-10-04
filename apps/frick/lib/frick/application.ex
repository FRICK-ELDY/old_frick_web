defmodule Frick.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the PubSub system
      {Phoenix.PubSub, name: Frick.PubSub}
      # Start a worker by calling: Frick.Worker.start_link(arg)
      # {Frick.Worker, arg}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: Frick.Supervisor)
  end
end
