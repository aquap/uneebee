defmodule UneebeeWeb.Shared.Validators do
  @moduledoc """
  Shared validators to be used with Ecto changesets.
  """

  import Ecto.Changeset
  import UneebeeWeb.Gettext

  @doc """
  Validates a field doesn't contain spaces or special characters other than `-` and `_`.

  It should also return an error for accented characters.
  """
  @spec validate_slug(Ecto.Changeset.t(), atom()) :: Ecto.Changeset.t()
  def validate_slug(changeset, field) do
    value = get_field(changeset, field)

    if value && !String.match?(value, ~r/^[a-z0-9_-]+$/i) do
      add_error(changeset, field, dgettext("errors", "can only contain letters, numbers, dashes and underscores"))
    else
      changeset
    end
  end
end
