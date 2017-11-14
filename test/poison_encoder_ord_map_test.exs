defmodule Poison.Encoder.OrdMapTest do
  use ExUnit.Case, async: true
  use OrdMap

  test "OrdMap Poison encoder" do
    assert to_json(%OrdMap{tuples: nil}) == "null"
    assert to_json(o(%{})) == "{}"
    assert to_json(o(%{"foo" => "bar"})) == ~s({"foo":"bar"})
    assert to_json(o(%{foo: :bar})) == ~s({"foo":"bar"})
    assert to_json(o(%{42 => :bar})) == ~s({"42":"bar"})
    assert to_json(o(%{'foo' => :bar})) == ~s({"foo":"bar"})

    assert to_json(o(%{foo: o(%{bar: o(%{baz: "baz"})})}), pretty: true) == """
           {
             "foo": {
               "bar": {
                 "baz": "baz"
               }
             }
           }\
           """

    multi_key = o(%{"foo" => "foo1", :foo => "foo2", :bar => "bar1"})
    assert to_json(multi_key) == ~s({"foo":"foo1","foo":"foo2","bar":"bar1"})
  end

  test "Example in Readme" do
    o(%{"foo" => o(%{"bar" => "baz"})})
    |> Poison.Encoder.encode(pretty: true)
    |> IO.iodata_to_binary()
    |> assert("""
       {
         "foo": {
           "bar": "baz"
         }
       }\
       """)
  end

  defp to_json(value, options \\ []) do
    value
    |> Poison.Encoder.encode(options)
    |> IO.iodata_to_binary()
  end
end
