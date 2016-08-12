defmodule FireTeam.Soldier do
  def hurry_up_and_wait do
    receive do
      :fire! -> fire!
    end

    hurry_up_and_wait
  end

  def start_link do
    {:ok, spawn_link(__MODULE__, :hurry_up_and_wait, [])}
  end

  defp fire! do
    IO.puts("BANG!!!")
  end
end
