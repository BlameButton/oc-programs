local inet = require("internet")
local json = require("json")

local restutils = {}

function restutils.stringify(data)
  return json.stringify(data)
end

function restutils.parse(data)
  return json.parse(data)
end

function restutils.get(url)
  local req = inet.request(url)
  local body = ""
  if req then
    for line in req do
      body = body .. line .. "\n"
    end
  end
  return body
end

function restutils.getJson(url)
  local req = inet.request(url)
  local body = ""
  if req then
    for line in req do
      body = body .. line
    end
  end
  return json.parse(body)
end

function restutils.post(url, data)
  local req = inet.request(url, data)
  local body = ""
  if req then
    for line in req do
      body = body .. line .. "\n"
    end
  end
  return body
end

function restutils.postJson(url, data)
  local req = inet.request(url, data)
  local body = ""
  if req then
    for line in req do
      body = body .. line
    end
  end
  return json.parse(body)
end

return restutils