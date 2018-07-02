local NuevoReceptor R in
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
   {NuevoReceptor R}
   {Delay 5000}
   {Send R 'Hola'}
   {Delay 5000}
   {Send R 'Chau'}
end
