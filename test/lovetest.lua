local lovetest = {}

lovetest._version = "0.1.0"

-- Search the passed in arguments for either -t or --test
function lovetest.detect(args) 
  for _, flag in ipairs(args) do
    if flag == "-t" or flag == "--test" then
      return true
    end
  end
  return false
end

local function enumerate(dir)
  if love.filesystem.enumerate then
    return love.filesystem.enumerate(dir)
  else
    return love.filesystem.getDirectoryItems(dir)
  end
end

-- Run the unit tests, On windows, don't quit. This allows the user to see the
-- test results in the console
function lovetest.run() 
  require "test/lunatest"

  for _, filename in ipairs(enumerate('test')) do
    if filename:match("^test_.*%.lua$") then
      local testname = (filename:gsub(".lua", ""))
      lunatest.suite("test/" .. testname)
    end
  end

  local opts = {verbose=true}
  local failures = lunatest.run(nil, opts)

  if love._os ~= "Windows" then
    if failures > 0 then
      os.exit(failures)
    else
      love.event.push("quit")
    end
  end
end

return lovetest
