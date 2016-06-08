#http://ec.europa.eu/dgs/home-affairs/what-we-do/policies/borders-and-visas/border-crossing/schengen_calculator_en.html

append = (str) ->
  append s, "BLACK"
  return
append = (str, fstr) ->
  x = document.getElementById("report")
  newDiv = document.createElement("div")
  switch fstr
    when "green"
      newDiv.innerHTML = "<div style=color:green>" + str + "</div>\n"
    when "red"
      newDiv.innerHTML = "<div style=color:red>" + str + "</div>\n"
    when "black"
      newDiv.innerHTML = "<div style=color:green>" + str + "</div>\n"
    else
      newDiv.innerHTML = "<div style=color:black>" + str + "</div>\n"
  x.appendChild newDiv
  return
settingDate = (t) ->
  x = document.getElementById("TxtField")
  str = x.value
  i = 0
  isValidChar = true
  while i < str.length
    switch str.charAt(i)
      when "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "/"
      else
        isValidChar = false
        alert "The only valid caracters are numbers and /"
        str = ""
    i++
  if isValidChar
    str = str.substr(0, 2) + "/" + str.substr(2, 6)  if str.charAt(2) isnt "/" and str.length > 2
    str = str.substr(0, 5) + "/" + str.substr(5, 6)  if str.charAt(5) isnt "/" and str.length > 5
  if str.length is 8
    unless str is DateToString(StringToDate(str))
      alert "The date " + str + " is not a valid date."
      str = ""
  else
    alert "The date " + str + " must be on the following format ddmmyy or dd/mm/yy"
  x.value = str
  return
cleanReport = ->
  x = document.getElementById("report")
  x.innerHTML = ""
  false

cleanForm = ->
  if confirm("Are you sure you want reset the form? Answering OK will erase all entered data.")
    document.getElementById("TxtField").value = DateToString(new Date())
    cleanReport()
    fraDato = new Array()
    tilDato = new Array()
    i = 0

    while i < antallrader
      x = document.getElementById("fra" + i)
      x.value = ""
      x = document.getElementById("til" + i)
      x.value = ""
      x = document.getElementById("dager" + i)
      x.value = ""
      i++
    i = 0

    while i < antallrader * 2
      x = document.getElementById("TxtPassport" + i)
      x.value = ""
      i++
  return
cleanMain = ->
  cleanReport()
  fraDato = new Array()
  tilDato = new Array()
  i = 0

  while i < antallrader
    x = document.getElementById("fra" + i)
    x.value = ""
    x = document.getElementById("til" + i)
    x.value = ""
    x = document.getElementById("dager" + i)
    x.value = ""
    i++
  return
isValidDate = (sjekkdato) ->
  if sjekkdato is "" or isNaN(sjekkdato)
    false
  else
    true
isValidChar = (c) ->
  isValidChar = true
  switch c
    when "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "/"
    else
      isValidChar = false
      alert "The only valid caracters are numbers and /"
  isValidChar
DateToString = (dato) ->
  txt = undefined
  dd = dato.getDate()
  mm = dato.getMonth() + 1
  yyyy = dato.getFullYear()
  dd = "0" + dd  if parseInt(dd) < 10
  mm = "0" + mm  if parseInt(mm) < 10
  txt = "" + dd + "/" + mm + "/" + yyyy % 100
  txt
StringToDate = (str) ->
  dd = str.substring(0, 2)
  mm = str.substring(3, 5)
  yyyy = "20" + str.substring(6, 10)
  tt = "06"
  d = new Date(yyyy, mm - 1, dd, tt)
  d
DagerSiden = (dato, dager) ->
  timestamp = undefined
  timestamp = dato.getTime() - (1000 * 60 * 60 * 24 * dager)
  newDate = new Date(timestamp)
  newDate
daysBetween = (fra, til) ->
  dager = undefined
  return -1  if not fra? or not til?
  if til.getTime() + (1000 * 60 * 60 * 2) < fra.getTime()
    dager = -1
  else
    dager = (til.getTime() + (1000 * 60 * 60 * 2) - fra.getTime()) / (1000 * 60 * 60 * 24)
    dager++
  Math.floor dager

