defmodule GrispBlink.Blinker do
  use Agent

  def start_link(_) do
    Agent.start_link(fn -> false end, name: __MODULE__)
  end

  def toggle_led() do
    Agent.get_and_update(__MODULE__, fn(state) ->
      toggle_led(state)
      {state, not state}
    end)
  end

  def toggle_led(true) do
    :grisp_led.color(1, :red)
  end

  def toggle_led(false) do
    :grisp_led.off(1)
  end

end
