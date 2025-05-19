            IDENTIFICATION DIVISION. 
            PROGRAM-ID. tp.
            DATA DIVISION.
               WORKING-STORAGE SECTION. 
               01 OUT-MSG.
                02 FILLER PIC X(6) VALUE "Hello ". 
                02 MSG    PIC X(20).
               01 INP-MSG PIC X(20) VALUE "What is your name? ".
               01 SEED PIC 9(8) VALUE 12345678.   
               01 NB_ALEATOIRE PIC 9(3) VALUE 000. 
               01 nbEntree PIC 999.
            SCREEN SECTION.
               01 pla-titre.
                   02 BLANK SCREEN.
                   02 LINE 2 COL 15 VALUE 'Jeu du plus et du moins'.  
            
               01 pla-plus.
                   02 LINE 4 COL 5 VALUE 'C''est plus !'.
               01 pla-moins.
                   02 LINE 4 COL 5 VALUE 'C''est moins !'.
               01 pls-trouve.
                   02 LINE 4 COL 5 VALUE 'BRAVO ! Vous avez trouvé !'.
               01 pls-nb.
                   02 LINE 6 COL 5 VALUE 'Veuillez entrer un nombre : '.
                   2 PIC zzz to nbEntree REQUIRED.

            
            PROCEDURE DIVISION.
        
               MOVE function current-date(9:8) TO SEED.
               COMPUTE NB_ALEATOIRE = FUNCTION RANDOM(SEED) * 100 + 1.
               
               initialize nbEntree
               DISPLAY pla-titre.

               PERFORM UNTIL nbEntree = NB_ALEATOIRE
                   DISPLAY pls-nb
                   ACCEPT pls-nb

                   IF nbEntree>NB_ALEATOIRE THEN
                       DISPLAY pla-moins
                   ELSE   
                       DISPLAY pla-plus
                   END-IF
               END-PERFORM.

               DISPLAY pls-trouve.
               
               *> MOVE NB_ALEATOIRE TO MSG.
               *> DISPLAY OUT-MSG.
       
            END PROGRAM tp.
