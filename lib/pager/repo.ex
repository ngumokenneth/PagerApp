defmodule Pager.Repo do
  use Ecto.Repo,
    otp_app: :pager,
    adapter: Ecto.Adapters.Postgres

  def all_users(PagerWeb.Models.User) do
    [%PagerWeb.Models.User{id: "1", name: "José", username: "josevalim", password: "elixir"},
    %PagerWeb.Models.User{id: "2", name: "Bruce", username: "redrapids", password: "7langs"},
    %PagerWeb.Models.User{id: "3", name: "Chris", username: "chrismccord", password: "phx"}]
  end

  def all_users(_module), do: []

  def get_user_by_id(module, id) do
    Enum.find(all(module), fn map -> map.id == id end)
  end
  def get_by_attribute(module, params) do
    Enum.find(all_users(module), fn map ->
      Enum.all?(params, fn {key, val} -> Map.get(map, key) == val end)
    end)
  end
end