setup = ->
  fra = new Array()
  til = new Array()
  tabid = 1
  i = 0

  while i < antallrader
    fra[i] = document.createElement("input")
    fra[i].setAttribute "type", "text"
    fra[i].setAttribute "name", "text" + i
    fra[i].setAttribute "tabindex", tabid
    fra[i].setAttribute "id", "fra" + i
    fra[i].style.width = 60
    fra[i].style.margin = 2
    fra[i].onchange = ->
      str = @value
      i = 0
      isValidChar = true
      while i < str.length
        switch str.charAt(i)
          when "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "/"
          else
            isValidChar = false
            alert "The only valid characters are numbers and /"
            str = ""
        i++
      if isValidChar
        str = str.substr(0, 2) + "/" + str.substr(2, 6)  if str.charAt(2) isnt "/" and str.length > 2
        str = str.substr(0, 5) + "/" + str.substr(5, 6)  if str.charAt(5) isnt "/" and str.length > 5
      if str.length is 8
        unless str is DateToString(StringToDate(str))
          alert "The date " + str + " is not a valid date."
          str = ""
        if daysBetween(StringToDate("22/04/13"), StringToDate(str)) < 0
          alert messageStartDate
          str = ""
      else
        alert "The date " + str + " must be on the following format ddmmyy or dd/mm/yy"
      @value = str
      return

    foo = document.getElementById("stays")
    foo.appendChild fra[i]
    tabid++
    til[i] = document.createElement("input")
    til[i].setAttribute "type", "text"
    til[i].setAttribute "name", "text" + i
    til[i].setAttribute "tabindex", tabid
    til[i].setAttribute "id", "til" + i
    til[i].style.width = 60
    til[i].style.margin = 2
    til[i].onchange = ->
      str = @value
      i = 0
      isValidChar = true
      while i < str.length
        switch str.charAt(i)
          when "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "/"
          else
            isValidChar = false
            alert "The only valid caracters are numbers and /"
            str = ""
        i++
      if isValidChar
        str = str.substr(0, 2) + "/" + str.substr(2, 6)  if str.charAt(2) isnt "/" and str.length > 2
        str = str.substr(0, 5) + "/" + str.substr(5, 6)  if str.charAt(5) isnt "/" and str.length > 5
      if str.length is 8
        unless str is DateToString(StringToDate(str))
          alert "The date " + str + " is not a valid date."
          str = ""
        if daysBetween(StringToDate("22/04/13"), StringToDate(str)) < 0
          alert messageStartDate
          str = ""
      else
        alert "The date " + str + " must be on the following format ddmmyy or dd/mm/yy"
      @value = str
      return

    foo = document.getElementById("stays")
    foo.appendChild til[i]
    tabid++
    dager[i] = document.createElement("input")
    dager[i].setAttribute "type", "text"
    dager[i].setAttribute "name", "dager" + i
    dager[i].disabled = true
    dager[i].setAttribute "id", "dager" + i
    dager[i].style.width = 30
    dager[i].style.margin = 2
    foo = document.getElementById("stays")
    foo.appendChild dager[i]
    br = document.createElement("br")
    foo = document.getElementById("stays")
    foo.appendChild br
    document.getElementById("TxtField").value = DateToString(new Date())
    i++
  i = 0

  while i < antallrader * 2
    TxtPassport[i] = document.createElement("input")
    TxtPassport[i].setAttribute "type", "text"
    TxtPassport[i].setAttribute "name", "TxtPassport" + i
    TxtPassport[i].setAttribute "tabindex", tabid
    TxtPassport[i].setAttribute "id", "TxtPassport" + i
    TxtPassport[i].style.width = 70
    TxtPassport[i].style.margin = 2
    TxtPassport[i].onchange = ->
      str = @value
      i = 1
      firstchar = undefined
      if str.charAt(0) isnt "+" and str.charAt(0) isnt "-" and str.length > 0
        alert "the first caracter must be + or -"
        str = ""
      else
        while i < str.length
          switch str.charAt(i)
            when "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "/"
            else
              isValidChar = false
              alert "The only valid caracters are numbers and /"
              str = ""
          i++
        if isValidChar
          str = str.substr(0, 3) + "/" + str.substr(3, 7)  if str.charAt(3) isnt "/" and str.length > 3
          str = str.substr(0, 6) + "/" + str.substr(6, 8)  if str.charAt(6) isnt "/" and str.length > 6
      @value = str
      return

    foo = document.getElementById("passportstays")
    foo.appendChild TxtPassport[i]
    br = document.createElement("br")
    foo = document.getElementById("passportstays")
    foo.appendChild br
    tabid++
    i++
  document.getElementById("passportstays").style.visibility = "hidden"
  return
