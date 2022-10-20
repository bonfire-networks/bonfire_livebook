defmodule Bonfire.Livebook.Web.Routes do
  def declare_routes, do: "livebook"

  defmacro __using__(_) do
    quote do
      forward("/livebook", LivebookWeb.Routes)
    end
  end
end
