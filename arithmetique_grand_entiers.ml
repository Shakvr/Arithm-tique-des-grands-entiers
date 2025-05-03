open List ;;


let int_digits : string list = ["1";"2";"3";"4";"5";"6";"7";"8";"9"] ;; (*Liste des chiffres de 1 à 9  en base 10*)

(*nabil*)
let string_to_list( s : string) : string list =
  s |> String.to_seq |> Seq.map (fun c -> String.make 1 c) |> List.of_seq
;; (*Convertit une chaîne de cractères en liste de chaines de caractères*)

(*nabil*)
let lst ( p_list : string list ) : string = 
    (*-----------------fonction recursive---------------------*)
   let rec lst_aux (p_list : 'a list ) : 'a =
     if length( p_list) = 1 then hd(p_list)
     else lst_aux(tl(p_list))
   in
   if p_list = [] then failwith " ahahahah"
   else 
     lst_aux( p_list)
 ;; (*fonction qui donne le dernier élement d'une liste *)



(*Nabil*)
 let  rem_lst ( p_list : string list ) : string list =
(*-----------------fonction recursive---------------------*)
  let rec rem_lst_aux ( p_list : 'a list ) : 'a list =
    if length(p_list) = 1 then [ ]
    else
      hd(p_list) :: rem_lst_aux( tl( p_list ))
  in
  if p_list =  [ ] then failwith " Erreur  "
  else 
    rem_lst_aux( p_list)
;; (*fonction qui enlève le dernierelement d'une liste*)

(*Nabil*)
let rec digit_successeur (p_n, p_digits: string * string list) : string = (*fonction sucesseur appliqué sur les chiffres uniquement *)
    if p_n = "0" then 
        hd (p_digits)  
    else if hd (p_digits) = p_n then
        hd (tl (p_digits)) 
    else if p_n = "9" then
        "0"
    else
        digit_successeur (p_n, tl(p_digits))       
;;   

(*nabil*)
let  successeur (p_n, p_digits: string * string list) : string =
    let n = string_to_list p_n in 
    
    (* Fonction auxiliaire récursive *)
    let rec aux (digits, carry: string list * bool) : string list =
      if (digits = []) then (
        if carry then ["1"] else []
      )
      else (
        let last = lst digits in 
        let rest = rem_lst digits in 
        
        let (new_last, new_carry) = 
          if carry then (
            if (last = "9") then ("0", true)
            else (digit_successeur (last, p_digits), false)
          )
          else (last, false)
        in
        
        let result = aux (rest, new_carry) in 
        new_last :: result
      )
    in
    
    (* Appel final avec inversion de l'ordre *)
    List.rev (aux (n, true)) |> String.concat ""
  ;;




successeur("65985", int_digits) ;;



(*Arshad*)
let predecesseur (p_n, p_digits: string * string list) : string =
  let rec find_predecessor (current, target, digits: string * string * string list) : string =
    if successeur (current, digits) = target then current
    else find_predecessor (successeur (current, digits), target, digits)
  in
  if p_n = "0" then
    failwith "Erreur : 0 n'a pas de prÃ©dÃ©cesseur."
  else
    find_predecessor ("0", p_n, p_digits)
;;


let rec addition (x, y, p_digits: string * string * string list) : string =
  if y = "0" then x  (* Cas de base *)
  else 
    let x_incr = successeur (x, p_digits) in  (* x + 1 avec ta fonction *)
    let y_decr = predecesseur (y, p_digits) in  (* y - 1 avec la mienne en gros *)
    addition (x_incr, y_decr, p_digits)  
;;
  
predecesseur ("12", int_digits) ;; (* -> "11" *)
predecesseur ("10", int_digits) ;; (* -> "9" *)
predecesseur ("20", int_digits) ;; (* -> "19" *)
predecesseur ("100", int_digits) ;; (* -> "99" *)







(*Nabil*)

let rec multiplication (p_x, p_y, p_digits : string * string * string list) : string = 
  if p_y = "0" then
    "0"
  else
    addition(p_x,  multiplication(p_x, predecesseur(p_y, p_digits), p_digits) ,p_digits)
;;
multiplication("400","3", int_digits);;
