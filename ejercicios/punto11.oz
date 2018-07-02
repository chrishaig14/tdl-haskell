local NuevoReceptor NuevoFiltro R D Check in
   % crea nuevo agente que recibe en Puerto e imprime el mje recibido
   proc {NuevoReceptor Puerto}
      local Recibir in
	 proc {Recibir S}
	 case S of H|T then {Browse 'Recibi '#H} {Recibir T} end
      end
      local S in
	 {NewPort S Puerto}
	 thread {Recibir S} end
      end
      end
   end

   % crea un nuevo agente que recibe en Puerto, chequea con la función Check y si es aceptado, reenvía a Destino
   proc {NuevoFiltro Puerto Check Destino}
      local Recibir in
	 proc {Recibir S}
	    case S of H|T then
	       if {Check H} then
		  {Browse 'Filtro -> reenvio '#H}
		  {Send Destino H}
	       else
		  {Browse 'Filtro -> no reenvio'#H}
	       end
	       {Recibir T}
	    end
	 end
	 local S in
	    {NewPort S Puerto}
	    thread {Recibir S} end
	 end
      end
   end

   fun {Check X}
      X > 10
   end
   
   
   {NuevoReceptor D}
   {NuevoFiltro R Check D}
   {Delay 5000}
   {Send R 5}
   {Delay 5000}
   {Send R 12}
   {Delay 5000}
   {Send R 8}
   {Delay 5000}
   {Send R 15}
end
