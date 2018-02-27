local inet = require("internet")

global function get(url)
  local req = inet.request(url)
  local body = ""
  if (req) then
    for line in req do
      body = body .. line .. "\n"
    end
  end
  return body
end

global function post(url, data)
  local req = inet.request(url, data)
  local body = ""
  if (req) then
    for line in req do
      body = body .. line .. "\n"
    end
  end
  return body
end
