{showBase, BaseRepresentation} = require './base-class.coffee'

Phi = ((Math.sqrt 5)+1)/2
E = Math.E
EE = E*E
PI = Math.PI
sqrt2 = Math.sqrt 2
sqrt3 = Math.sqrt 3
sqrt5 = Math.sqrt 5
sqrt6 = Math.sqrt 6
bases  = [showBase "Phi",Phi
  showBase "Phi^2",Phi*Phi
  showBase "Phi^3",Phi*Phi*Phi
  showBase "Phi^4",Phi*Phi*Phi*Phi
  showBase "Phi^5",Phi*Phi*Phi*Phi*Phi
  showBase "Phi^6",Phi*Phi*Phi*Phi*Phi*Phi
  showBase "E",E
  showBase "E^2",E*E
  showBase "E^E",E**E
  showBase "PI",PI
  showBase "SQRT2",sqrt2
  showBase "SQRT3",sqrt3
  showBase "SQRT5",sqrt5
  showBase "SQRT6",sqrt6
  showBase "5dot9",5.9
  showBase "6dot9",6.9
  showBase "m235", (((Math.sqrt 2)+1)/2) * (((Math.sqrt 3)+1)/2)  * ((Math.sqrt 5)+1)/2
  showBase "Geo2" , ((Math.sqrt 2)+1)/2
  showBase "Geo-2" , 2/((Math.sqrt 2)-1)
  showBase "Geo3" , ((Math.sqrt 3)+1)/2
  showBase "Geo-3" , 2.0/((Math.sqrt 3)-1)
  showBase "Geo7" , ((Math.sqrt 7)+1)/2
  showBase "Geo-7" , 2.0/((Math.sqrt 7)-1)
  showBase "7dot9",7.9
  ]

for b in bases
  for target in bases
    b.output "Base #{b.baseID} encoding for #{target.baseID}                       ".slice(0,30), b.shootFor target.baseQuantity
    console.log "Base #{b.baseID} encoding for #{target.baseID}                       ".slice(0,30), b.shootFor target.baseQuantity


