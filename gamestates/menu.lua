local menu = {}

local W, H = love.graphics.getWidth(), love.graphics.getHeight()
local classicButton
local optionsButton

function menu:init()
  font14 = love.graphics.newFont(14)
  font20 = love.graphics.newFont(20)
  font60 = love.graphics.newFont(60)

  classicButton = gui:button('Classic', {W/3, H/2-math.floor(font60:getHeight("Just Tanks") / 3), 100, 50})
  classicButton.click = function(this) return Gamestate.switch(game, 1) end
  classicButton.style.default = {45/255, 150/255, 89/255, 1}
  classicButton.style.hilite = {60/255, 165/255, 104/255, 1}

  optionsButton = gui:button('Options', {W/3, H/2-math.floor(font60:getHeight("Just Tanks") / 3) + 60, 100, 50})
  optionsButton.click = function(this)
    menu.hideGui()
    return Gamestate.push(options)
  end
  optionsButton.style.default = {45/255, 120/255, 89/255, 1}
  optionsButton.style.hilite = {60/255, 135/255, 104/255, 1}
end

function menu:enter()
  menu.showGui()
  state = controls.menu
  player.lives = 3
end

function menu:resume()
  menu.showGui()
  state = controls.menu
end

function menu:leave()
  menu.hideGui()
end

function menu.hideGui()
  classicButton:hide()
  optionsButton:hide()
end

function menu.showGui()
  classicButton:show()
  optionsButton:show()
end

function menu:draw()
	love.graphics.setBackgroundColor(57/255, 194/255, 114/255, 0)
  love.graphics.setFont(font60)
  love.graphics.print("Just Tanks", W / 2, H / 2, 0, 1, 1, 0, math.floor(font60:getHeight("Just Tanks") / 2))
  love.graphics.setFont(font14)
  love.graphics.print("WASD or arrow keys to move, left click to shoot.", W / 2, H / 2 + 75, 0, 1, 1, 0, math.floor(font60:getHeight("Just Tanks.") / 2))
end

return menu
