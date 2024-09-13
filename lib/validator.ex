defmodule ValidadorJson.Validator do
  @moduledoc """
  Módulo para validar un payload JSON contra un esquema definido.
  """

  alias ExJsonSchema.Schema
  alias ExJsonSchema.Validator

  @schema %{
    "type" => "object",
    "properties" => %{
      "nombre" => %{"type" => "string"},
      "edad" => %{"type" => "integer"},
      "email" => %{"type" => "string", "format" => "email"}
    },
    "required" => ["nombre", "edad", "email"]
  }

  @spec validate(String.t()) :: :ok | {:error, any()}
  def validate(json_string) do
    with {:ok, payload} <- Jason.decode(json_string),
         schema = Schema.resolve(@schema),
         :ok <- Validator.validate(schema, payload) do
      :ok
    else
      {:error, reason} -> {:error, reason}
    end
  end
end
