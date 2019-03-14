
------------------------------------------------------------------
------------------------------------------------------------------
-------------------------- TO DO ---------------------------------

-- Restrict by vehicle or job classification.
-- Fix so text reflects red upon getting into vehicle instead of green.
-- Figure out why its got a 0.10ms RESMON.



local ped = PlayerPedId()
local veh = GetVehiclePedIsUsing(ped)

mainOn = false
secOn = false
takeOn = false
steadyOn = false
warnOn = false
alleyOn = false


Citizen.CreateThread(function()
	while true do
		Wait(0)

-- Main Light Bar -- Extra 7

		if not IsVehicleExtraTurnedOn(veh, 7) and IsControlJustReleased(0, 124) then 
			SetVehicleExtra(veh, 7, 0)
			mainOn = false
			TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 5, 'click', 0.5)
			print("Playing Sound")
		elseif IsControlJustReleased(0, 124) then -- Numpad 4
			SetVehicleExtra(veh, 7, 1)
			mainOn = true
			TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 5, 'click', 0.5)
		end

-- Secondaries -- Extra 8

		if not IsVehicleExtraTurnedOn(veh, 8) and IsControlJustReleased(0, 126) then 
			SetVehicleExtra(veh, 8, 0)
			secOn = false
			TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 5, 'click', 0.5)
		elseif IsControlJustReleased(0, 126) then -- Numpad 5
			SetVehicleExtra(veh, 8, 1)
			secOn = true
			TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 5, 'click', 0.5)
		end

-- Front Takedown Flashers -- Extra 9

		if not IsVehicleExtraTurnedOn(veh, 9) and IsControlJustReleased(0, 125) then 
			SetVehicleExtra(veh, 9, 0)
			takeOn = false
			TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 5, 'click', 0.5)
		elseif IsControlJustReleased(0, 125) then -- Numpad 6
			SetVehicleExtra(veh, 9, 1)
			takeOn = true
			TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 5, 'click', 0.5)
		end

-- Cruise Lights -- Extra 10

		if not IsVehicleExtraTurnedOn(veh, 10) and IsControlJustReleased(0, 117) then 
			SetVehicleExtra(veh, 10, 0)
			steadyOn = false
			TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 5, 'click', 0.5)
		elseif IsControlJustReleased(0, 117) then -- Numpad 7
			SetVehicleExtra(veh, 10, 1)
			steadyOn = true
			TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 5, 'click', 0.5)
		end

-- Yellow Rear Flashers -- Extra 11

		if not IsVehicleExtraTurnedOn(veh, 11) and IsControlJustReleased(0, 127) then 
			SetVehicleExtra(veh, 11, 0)
			warnOn = false
			TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 5, 'click', 0.5)
		elseif IsControlJustReleased(0, 127) then -- Numpad 8
			SetVehicleExtra(veh, 11, 1)
			warnOn = true
			TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 5, 'click', 0.5)
		end

-- Alley Lights -- Extra 12

		if not IsVehicleExtraTurnedOn(veh, 12) and IsControlJustReleased(0, 118) then 
			SetVehicleExtra(veh, 12, 0)
			alleyOn = false
			TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 5, 'click', 0.5)
		elseif IsControlJustReleased(0, 118) then -- Numpad 9
			SetVehicleExtra(veh, 12, 1)
			alleyOn = true
			TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 5, 'click', 0.5)
		end
	end
end)

------------------------------------------------------------------
------------------------------------------------------------------
------------------------------------------------------------------

function DrawAdvancedText(x,y ,w,h,sc, text, r,g,b,a,font,jus)
    SetTextFont(font)
    SetTextProportional(0)
    SetTextScale(sc, sc)
	N_0x4e096588b13ffeca(jus)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
	DrawText(x - 0.1+w, y - 0.02+h)
end


Citizen.CreateThread(function()
    while true do
        Wait(0)
		if IsPedInAnyVehicle(ped, true) then
			DrawRect(0.085, 0.78, 0.140, 0.030, 0, 0, 0, 150)
	        if not mainOn then
	            DrawAdvancedText(0.120, 0.785, 0.005, 0.0028, 0.3, "Main", 0, 255, 0, 255, 6, 0)
	        else
	            DrawAdvancedText(0.120, 0.785, 0.005, 0.0028, 0.3, "Main", 255, 0, 0, 255, 6, 0)
	        end

	        if not secOn then 
	        	DrawAdvancedText(0.143, 0.785, 0.005, 0.0028, 0.3, "Secondary", 0, 255, 0, 255, 6, 0)
	        else
	       		DrawAdvancedText(0.143, 0.785, 0.005, 0.0028, 0.3, "Secondary", 255, 0, 0, 255, 6, 0)
	        end

	        if not takeOn then 
	    		DrawAdvancedText(0.174, 0.785, 0.005, 0.0028, 0.3, "Take Down", 0, 255, 0, 255, 6, 0)
	        else
	   			DrawAdvancedText(0.174, 0.785, 0.005, 0.0028, 0.3, "Take Down", 255, 0, 0, 255, 6, 0)
	        end

	        if not steadyOn then 
	    		DrawAdvancedText(0.202, 0.785, 0.005, 0.0028, 0.3, "Steady", 0, 255, 0, 255, 6, 0)
	        else
	   			DrawAdvancedText(0.202, 0.785, 0.005, 0.0028, 0.3, "Steady", 255, 0, 0, 255, 6, 0)
	        end

	        if not warnOn then 
	    		DrawAdvancedText(0.222, 0.785, 0.005, 0.0028, 0.3, "Warn", 0, 255, 0, 255, 6, 0)
	        else
	   			DrawAdvancedText(0.222, 0.785, 0.005, 0.0028, 0.3, "Warn", 255, 0, 0, 255, 6, 0)
	        end

	        if not alleyOn then 
	    		DrawAdvancedText(0.240, 0.785, 0.005, 0.0028, 0.3, "Alley", 0, 255, 0, 255, 6, 0)
	        else
	   			DrawAdvancedText(0.240, 0.785, 0.005, 0.0028, 0.3, "Alley", 255, 0, 0, 255, 6, 0)
	        end
	    end
    end
end)