fncCalculate = ->
  cleanReport()
  x = document.getElementById("report")
  window.a = ""
  unless modeCronology
    cleanMain()
    InsertDates()
    sjekkdatoer()
    sortPassport()
    ordneDatoer()
    fncPassport()
  sjekkdatoer()
  cleanReport()  if sortCron()
  sjekkdatoer()
  if feedback()
    if leggInndager()
      if document.getElementById("altVisa").checked
        BeregnVisa()
      else
        BeregnControl()
  $("#cmdPassport").attr "checked", false
  return
fncPassport = ->
  if modeCronology
    document.getElementById("spanInfoStaysEntryInput").style.visibility = "hidden"
    document.getElementById("spanInfoStaysExitInput").style.visibility = "hidden"
    document.getElementById("spanInfoStaysDays").style.visibility = "hidden"
    document.getElementById("stays").style.visibility = "hidden"
    document.getElementById("spanInfoPassportInput").style.visibility = "visible"
    document.getElementById("passportstays").style.visibility = "visible"
    modeCronology = false
  else
    document.getElementById("spanInfoStaysEntryInput").style.visibility = "visible"
    document.getElementById("spanInfoStaysExitInput").style.visibility = "visible"
    document.getElementById("spanInfoStaysDays").style.visibility = "visible"
    document.getElementById("stays").style.visibility = "visible"
    document.getElementById("spanInfoPassportInput").style.visibility = "hidden"
    document.getElementById("passportstays").style.visibility = "hidden"
    modeCronology = true
  return

InsertDates = ->
  i = 0
  str = undefined
  inn = 0
  ut = 0
  while i < antallrader * 2 #
    x = document.getElementById("TxtPassport" + i)
    str = x.value
    x.value.charAt 2
    if x.value.charAt(0) is "+"
      fraDato[inn] = StringToDate(x.value)
      z = document.getElementById("fra" + inn)
      z.value = x.value.substr(1, 10)
      inn++
    if x.value.charAt(0) is "-"
      tilDato[ut] = StringToDate(x.value)
      z = document.getElementById("til" + ut)
      z.value = x.value.substr(1, 10)
      ut++
    i++
  return
sjekkdatoer = ->
  x = undefined #=document.getElementById("fra"+2);
  i = 0
  validRows = 0
  Dateberegningsdato = StringToDate(document.getElementById("TxtField").value)
  DateControl = StringToDate(document.getElementById("TxtField").value)
  while i < antallrader
    x = document.getElementById("fra" + i)
    y = document.getElementById("til" + i)
    z = document.getElementById("dager" + i)
    fraDato[i] = StringToDate(document.getElementById("fra" + i).value)  unless x.value is ""
    tilDato[i] = StringToDate(y.value)  unless y.value is ""
    if x.value isnt "" and y.value isnt ""
      z.value = daysBetween(fraDato[i], tilDato[i])
      validRows++
    i++
  return

