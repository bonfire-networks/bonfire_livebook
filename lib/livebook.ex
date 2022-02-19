# check that this extension is configured
if Code.ensure_loaded?(Bonfire.Common.Config), do: Bonfire.Common.Config.require_extension_config!(:bonfire_livebook)

# SPDX-License-Identifier: AGPL-3.0-only
defmodule Bonfire.Livebook do
  import Where

end
