defmodule ValidadorJsonTest do
  use ExUnit.Case
  alias ValidadorJson.Validator

  test "payload válido" do
    json = ~s({"nombre": "Ana", "edad": 25, "email": "ana@example.com"})
    assert Validator.validate(json) == :ok
  end

  test "payload con error de tipo" do
    json = ~s({"nombre": "Ana", "edad": "veinticinco", "email": "ana@example.com"})
    assert {:error, _} = Validator.validate(json)
  end

  test "payload con email inválido" do
    json = ~s({"nombre": "Ana", "edad": 25, "email": "ana@ejemplo"})
    assert {:error, _} = Validator.validate(json)
  end
end