sortPassport = ->
  isSorted = false
  x = undefined
  y = undefined
  i = 1
  tmpDate = undefined
  until isSorted
    isSorted = true
    i = 1
    while i < antallrader and not isNaN(fraDato[i])
      if daysBetween(fraDato[i - 1], fraDato[i]) < 0
        tmpDate = fraDato[i - 1]
        fraDato[i - 1] = fraDato[i]
        fraDato[i] = tmpDate
        isSorted = false
      i++
  isSorted = false
  until isSorted
    isSorted = true
    i = 1
    while i < antallrader & not isNaN(tilDato[i])
      if daysBetween(tilDato[i - 1], tilDato[i]) < 0
        tmpDate = tilDato[i - 1]
        tilDato[i - 1] = tilDato[i]
        tilDato[i] = tmpDate
        isSorted = false
      i++
  i = 0
  return

ordneDatoer = ->
  i = 0
  while i < Math.max(fraDato.length, tilDato.length)
    if i + 1 < fraDato.length and i < tilDato.length and tilDato[i] isnt "" and fraDato[i + 1] isnt ""
      tilDato.splice i, 0, ""  if daysBetween(tilDato[i], fraDato[i + 1]) < 0
    if i < fraDato.length and i < tilDato.length and fraDato[i] isnt "" and tilDato[i] isnt ""
      fraDato.splice i, 0, ""  if daysBetween(fraDato[i], tilDato[i]) < 0
    i++
  i = 0
  while i < fraDato.length
    x = document.getElementById("fra" + i)
    if fraDato[i] is ""
      x.value = ""
    else
      x.value = DateToString(fraDato[i])
    i++
  i = 0
  while i < tilDato.length
    x = document.getElementById("til" + i)
    if tilDato[i] is ""
      x.value = ""
    else
      x.value = DateToString(tilDato[i])
    i++
  return

sortCron = ->
  isSorted = false
  x = undefined
  y = undefined
  i = 1
  tmpDate = undefined
  skalSorteres = false
  while i < fraDato.length and not skalSorteres
    if daysBetween(fraDato[i - 1], fraDato[i]) > 1 or (daysBetween(fraDato[i - 1], fraDato[i]) is 1 and daysBetween(tilDato[i - 1], tilDato[i]) > 0) or isNaN(fraDato[i])
      i++
    else
      skalSorteres = confirm("The stays are not in chronological order. Press OK to sort the stays and Cancel to edit the stays.")
  while not isSorted and skalSorteres
    isSorted = true
    i = 1
    while i < fraDato.length
      if daysBetween(fraDato[i - 1], fraDato[i]) > 1 or (daysBetween(fraDato[i - 1], fraDato[i]) is 1 and daysBetween(tilDato[i - 1], tilDato[i]) > 0) or isNaN(fraDato[i])
        false
      else
        tmpDate = fraDato[i - 1]
        fraDato[i - 1] = fraDato[i]
        fraDato[i] = tmpDate
        tmpDate = tilDato[i - 1]
        tilDato[i - 1] = tilDato[i]
        tilDato[i] = tmpDate
        isSorted = false
      i++
  i = 0
  while i < fraDato.length and skalSorteres
    x = document.getElementById("fra" + i)
    y = document.getElementById("til" + i)
    z = document.getElementById("dager" + i)
    if isNaN(fraDato[i]) is true
      x.value = ""
    else
      x.value = DateToString(fraDato[i])
    if isNaN(tilDato[i]) is true
      y.value = ""
    else
      y.value = DateToString(tilDato[i])
    z.value = ""
    i++
  skalSorteres



