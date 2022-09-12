defmodule Bonfire.Livebook.Web.Routes do
  defmacro __using__(_) do
    quote do
      forward("/livebook", LivebookWeb.Routes)
    end
  end
end
