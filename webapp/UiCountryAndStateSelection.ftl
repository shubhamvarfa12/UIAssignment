<script>
var stateObject = {
"India": { "Delhi": ["new Delhi", "North Delhi"],
"Kerala": ["Thiruvananthapuram", "Palakkad"],
"Goa": ["North Goa", "South Goa"],
},
"Australia": {
"South Australia": ["Dunstan", "Mitchell"],
"Victoria": ["Altona", "Euroa"]
}, "Canada": {
"British Columbia": ["Nanaimo", "Victoria"],
"Newfoundland": ["Paradise", "Corner Brook"]
},
}
window.onload = function () {
var countySel = document.getElementById("countySel"),
stateSel = document.getElementById("stateSel"),
CitySel = document.getElementById("CitySel");
for (var country in stateObject) {
countySel.options[countySel.options.length] = new Option(country, country);
}
countySel.onchange = function () {
stateSel.length = 1; // remove all options bar first
CitySel.length = 1; // remove all options bar first
if (this.selectedIndex < 1) return; // done
for (var state in stateObject[this.value]) {
stateSel.options[stateSel.options.length] = new Option(state, state);
}
}
countySel.onchange(); // reset in case page is reloaded
stateSel.onchange = function () {
CitySel.length = 1; // remove all options bar first
if (this.selectedIndex < 1) return; // done
var city = stateObject[countySel.value][this.value];
for (var i = 0; i < city.length; i++) {
CitySel.options[CitySel.options.length] = new Option(city[i], city[i]);
}
}
}
</script>

<form action="<@ofbizUrl>uiCountryAndStateSelectionByJava</@ofbizUrl>" method="post">
  <br>
  <tr>
          <td class="label">&nbsp;&nbsp;&nbsp;&nbsp;${uiLabelMap.PartyPartyId}</td>
          <td>
              <input type="text" name="partyId"/>
              <br>
          </td>
      </tr><br>

      <tr>
          <td class="label">&nbsp;&nbsp;&nbsp;&nbsp;${uiLabelMap.PartyFirstName}</td>
          <td>
              <input type="text" name="firstName"/>
              <br>
          </td>
      </tr><br>

      <tr>
          <td class="label">&nbsp;&nbsp;&nbsp;&nbsp;${uiLabelMap.PartyLastName}</td>
          <td>
              <input type="text" name="lastName"/>
              <br>
          </td>
      </tr><br>

      <tr>
    <#--    <td class="label">&nbsp;&nbsp;&nbsp;&nbsp;${uiLabelMap.CommonCity}</td>
          <td>
              <input type="text" name="city"/>
              <br>
          </td>
      </tr><br> -->
      <tr>
          <td class="label">&nbsp;&nbsp;&nbsp;&nbsp;${uiLabelMap.CommonAddress1}</td>
          <td>
              <input type="text" name="address1"/>
              <br>
          </td>
      </tr><br>
 <tr>
        <td class="label">&nbsp;&nbsp;&nbsp;&nbsp;${uiLabelMap.PartyPostalCode}</td>
        <td>
            <input type="text" name="postalCode"/>
            <br>
        </td>
    </tr>
    <br>
   Select Country: <select name="country" id="countySel" size="1">
   <option value="" selected="selected">${uiLabelMap.Country}</option>
   </select>
  <br>
  <br>
  Select State : <select name="state" id="stateSel" size="1">
  <option value="" selected="selected">${uiLabelMap.State}</option>
  </select>
  <br>
  <br>
  Select City : <select name="city" id="CitySel" size="1">
  <option value="" selected="selected">${uiLabelMap.PartyCity}</option>
  </select><br>
  <br>

<input type="submit" value="${uiLabelMap.CommonSubmit}" />
</form>
