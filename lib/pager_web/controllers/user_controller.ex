defmodule PagerWeb.UserController do
  use PagerWeb, :controller

  alias Pager.Repo
  alias PagerWeb.Models.User

  def index(conn, _params) do
    users = Repo.all_users(Pager.Repo)
    render(conn, "index.html", users: users)
  end

  def show(conn, %{"id" => id}) do
    user = Repo.get(PagerWeb.Models.User, id)
    render(conn, "show.html", user: user)
  end
end
