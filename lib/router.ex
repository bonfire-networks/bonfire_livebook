defmodule LivebookWeb.Router do
  use LivebookWeb, :router
  import Phoenix.LiveDashboard.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    # plug Bonfire.Web.Plugs.LoadCurrentAccount
    # plug Bonfire.Web.Plugs.LoadCurrentUser
    # plug Bonfire.Web.Plugs.Locale
  end

  pipeline :admin_required do
    #plug Bonfire.Web.Plugs.AdminRequired
  end

  use Bonfire.Livebook.Web.Routes
end
