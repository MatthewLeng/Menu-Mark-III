AddClassPostConstruct("widgets/redux/mainmenu_motdpanel", function(self)
	
	self.oldinit = self.OnImagesLoaded
		self:SetPosition(-380, 350)
		self.config.bg:Kill()
		self.config.bg = self.bg:AddChild(Image("images/redstone_bottom.xml", "redstone_bottom.tex"))
		self.config.bg:SetScale(.669)
		self.config.bg:SetTint(255, 255, 255, 0.5)
		self.config.bg:SetPosition(0, -160)
		self.config.bg:SetClickable(false)



	self.OnImagesLoaded = function(self)
		self:Hide()


		self.inst:DoPeriodicTask(0, function()
			self:Show()
			
			self.config.bg:Kill()
			
			self.config.bg = self.bg:AddChild(Image("images/redstone_bottom.xml", "redstone_bottom.tex"))
			self.config.bg:SetScale(.669)
			self.config.bg:SetTint(255, 255, 255, 1)
			self.config.bg:SetPosition(0, -160)
			self.config.bg:SetClickable(false)
			self.config.bg:MoveToBack()




			self:SetPosition(-380, 350)
		end)
		
		self.oldinit(self)
	end

end)