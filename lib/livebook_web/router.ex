Code.put_compiler_option(:ignore_module_conflict, true)
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

  # pages only admins can view
  scope "/admin/", LivebookWeb do
    pipe_through :browser
    pipe_through :livebook
    pipe_through :admin_required
    pipe_through :livebook_auth

    live_dashboard "/system"
  end
end
Code.put_compiler_option(:ignore_module_conflict, false)
