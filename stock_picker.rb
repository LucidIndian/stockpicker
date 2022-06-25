def stock_picker(priceArray)
  # I watched my program bounce through the array of numbers 
  # to the cadence of my baby's breaths (inhalation/exhalation)
  # it's this: buy on day #1 (array position 0), then do the calcs 
  # for selling on buyday+1, buyday+2, buyday+3 until the end, 
  # Treat each day as a "buy" day, then calc potential profit of each sellday thereafter

  # Each day's potential profits will be saved in a nested array
  resultsArray = []

  priceArray.each_with_index do |buyprice,buyday| 
    # look for the largest in each to compare to the other buydays?
    lastindex = (priceArray.length-1)  
    # put each buyday's profit #s into an array, 
    # start of range should increment each buyday so as not to include previous as sell days
    newmapArray = (buyday..lastindex).map { |i| priceArray[i] - buyprice} # profit calc
    # get this new array into our resultsArray
    resultsArray.insert(buyday,newmapArray)
  end
  p resultsArray # debugging output. "p" is useful (it calls inspect() on the array)
  # first, find the highest profit buyday
  biggestProfit = resultsArray.flatten.max
  puts  "biggestProfit is $#{biggestProfit}"
  # the position of the sub array in the main array == buyday
  buydayIndex = resultsArray.index(resultsArray.find{|element| element.include?(biggestProfit)})
  puts "buydayIndex is #{buydayIndex}"
  # the position of the highest profit day within the subarray == sellday
  # have to adjust (+ buydayIndex at the end) cuz we skip sell days in the past, to get the correct index
  selldayIndex = resultsArray[buydayIndex].index(biggestProfit) + buydayIndex
  puts "selldayIndex is #{selldayIndex}"
  # return the day pair as an array [1,4]
  p finalArray = [buydayIndex,selldayIndex]
end

stock_picker([17,3,6,9,15,8,6,1,10])