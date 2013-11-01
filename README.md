# Lovetest

Unit testing for LOVE games, powered by Lunatest.

## Features

- Simple setup with zero depenedencies
- Run tests via the command line
- Create tests quickly

## Usage

Download [the latest release][rel] and unzip it into the same folder as your
`main.lua` file.

In `main.lua`, add the following lines to your `love.load` function. Add the
function if you don't have it already.

```lua
local lovetest = require "test/lovetest"

function love.load(arg)
  -- Check for the testing command line flags
  if lovetest.detect(arg) then
    -- Run the tests
    lovetest.run()
  end
end
```

Using the command line, you can now run your unit tests

    love path/to/game --test

## Writing Tests

Tests are just lua scripts stored in the `test` directory. Their filename must
begin with `test_`. Each unit test function's name must also begin with `test_`.

### Example Test

We're going to test that addition works (dumb, I know). Create a file inside
the `test` directory named `test_math.lua` with the following contents.

```lua
function test_addition() 
  assert_equal(2 + 2, 4)
end

function test_subtraction()
  assert_equal(2 - 2, 0)
end
```

For more information on writing tests, read the Lunatest [documentation][doc]
and [examples][exa].

[doc]: https://github.com/silentbicycle/lunatest
[exa]: https://github.com/silentbicycle/lunatest/blob/master/test.lua
[rel]: http://example.com
