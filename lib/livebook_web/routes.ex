defmodule Bonfire.Livebook.Web.Routes do
  defmacro __using__(_) do

    quote do

      pipeline :livebook do
        plug :put_root_layout, {Bonfire.Livebook.LayoutView, :root}
      end

      pipeline :livebook_auth do
        plug LivebookWeb.AuthPlug
        plug LivebookWeb.UserPlug
      end


      # pages anyone can view
      scope "/admin/livebook", LivebookWeb do
        pipe_through :browser
        pipe_through :livebook

      end

      # pages only guests can view
      scope "/admin/livebook", LivebookWeb do
        pipe_through :browser
        pipe_through :livebook
        pipe_through :guest_only

      end

      # pages you need an account to view
      scope "/admin/livebook", Bonfire.Livebook.Web do
        pipe_through :browser
        pipe_through :livebook
        pipe_through :account_required

      end

      # pages you need to view as a user
      scope "/admin/livebook", LivebookWeb do
        pipe_through :browser
        pipe_through :livebook
        pipe_through :user_required

      end

      # pages only admins can view
      scope "/admin/livebook/authenticate", LivebookWeb do
        pipe_through :browser
        pipe_through :livebook
        pipe_through :admin_required

        # second layer of authentication provided by Livebook
        unquote(LivebookWeb.Routes.authenticate_paths())

      end

      # pages only admins can view
      scope "/admin/livebook", LivebookWeb do
        pipe_through :browser
        pipe_through :livebook
        pipe_through :admin_required
        pipe_through :livebook_auth

        unquote(LivebookWeb.Routes.main_paths())

      end

    end
  end
end
