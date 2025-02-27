



; 	metrowerks sample code



	section		rtlib
	org p:
 	
	global Fasmadd

	SUBROUTINE "Fasmadd",Fasmadd,FasmaddEND-Fasmadd

 Fasmadd:

	adda	#2,SP
	move.w 	y1,X:(SP)
	add.w  	X:(SP),y0
	suba	#2,SP
 	rts
 	
 FasmaddEND:
 
 	endsec
 	
	end