leggInndager = ->
  i = 0
  totalt = 0
  diffDager = undefined
  lovligOppholdRad = true
  lovligOpphold = true
  row = 0
  rows = daysBetween(fraDato[0], DateControl) + 180
  x = document.getElementById("fra" + 0)
  d = StringToDate(x.value)
  while i < rows
    if daysBetween(fraDato[row], d) > 0 and daysBetween(d, tilDato[row]) > 0
      hist[i] = 1
    else if daysBetween(DateControl, d) >= 1
      hist[i] = 1
    else
      hist[i] = 0
    row++  if daysBetween(d, tilDato[row]) <= 1
    d = DagerSiden(d, -1)
    i++
  i = 0
  while i < rows
    if i is 0
      histdager[i] = 1
    else if i < 180
      histdager[i] = histdager[i - 1] + hist[i]
    else
      histdager[i] = histdager[i - 1] + hist[i] - hist[i - 180]
    i++
  i = 0
  row = 0
  while row < validRows
    i = daysBetween(fraDato[0], fraDato[row]) - 1
    while i <= (daysBetween(fraDato[0], tilDato[row]) - 1) and lovligOppholdRad
      if histdager[i] > 90
        lovligOppholdRad = false
        append "Days of stay in the 180-days period " + DateToString(DagerSiden(tilDato[row], 179)) + " to " + DateToString(tilDato[row]) + ": " + histdager[(daysBetween(fraDato[0], tilDato[row]) - 1)] + " day(s)", "red"
        append "Overstay in the period from " + DateToString(DagerSiden(fraDato[0], -i)) + " to " + DateToString(tilDato[row]) + " (" + daysBetween(DagerSiden(fraDato[0], -i), tilDato[row]) + " days)", "red"
        lovligOpphold = false
      i++
    row++
    lovligOppholdRad = true
  return lovligOpphold
  true
feedback = ->
  returverdi = true
  i = 0
  x = undefined
  y = undefined
  z = undefined
  while isValidDate(fraDato[i]) or isValidDate(tilDato[i])
    if daysBetween(StringToDate("22/04/13"), fraDato[i]) < 0
      alert messageStartDate
      returverdi = (returverdi and false)
    if daysBetween(StringToDate("22/04/13"), tilDato[i]) < 0
      alert messageStartDate
      returverdi = (returverdi and false)
    x = document.getElementById("fra" + i)
    y = document.getElementById("til" + i)
    unless isValidDate(fraDato[i])
      append "The stay with exit date " + y.value + " has no entering date"
      returverdi = (returverdi and false)
    unless isValidDate(tilDato[i])
      append "The stay with entering date " + x.value + " has no exit date"
      returverdi = (returverdi and false)
    if isValidDate(fraDato[i]) and isValidDate(tilDato[i])
      if daysBetween(fraDato[i], tilDato[i]) < 0
        append "The stay with entering date " + x.value + " is later than the exit date " + y.value
        returverdi = (returverdi and false)
    if isValidDate(tilDato[i])
      if daysBetween(tilDato[i], DateControl) < 0
        append "The exit date " + y.value + " is later than the Entry/Control date " + document.getElementById("TxtField").value
        returverdi = (returverdi and false)
    if i > 0
      if isValidDate(fraDato[i + 1]) and isValidDate(tilDato[i])
        if daysBetween(tilDato[i], fraDato[i + 1]) < 0
          z = document.getElementById("fra" + (i + 1))
          append "The stay with entering date " + z.value + " is before exit date in the previous stay " + y.value
          returverdi = (returverdi and false)
    i++
  #end while
  append "Calculation of stay is not possible" + "\n"  if returverdi is false
  returverdi
BeregnVisa = ->
  visumkangisdager = 0
  Dateberegningsdato = StringToDate(document.getElementById("TxtField").value)
  tekst = undefined
  x = document.getElementById("til" + (validRows - 1))
  y = document.getElementById("TxtField")
  append "Start of 90 days period: " + DateToString(DagerSiden(Dateberegningsdato, 89))
  append "Start of 180 days period: " + DateToString(DagerSiden(Dateberegningsdato, 179))
  visumkangisdager = Beregn2(Dateberegningsdato)
  if visumkangisdager is 0
    append "The stay may be authorized for up to: " + visumkangisdager + " day(s)"
  else append "The stay may be authorized for up to: " + visumkangisdager + " day(s) ", "green"  if visumkangisdager > 0
  if visumkangisdager is 0
    Dateberegningsdato = DagerSiden(Dateberegningsdato, -1)  if x.value is y.value
    Dateberegningsdato = Beregn3(Dateberegningsdato)
    visumkangisdager = Beregn2(Dateberegningsdato)
    append "At " + DateToString(Dateberegningsdato) + " a stay may be autorized for " + visumkangisdager + " days", "BLACK"
  return
