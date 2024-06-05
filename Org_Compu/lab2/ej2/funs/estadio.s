.ifndef estadio
.equ estadio, 0

.include "data.s"
.include "core/reset_celeste.s"
.include "funs/publico.s"

.globl estadio

/*
Fun: estadio
Hace: La funcion dibuja el estadio
*/

estadio:
	// Reserva espacio en el stack, guarda las variables que queremos conservar y la dir de retorno en el stack
    SUB SP, SP, #48
	STUR X1, [SP, #0]
	STUR X2, [SP, #8]
	STUR X3, [SP, #16]
	STUR X4, [SP, #24]
	STUR X5, [SP, #32]
    STUR LR, [SP, #40]

	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

	//fondo celeste
	BL reset_celeste
			
	// PINTO COLUMNAS #1
	MOV X1, #50					// pos x0
	MOV X2, #210			    //pos y0
	MOV X3, #40					// x ancho
	MOV X4, #70					//y alto
	LDR X5, =NEGRO 				// color
	BL rectangulo
	
	// PINTO COLUMNAS #2
	MOV X1, #170				// pos x0
	MOV X2, #210			    //pos y0
	MOV X3, #40					// x ancho
	MOV X4, #70					//y alto
	LDR X5, =NEGRO 				// color
	BL rectangulo
	
	// PINTO COLUMNAS #3
	MOV X1, #540				// pos x0
	MOV X2, #210			    //pos y0
	MOV X3, #40					// x ancho
	MOV X4, #70					//y alto
	LDR X5, =NEGRO 				// color
	BL rectangulo
	
	// PINTO COLUMNAS #4
	MOV X1, #420				// pos x0
	MOV X2, #210			    //pos y0
	MOV X3, #40					// x ancho
	MOV X4, #70					//y alto
	LDR X5, =NEGRO 				// color
	BL rectangulo
		
	// PINTO RECTANGULO SUP. [ESTADIO]
	MOV X1, #0					// pos x0
	MOV X2, #200				//pos y0
	MOV X3, SCREEN_WIDTH		// x ancho
	MOV X4, #25					//y alto
	LDR X5, =METAL 				// color
	BL rectangulo
	
	MOV X1, #0					// pos x0
	MOV X2, #200				//pos y0
	MOV X3, SCREEN_WIDTH		// x ancho
	MOV X4, #2					//y alto
	LDR X5, =BLANCO				// color
	BL rectangulo
	
	// PINTO RECTANGULO INF. [ESTADIO]
	MOV X1, #0					// pos x0
	MOV X2, #270				//pos y0
	MOV X3, SCREEN_WIDTH		// x ancho
	MOV X4, #400				//y alto
	LDR X5, =NEGRO 				// color
	BL rectangulo
	
	// NUBE [1]
	MOV X1, #240				// pos x0
	MOV X2, #111				//pos y0
	MOV X3, #133				// x ancho
	MOV X4, #17					//y alto
	LDR X5, =BLANCO 			// color
	BL rectangulo
	
	// NUBE [1] DETALLE #1
	MOV X1, #243				// pos x0
	MOV X2, #113				//pos y0
	MOV X3, #111				// x ancho
	MOV X4, #23					//y alto
	LDR X5, =BLANCO 			// color
	BL rectangulo
	
	// NUBE [1] DETALLE #2
	MOV X1, #247				// pos x0
	MOV X2, #107				//pos y0
	MOV X3, #111				// x ancho
	MOV X4, #23					//y alto
	LDR X5, =BLANCO 			// color
	BL rectangulo
	
	//NUBE [2]
	MOV X1, #420				// pos x0
	MOV X2, #70					//pos y0
	MOV X3, #133				// x ancho
	MOV X4, #17					//y alto
	LDR X5, =BLANCO 			// color
	
	BL rectangulo
	
	// NUBE [2] DETALLE #1
	MOV X1, #423				// pos x0
	MOV X2, #73					//pos y0
	MOV X3, #111				// x ancho
	MOV X4, #23					//y alto
	LDR X5, =BLANCO 			// color
	BL rectangulo
	
	// NUBE [2] DETALLE #2
	MOV X1, #427				// pos x0
	MOV X2, #67					//pos y0
	MOV X3, #111				// x ancho
	MOV X4, #23					//y alto
	LDR X5, =BLANCO 			// color
	BL rectangulo
	
	// CARTEL PUBLICO #1
	MOV X1, #520					
	MOV X2, #320					
	MOV X3, #30					
	MOV X4, #5			
	LDR X5, =PURPURA 
	BL rectangulo
	
	// CARTEL PUBLICO #2
	MOV X1, #50					
	MOV X2, #380					
	MOV X3, #30					
	MOV X4, #5			
	LDR X5, =PORTERO_FRA
	BL rectangulo
	
	BL publico
		
	// Fondo de la publicidad
	MOV X1, #0               // Coordenada X del rectangulo
	MOV X2, #420             // Coordenada Y del rectangulo
	MOV X3, #SCREEN_WIDTH    // Ancho del rectangulo
	MOV X4, #60              // Alto del rectangulo
	LDR X5, =MARRON          // Color de fondo de la publicidad
	BL rectangulo

	// Borde superior de la publicidad
	MOV X1, #0
	MOV X2, #420
	MOV X3, #SCREEN_WIDTH
	MOV X4, #2               	// Alto del borde superior
	LDR X5, =METAL          	// Color del borde
	BL rectangulo

  	// TRAVESANO [ARCO]
    MOV X1, #170  // Coordenada X (150 píxeles a la izquierda del centro de la pantalla)
    MOV X2, #379  // Coordenada Y del travesaño
    MOV X3, #300  // Ancho del travesaño
    MOV X4, #25   // Alto del travesaño
    LDR X5, =BLANCO
    BL rectangulo
   	   	
   	// POSTE IZQ. [ARCO]
    MOV X1, #170  // Coordenada X (150 píxeles a la izquierda del centro de la pantalla)
    MOV X2, #379  // Coordenada Y del travesaño
    MOV X3, #25   // Ancho del poste izquierdo
    MOV X4, #100  // Alto del poste izquierdo
    LDR X5, =BLANCO
    BL rectangulo
   	
    // POSTE DER. [ARCO]
    MOV X1, #445  // Coordenada X (150 píxeles a la derecha del centro de la pantalla)
    MOV X2, #379  // Coordenada Y del travesaño
    MOV X3, #25   // Ancho del poste derecho
    MOV X4, #100  // Alto del poste derecho
    LDR X5, =BLANCO
    BL rectangulo
    
	// BASE [COPA]
	MOV X1, #290      // Posición x inicial
	MOV X2, #120      // Posición y inicial (ajustada para la parte superior central)
	MOV X3, #60       // Ancho
	MOV X4, #20       // Alto
	LDR X5, =PORTERO_FRA   // Color
	BL rectangulo

	// CUERPO [COPA]
	MOV X1, #310      
	MOV X2, #90       
	MOV X3, #20       
	MOV X4, #30       
	LDR X5, =PORTERO_FRA   
	BL rectangulo

	// PARTE ARR. [COPA]
	MOV X1, #280      
	MOV X2, #60       
	MOV X3, #80       
	MOV X4, #30       
	LDR X5, =PORTERO_FRA   
	BL rectangulo

	// DETALLE CENTRO [COPA]
	MOV X1, #300     
	MOV X2, #70       
	MOV X3, #40       
	MOV X4, #10       
	LDR X5, =GRIS 
	BL rectangulo

	// CUERPO [COPA]
	MOV X1, #310      
	MOV X2, #90       
	MOV X3, #20       
	MOV X4, #30       
	LDR X5, =PORTERO_FRA   
	BL rectangulo

	// PARTE ARR. [COPA]
	MOV X1, #280      
	MOV X2, #60       
	MOV X3, #80       
	MOV X4, #30       
	LDR X5, =PORTERO_FRA   
	BL rectangulo

	// DETALLE CENTRO [COPA]
	MOV X1, #300     
	MOV X2, #70       
	MOV X3, #40       
	MOV X4, #10       
	LDR X5, =GRIS 
	BL rectangulo

	BL bandera_arg

	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	// Carga la dirección de retorno, devuelve los valores previos de las variables usadas y libera la memoria del stack
	LDUR X1, [SP, #0]
	LDUR X2, [SP, #8]
	LDUR X3, [SP, #16]
	LDUR X4, [SP, #24]
	LDUR X5, [SP, #32]
    LDUR LR, [SP, #40]
    ADD SP, SP, #48

ret

.endif
