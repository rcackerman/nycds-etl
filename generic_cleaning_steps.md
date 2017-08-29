```
import re

raw = open(filename, 'rb').read()

# To split correctly, look ahead for a quote mark followed by a number.
lines = re.split(r'\r\n(?="[0-9])', raw)
```

Search for `\n([^"])` and replace with `\\n\1`. Do this until it doesn't find this pattern any more.

Search for `([^"])\n"\n` and replace with `\1"\n`.

For events specifically, search for `^"([0-9]+)"\t"(N*)"\t\t` and replace with `"\1"\t"\2"\t""\t`.

To test for double quotes at the end of a line: `r'(?<!\s)"(?="([\t\n]|$))'`
