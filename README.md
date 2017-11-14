# [OrdMap](https://github.com/MartinKavik/ord_map) encoder for [Poison](https://github.com/devinus/poison)

[![Hex.pm](https://img.shields.io/hexpm/v/ord_map_encoder_poison.svg?style=flat-square)](https://hex.pm/packages/ord_map_encoder_poison)

## Usage
```elixir
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
```

## Installation

First, add encoder to your mix.exs dependencies:

```elixir
def deps do
  [
    {:ord_map_encoder_poison, "~> 0.1.0"}
  ]
end
```

Then, update your dependencies:

```sh-session
$ mix deps.get
```

## License

OrdMapEncoderPoison is released under MIT (see [`LICENSE`](LICENSE)).

