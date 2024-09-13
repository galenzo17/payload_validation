defmodule ValidadorJson do
  @moduledoc """
  Módulo principal de la aplicación ValidadorJson.
  """

  def main(args) do
    case args do
      [json_string] ->
        case ValidadorJson.Validator.validate(json_string) do
          :ok ->
            IO.puts("Payload válido.")

          {:error, errors} ->
            IO.puts("Payload inválido:")
            IO.inspect(errors)
        end

      _ ->
        IO.puts("Uso: mix run -e 'ValidadorJson.main([\"<json_string>\"])'")
    end
  end
end
