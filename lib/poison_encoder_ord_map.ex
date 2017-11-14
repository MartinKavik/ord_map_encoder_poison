defimpl Poison.Encoder, for: OrdMap do
  use Poison.{Encode, Pretty}
  alias Poison.Encoder

  def encode(%{tuples: tuples}, _) when is_nil(tuples), do: "null"
  def encode(%{tuples: tuples}, _) when length(tuples) == 0, do: "{}"

  def encode(%{tuples: tuples}, options) do
    %OrdMap{tuples: :lists.reverse(tuples)}
    |> encode(pretty(options), options)
  end

  def encode(ord_map, true, options) do
    indent = indent(options)
    offset = offset(options) + indent
    options = offset(options, offset)

    fun =
      &[
        ",\n",
        spaces(offset),
        Encoder.BitString.encode(encode_name(&1), options),
        ": ",
        Encoder.encode(OrdMap.get(ord_map, &1), options) | &2
      ]

    ["{\n", tl(:lists.foldl(fun, [], OrdMap.keys(ord_map))), ?\n, spaces(offset - indent), ?}]
  end

  def encode(ord_map, _, options) do
    fun =
      &[
        ?,,
        Encoder.BitString.encode(encode_name(&1), options),
        ?:,
        Encoder.encode(OrdMap.get(ord_map, &1), options) | &2
      ]

    [?{, tl(:lists.foldl(fun, [], OrdMap.keys(ord_map))), ?}]
  end
end
