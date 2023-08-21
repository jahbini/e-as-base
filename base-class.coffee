fs = require 'node:fs'
exports.BaseRepresentation = class BaseRepresentation
  ###*
  * BaseRepresentation will generate powers for conversion to
  * alternate base representation
  * @constructor
  * @param baseID { string } symbolic representation
  * @param baseQuantity { numeric } anythin greater than one
  ###
  constructor: (@baseID,@baseQuantity)->
    console.log "constructed",@baseID,@baseQuantity
    # locate the high values for close inspection
    #
    @outputFile = fs.openSync "./#{@baseID}.txt","w"
    resolution =40
    resolution += 40 if @baseQuantity < 2
    @powers = [ 0 .. resolution ]
    baseInverse = 1.0/@baseQuantity
    @powers[4]=1.0
    
    for i in [ 5 .. resolution ]
      @powers[i] = @powers[i-1]*baseInverse
    for i in [3 .. 0]
      @powers[i] = @powers[i+1] * @baseQuantity
    @max = Math.floor  @powers[0]*Math.floor 1+(@powers[0]/@powers[1])
  output: (texts...) ->
    fs.writeSync @outputFile, (texts.join " ")+"\n"
  ###*
  * BaseRepresentation#shootFor
  * generates the string representation of the input value
  * @parm {numeric}
  ###
  shootFor:(target) ->
    current=0
    result=""
    terminated = false
    tooFar = Math.ceil @baseQuantity
    tooLittle = @powers[@powers.length-1]
    digitAtPower=(destination,currentEstimate,powerValue)=>
      for i in [1 .. tooFar ]
        tmp = (powerValue * i) + currentEstimate
        tmpHi = tmp + tooLittle
        tmpLo = tmp - tooLittle
        return i-1  if destination < tmpLo
      return tooFar
    lastPower = 1000000 #anything 
    for power,i in @powers
      continue if terminated
      multiplier = digitAtPower target, current, power
      ohNo = multiplier == tooFar
      if ohNo
        terminated = power < 1
        result += "!"
      current += power * multiplier
      result += "." if lastpower >= 1 && power < 1
      multiplier = String.fromCharCode('a'.charCodeAt()-10+multiplier) if multiplier > 9
      result += multiplier
      lastpower = power
    return result + ", diff = #{target-current}"

###*
* @static @function showBase
* @param { string } symbolic value
* @param { number } base for new representations
###
exports.showBase =(symbol,base)->
  theBase = new BaseRepresentation symbol,base
  theBase.output "Inverses and integers in base",symbol
  limit = theBase.max
  for j in [1 .. 40 ]
    spacer = ''
    spacer = " " if j < 10
    theBase.output "(1/#{j})base",symbol,spacer, (theBase.shootFor 1.0/j) 
  theBase.output ""
  theBase.output "integers"
  if limit <75
    for j in [1 .. limit+3]
      spacer = ''
      spacer = " " if j < 10
      theBase.output "(#{j})base  ",symbol,spacer, (theBase.shootFor j) 
  else
    for j in [1 .. 75]
      spacer = ''
      spacer = " " if j < 10
      theBase.output "(#{j})base  ",symbol,spacer, (theBase.shootFor j) 
    theBase.output "..."
    for j in [limit - 30 .. limit+10]
      spacer = ''
      theBase.output "(#{j})base  ",symbol,spacer, (theBase.shootFor j) 
  return theBase

