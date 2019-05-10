
GLOBAL.DISABLE_MOD_WARNING = true 
AddClassPostConstruct("screens/redux/mainscreen", function(self, Sim)
	self.bg:Kill()
	self.title:Kill()
	
	

	self.logo = self.fixed_root:AddChild(UIAnim())
	self.logo:GetAnimState():SetBank("redstone")
	self.logo:GetAnimState():SetBuild("dst_menu_redstone")
	self.logo:GetAnimState():PlayAnimation("logo")
	self.logo:SetScale(.7, .7, .7)

	self.play_button:Kill()

	self.presents_image:Kill()
	self.legalese_image:Kill()

	self.exit_button:Kill()
	self.updatename:Kill()


	self.inst:DoTaskInTime(GetModConfigData("logod"), function()


		self:OnLoginButton(true)
		
	end)


  	self.oldInit = self.OnUpdate
	self.OnUpdate = function(self)
		

		



		self.inst:DoTaskInTime(.1, function()
			TheSim:SetReverbPreset("low")
	        GLOBAL.TheFrontEnd:GetSound():SetVolume("FEMusic", 0.1)
	    end)

   		self.oldInit(self)
   	end



   	








end)



AddClassPostConstruct("screens/redux/multiplayermainscreen", function(self)



	--self.fg = self.fixed_root:AddChild(Image("images/bg_redux_dark_right.xml","dark_right.tex"))
	self.fg = self.fixed_root:AddChild(Image("images/redstone_bg.xml","redstone.tex"))
	self.fg:SetTint(255, 255, 255, .5)


	self.banner_root:SetPosition(0,-100)

	if self.logo then self.logo:Kill() end

	self.banner_root:Kill()


	local anim = self.fixed_root:AddChild(UIAnim())
	
	if IsFestivalEventActive(FESTIVAL_EVENTS.LAVAARENA) then
		anim:GetAnimState():SetBuild("dst_menu_lavaarena_s2")
		anim:GetAnimState():SetBank("dst_menu_lavaarena_s2")
		anim:GetAnimState():PlayAnimation("idle", true)
		anim:SetScale(0.48)
		anim:SetPosition(0, -160)
	elseif IsSpecialEventActive(SPECIAL_EVENTS.HALLOWED_NIGHTS) then
		anim:GetAnimState():SetBuild("dst_menu_halloween")
		anim:GetAnimState():SetBank("dst_menu_halloween")
		anim:GetAnimState():PlayAnimation("anim", true)
		anim:SetScale(0.67)
		anim:SetPosition(183, 40)
	elseif IsSpecialEventActive(SPECIAL_EVENTS.WINTERS_FEAST) then
		local anim_bg = self.fixed_root:AddChild(UIAnim())
		anim_bg:GetAnimState():SetBuild("dst_menu_feast_bg")
		anim_bg:GetAnimState():SetBank("dst_menu_bg")
		anim_bg:SetScale(0.7)
		anim_bg:GetAnimState():SetDeltaTimeMultiplier(1.6)
		anim_bg:GetAnimState():PlayAnimation("loop", true)
		anim_bg:MoveToBack()
        
		anim:GetAnimState():SetBuild("dst_menu_feast")
		anim:GetAnimState():SetBank("dst_menu")
		anim:SetScale(0.7)
		anim:GetAnimState():PlayAnimation("loop", true)
	elseif IsSpecialEventActive(SPECIAL_EVENTS.YOTP) then
		local anim_bg = self.fixed_root:AddChild(UIAnim())
		anim_bg:GetAnimState():SetBuild("dst_menu_pig_bg")
		anim_bg:GetAnimState():SetBank("dst_menu_pig_bg")
		anim_bg:SetScale(0.7)
		anim_bg:GetAnimState():PlayAnimation("loop", true)
		anim_bg:MoveToBack()
        
		anim:GetAnimState():SetBuild("dst_menu_pigs")
		anim:GetAnimState():SetBank("dst_menu_pigs")
		anim:SetScale(2/3)

        local function onanimover(inst)
            inst.AnimState:PlayAnimation("loop")

            inst:DoTaskInTime(94 * FRAMES, PlayBannerSound, self, "dontstarve/pig/pig_king_laugh")
            inst:DoTaskInTime(102 * FRAMES, PlayBannerSound, self, "dontstarve/pig/pig_king_laugh")
            inst:DoTaskInTime(109 * FRAMES, PlayBannerSound, self, "dontstarve/pig/pig_king_laugh")
            inst:DoTaskInTime(118 * FRAMES, PlayBannerSound, self, "dontstarve/pig/pig_king_laugh")

            inst:DoTaskInTime(32 * FRAMES, PlayBannerSound, self, "dontstarve/pig/come_at_me")
            inst:DoTaskInTime(40 * FRAMES, PlayBannerSound, self, "dontstarve/pig/come_at_me")
            inst:DoTaskInTime(151 * FRAMES, PlayBannerSound, self, "dontstarve/pig/come_at_me")
            inst:DoTaskInTime(161 * FRAMES, PlayBannerSound, self, "dontstarve/pig/come_at_me")
        end
        anim.inst:ListenForEvent("animover", onanimover)
        onanimover(anim.inst)
	else
        anim:GetAnimState():SetBuild("dst_menu_willow")
        anim:GetAnimState():SetBank("dst_menu_willow")
        anim:GetAnimState():PlayAnimation("loop", true)
        anim:SetScale(.667)
        anim:SetPosition(0, 0)
	end




	anim:GetAnimState():HideSymbol("bg")
	anim:GetAnimState():HideSymbol("fade")

	anim:MoveToBack()
	self.fg:MoveToBack()













	self.info_panel:SetScale(.8, .8, .8)










	self.oldInit = self.OnUpdate
	self.OnUpdate = function(self)
		
		self.inst:DoTaskInTime(.1, function()
			GLOBAL.TheFrontEnd:GetSound():SetVolume("FEMusic", 1)
			TheSim:SetReverbPreset("default")
	    end)

   		self.oldInit(self)
   	end


end)