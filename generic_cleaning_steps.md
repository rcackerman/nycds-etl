```
clean = open(filename, 'rb').read().replace('\r\n', '\n')
```

Search for `\n([^"])` and replace with `\\n\1`. Do this until it doesn't find this pattern any more.

Search for `([^"])\n"\n` and replace with `\1"\n`.

For events specifically, search for `^"([0-9]+)"\t"(N*)"\t\t` and replace with `"\1"\t"\2"\t""\t`.