BeregnControl = ->
  Dateberegningsdato = undefined
  visumkangisdager = 0
  Dateberegningsdato = StringToDate(document.getElementById("TxtField").value)
  append "No overstay in the registration period."
  visumkangisdager = Beregn2(Dateberegningsdato)
  if visumkangisdager is 0
    if DateToString(tilDato[validRows - 1]) is DateToString(DateControl)
      append "At " + DateToString(Dateberegningsdato) + " a stay may be autorized for " + visumkangisdager + " days", "BLACK"
    else
      append "A stay may not be autorized.", "RED"
  else if visumkangisdager > 0
    unless validRows is 0
      visumkangisdager++ if DateToString(tilDato[validRows - 1]) is DateToString(DateControl)
    append "Possible stay until " + DateToString(DagerSiden(DateControl, -visumkangisdager + 1)), "GREEN"
    append "For holder of a short stay visa, remember to check the number of days on the visa sticker or in the VIS", "green"
  if visumkangisdager is 0
    Dateberegningsdato = DagerSiden(Dateberegningsdato, -1)  if DateToString(tilDato[validRows - 1]) is DateToString(DateControl)
    Dateberegningsdato = Beregn3(Dateberegningsdato)
    visumkangisdager = Beregn2(Dateberegningsdato)
    append "At " + DateToString(Dateberegningsdato) + " a stay may be autorized for " + visumkangisdager + " days", "BLACK"
  return
Beregn2 = (dato) ->
  d = undefined
  i = undefined
  totalt = 0
  visumKanGisDager = 0
  if validRows is 0
    visumKanGisDager = 90
  else
    i = daysBetween(fraDato[0], dato) - 1
    while histdager[i] <= 90 and i < rows
      visumKanGisDager++
      i++
    i = daysBetween(fraDato[0], dato) - 1
    visumKanGisDager = visumKanGisDager - 1  if DateToString(tilDato[validRows - 1]) is DateToString(dato)
  visumKanGisDager
Beregn3 = (d) ->
  i = daysBetween(fraDato[0], d) - 1
  hist[i] = 1
  if i < 180
    histdager[i] = histdager[i - 1] + hist[i]
  else
    histdager[i] = histdager[i - 1] + hist[i] - hist[i - 180]
  while histdager[i] > 90
    hist[i] = 0
    if i < 180
      histdager[i] = histdager[i - 1] + hist[i]
      #variant ikke mulig
    else
      histdager[i] = histdager[i - 1] + hist[i] - hist[i - 180]
    i++
    d = DagerSiden(d, -1)
    hist[i] = 1
    if i < 180
      histdager[i] = histdager[i - 1] + hist[i]
    else
      histdager[i] = histdager[i - 1] + hist[i] - hist[i - 180]
  while i < rows - 1
    i++
    hist[i] = 1
    if i < 180
      histdager[i] = histdager[i - 1] + hist[i]
    else
      histdager[i] = histdager[i - 1] + hist[i] - hist[i - 180]
  d
