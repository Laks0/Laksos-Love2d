local Button = {}

function Button:new(x,y,w,h,t,a)
  local this = {}
  this.x = x or 10
  this.y = y or 10
  this.w = w or 100
  this.h = h or 50
  this.t = t or "Button"
  this.a = a or function ()
    print("Button pressed")
  end
  this.color = {.9,.9,0}
  this.border_color = {0,0,0}
  this.text_color = {0,0,0}
  this.font = defaultFont
  this._update = nil

  setmetatable(this,self)
  self.__index = self
  return this
end

function Button:update(dt)
  if self._update ~= nil then
    self._update(dt)
  end

  if click and mouse_in(self.x,self.y,self.w,self.h) then
    self.a()
  end

  --draw
  render:rectangle("fill",self.x,self.y,self.w,self.h,5,self.color)
  render:rectangle("line",self.x,self.y,self.w,self.h,6,self.border_color,2)
  render:textf(self.t,self.x,self.y+self.h/2-self.font:getHeight(self.t)/2,
    "center",self.w,6,self.text_color,self.font)
end

return Button
