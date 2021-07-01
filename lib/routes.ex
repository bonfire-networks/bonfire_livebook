defmodule Bonfire.Livebook.Web.Routes do
  defmacro __using__(_) do

    quote do

      pipeline :livebook do
        plug :put_root_layout, {LivebookWeb.LayoutView, :root}
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
        get "/", AuthController, :index
        post "/", AuthController, :authenticate
      end

      # pages only admins can view
      scope "/admin/livebook", LivebookWeb do
        pipe_through :browser
        pipe_through :livebook
        pipe_through :admin_required
        pipe_through :livebook_auth

        live "/", HomeLive, :page
        live "/home/user-profile", HomeLive, :user
        live "/home/import/:tab", HomeLive, :import
        live "/home/sessions/:session_id/close", HomeLive, :close_session
        live "/explore", ExploreLive, :page
        live "/explore/user-profile", ExploreLive, :user
        live "/explore/notebooks/:slug", ExploreLive, :notebook
        live "/sessions/:id", SessionLive, :page
        live "/sessions/:id/user-profile", SessionLive, :user
        live "/sessions/:id/shortcuts", SessionLive, :shortcuts
        live "/sessions/:id/settings/runtime", SessionLive, :runtime_settings
        live "/sessions/:id/settings/file", SessionLive, :file_settings
        live "/sessions/:id/bin", SessionLive, :bin
        live "/sessions/:id/cell-settings/:cell_id", SessionLive, :cell_settings
        live "/sessions/:id/cell-upload/:cell_id", SessionLive, :cell_upload
        live "/sessions/:id/delete-section/:section_id", SessionLive, :delete_section
        get "/sessions/:id/images/:image", SessionController, :show_image

      end

    end
  end
end
