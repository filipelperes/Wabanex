defmodule Wabanex.UserTest do
  use Wabanex.DataCase, async: true

  alias Wabanex.User

  describe "changeset/1" do
    test "When all params are valid, returns a valid changeset" do
      params = %{name: "filipe", email: "filipe@filipe.com", password: "123456"}

      response = User.changeset(params)

      assert %Ecto.Changeset{
               valid?: true,
               changes: %{email: "filipe@filipe.com", name: "filipe", password: "123456"},
               errors: []
             } = response
    end

    test "When there are invalid params, returns an error" do
      params = %{name: "filip", email: "filipe@filipe.com", password: "12345"}

      response = User.changeset(params)

      assert %Ecto.Changeset{
               valid?: false,
               changes: %{email: "filipe@filipe.com", name: "filip", password: "12345"},
               errors: [
                 name:
                   {"should be at least %{count} character(s)",
                    [count: 2, validation: :length, kind: :min, type: :string]},
                 password:
                   {"should be at least %{count} character(s)",
                    [count: 6, validation: :length, kind: :min, type: :string]}
               ]
             } = response
    end
  end
end
