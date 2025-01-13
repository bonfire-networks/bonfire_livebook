defmodule Bonfire.Livebook.Web.Routes do
  @behaviour Bonfire.UI.Common.RoutesModule

  defmacro __using__(_) do
    quote do
      forward("/livebook", LivebookWeb.Routes)
    end
  end
end
