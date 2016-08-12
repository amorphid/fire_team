defmodule FireTeam.SquadLeader do
  import Supervisor.Spec
  alias FireTeam.Soldier

  def give_order_to_fire! do
    for soldier <- soldiers, do: send(soldier, :fire!)
  end

  def start_link do
    children = [
      worker(Soldier, [])
    ]

    opts = [strategy: :simple_one_for_one, name: __MODULE__]

    Supervisor.start_link(children, opts)
  end

  def recruit do
    Supervisor.start_child(__MODULE__, [])
  end

  def soldiers do
    Supervisor.which_children(__MODULE__)
    |> Enum.map(fn worker -> {_,soldier,_,_} = worker; soldier end)
  end
end