example = (val) ->
  cleanForm()
  switch val
    when "Ex. KOM 1.1"
      document.getElementById("fra0").value = "27/10/11"
      document.getElementById("til0").value = "06/11/11"
      document.getElementById("fra1").value = "28/12/11"
      document.getElementById("til1").value = "09/01/12"
      document.getElementById("fra2").value = "06/03/12"
      document.getElementById("til2").value = "15/03/12"
      document.getElementById("TxtField").value = "15/03/12"
    when "Ex. KOM 1.2"
      document.getElementById("fra0").value = "27/10/11"
      document.getElementById("til0").value = "06/11/11"
      document.getElementById("fra1").value = "28/12/11"
      document.getElementById("til1").value = "09/01/12"
      document.getElementById("fra2").value = "06/03/12"
      document.getElementById("til2").value = "10/05/12"
      document.getElementById("TxtField").value = "10/05/12"
    when "Ex. KOM 1.3"
      document.getElementById("fra0").value = "27/10/11"
      document.getElementById("til0").value = "06/11/11"
      document.getElementById("fra1").value = "28/12/11"
      document.getElementById("til1").value = "09/01/12"
      document.getElementById("fra2").value = "06/03/12"
      document.getElementById("til2").value = "21/05/12"
      document.getElementById("TxtField").value = "21/05/12"
    when "Ex. KOM 1.4"
      document.getElementById("fra0").value = "27/10/11"
      document.getElementById("til0").value = "06/11/11"
      document.getElementById("fra1").value = "28/12/11"
      document.getElementById("til1").value = "09/01/12"
      document.getElementById("fra2").value = "06/03/12"
      document.getElementById("til2").value = "21/05/12"
      document.getElementById("TxtField").value = "01/08/12"
    when "Ex. KOM 1.4 unsorted"
      document.getElementById("TxtPassport0").value = "-21/05/12"
      document.getElementById("TxtPassport1").value = "+28/12/11"
      document.getElementById("TxtPassport2").value = "+27/10/11"
      document.getElementById("TxtPassport3").value = "+06/03/12"
      document.getElementById("TxtPassport4").value = "-09/01/12"
      document.getElementById("TxtPassport5").value = "-06/11/11"
      document.getElementById("TxtField").value = "01/08/12"
      fncPassport()  if modeCronology
    when "Ex. KOM 2.1"
      document.getElementById("fra0").value = "14/08/11"
      document.getElementById("til0").value = "30/08/11"
      document.getElementById("fra1").value = "15/12/11"
      document.getElementById("til1").value = "01/02/12"
      document.getElementById("TxtField").value = "01/02/12"
    when "Ex. KOM 2.2"
      document.getElementById("fra0").value = "14/08/11"
      document.getElementById("til0").value = "30/08/11"
      document.getElementById("fra1").value = "15/12/11"
      document.getElementById("til1").value = "25/02/12"
      document.getElementById("TxtField").value = "26/02/12"
    when "Ex. KOM 2.3"
      document.getElementById("fra0").value = "14/08/11"
      document.getElementById("til0").value = "30/08/11"
      document.getElementById("fra1").value = "15/12/11"
      document.getElementById("til1").value = "13/03/12"
      document.getElementById("TxtField").value = "14/03/12"
    when "Ex. KOM 2.4"
      document.getElementById("fra0").value = "14/08/11"
      document.getElementById("til0").value = "30/08/11"
      document.getElementById("fra1").value = "15/12/11"
      document.getElementById("til1").value = "22/06/12"
      document.getElementById("TxtField").value = "22/06/12"
    when "Ex. KOM 3"
      document.getElementById("fra0").value = "01/01/12"
      document.getElementById("til0").value = "15/01/12"
      document.getElementById("fra1").value = "15/02/12"
      document.getElementById("til1").value = "30/04/12"
      document.getElementById("TxtField").value = "30/06/12"
    when "Ex. KOM 4"
      document.getElementById("fra0").value = "14/08/11"
      document.getElementById("til0").value = "30/08/11"
      document.getElementById("fra1").value = "15/12/11"
      document.getElementById("til1").value = "14/03/12"
      document.getElementById("TxtField").value = "10/06/12"
    when "Ex. KOM 5"
      document.getElementById("fra0").value = "01/01/12"
      document.getElementById("til0").value = "15/01/12"
      document.getElementById("fra1").value = "15/02/12"
      document.getElementById("til1").value = "30/04/12"
      document.getElementById("TxtField").value = "12/08/12"
    when "Overstay 1"
      document.getElementById("fra0").value = "14/08/11"
      document.getElementById("til0").value = "30/08/11"
      document.getElementById("fra1").value = "15/10/11"
      document.getElementById("til1").value = "10/06/12"
      document.getElementById("TxtField").value = "10/06/12"
    when "Overstay 2"
      document.getElementById("fra0").value = "13/06/11"
      document.getElementById("til0").value = "13/08/11"
      document.getElementById("fra1").value = "13/10/11"
      document.getElementById("til1").value = "14/11/11"
      document.getElementById("TxtField").value = "10/06/12"
    when "Overstay 3"
      document.getElementById("fra0").value = "20/09/11"
      document.getElementById("til0").value = "20/12/11"
      document.getElementById("fra1").value = "19/03/12"
      document.getElementById("til1").value = "16/06/12"
      document.getElementById("TxtField").value = "17/06/12"
    when "Unsorted"
      document.getElementById("TxtPassport0").value = "-10/05/12"
      document.getElementById("TxtPassport1").value = "+28/12/11"
      document.getElementById("TxtPassport2").value = "+27/10/11"
      document.getElementById("TxtPassport3").value = "+06/03/12"
      document.getElementById("TxtPassport4").value = "-09/01/12"
      document.getElementById("TxtPassport5").value = "-06/11/11"
      document.getElementById("TxtField").value = "10/05/12"
      fncPassport()  if modeCronology
    when "Unsorted 2"
      document.getElementById("TxtPassport0").value = "-10/05/12"
      document.getElementById("TxtPassport1").value = "+28/12/11"
      document.getElementById("TxtPassport2").value = "+27/10/11"
      document.getElementById("TxtPassport3").value = "+05/01/12"
      document.getElementById("TxtPassport4").value = "+06/03/12"
      document.getElementById("TxtPassport5").value = "-09/01/12"
      document.getElementById("TxtPassport6").value = "-06/11/11"
      document.getElementById("TxtField").value = "10/05/12"
      fncPassport()  if modeCronology
    when "Inconsistance 1"
      document.getElementById("fra0").value = "20/09/11"
      document.getElementById("til0").value = "20/12/11"
      document.getElementById("fra1").value = "16/06/12"
      document.getElementById("til1").value = "19/03/12"
      document.getElementById("TxtField").value = "17/06/12"
    when "Inconsistance 2"
      document.getElementById("fra0").value = "20/09/11"
      document.getElementById("til0").value = "20/12/11"
      document.getElementById("til1").value = "16/06/12"
      document.getElementById("fra2").value = "20/06/12"
      document.getElementById("fra3").value = "28/07/12"
      document.getElementById("til3").value = "22/07/12"
      document.getElementById("fra4").value = "01/08/12"
      document.getElementById("til4").value = "22/08/12"
      document.getElementById("fra5").value = "14/08/12"
      document.getElementById("til5").value = "27/08/12"
      document.getElementById("TxtField").value = "17/06/12"
    when "Test"
      document.getElementById("fra0").value = "14/08/13"
      document.getElementById("til0").value = "14/08/13"
      document.getElementById("fra1").value = "14/08/13"
      document.getElementById("til1").value = "14/08/13"
      document.getElementById("fra2").value = "10/09/13"
      document.getElementById("til2").value = "20/09/13"
      document.getElementById("fra4").value = "01/09/13"
      document.getElementById("til4").value = "01/09/13"
      document.getElementById("TxtField").value = "10/10/13"
    else
      document.getElementById("fra0").value = "ukjent"
  false


window.a = ""
Dateberegningsdato = undefined
DateControl = undefined
antallrader = 200
rows = undefined
fraDato = new Array()
tilDato = new Array()
TxtPassport = new Array()
dager = new Array()
hist = new Array()
histdager = new Array()
modeCronology = true
messageStartDate = "The date of entry into force of the \"new\" definition of \"short stay\" is 18 October 2013 and therefore the calculator cannot be used for entries/stays earlier than 22 April 2013 (= 18.10.13 minus six months).  The calculator does not support calculation of entries/stays earlier than 22 April 2013. The \"old\" definition applies for such entries/stays (\"3 months in 6 months from the date of first entry)."