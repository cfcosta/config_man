# ConfigMan

ConfigMan is a simple library, without external dependencies, to load config files and expose an interface on top of them.

## How to Use

Let's say for example we have this yaml config file:

```yaml
  foo:
    bar:
      baz: qux
    barbar: [1,2,3]
    bazbaz:
      foofoo:
        barbar: qux
```

We can load it like this:

```ruby
config = ConfigMan::Loader.new('config/config.yml')
config.foo.bar.baz # "qux"
config.foo.barbar # [1,2,3]
config.foo.bazbaz.foofoo.barbar # "qux"
```

Instead of acessing it directly, we can also export as a hash:

```ruby
config.foo.to_hash # {bar: {baz: "qux"}, barbar: [1,2,3], ...}
```
