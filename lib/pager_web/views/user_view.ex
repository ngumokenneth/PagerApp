defmodule PagerWeb.UserView do
  use PagerWeb, :view
  alias PagerWeb.Models.User

  def first_name(%{name: name}) do
    name
    |> String.split(" ")
    |> Enum.at(0)
  end
end
