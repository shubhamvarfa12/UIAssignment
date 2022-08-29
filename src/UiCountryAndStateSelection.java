package com.hotwax.ofbizdemo.service;
import java.util.*;
import org.apache.ofbiz.base.util.Debug;
import org.apache.ofbiz.entity.Delegator;
import org.apache.ofbiz.entity.GenericEntityException;
import org.apache.ofbiz.entity.GenericValue;
import org.apache.ofbiz.service.DispatchContext;
import org.apache.ofbiz.service.ServiceUtil;
import org.apache.ofbiz.base.util.UtilValidate;
import org.apache.ofbiz.entity.util.EntityQuery;
import org.apache.ofbiz.service.LocalDispatcher;
import org.apache.ofbiz.service.GenericServiceException;

public class UiCountryAndStateSelection {
    public static final String module = UiCountryAndStateSelection.class.getName();
    public static Map<String, Object> createUiCountryAndState(DispatchContext dctx, Map<String, ? extends Object> context) {
        Map<String, Object> result = ServiceUtil.returnSuccess();
        Delegator delegator = dctx.getDelegator();
        LocalDispatcher dispatcher = dctx.getDispatcher();

            String partyId = (String) context.get("partyId");
            String lastName = (String) context.get("lastName");
            String firstName = (String) context.get("firstName");
            String country = (String) context.get("country");
            String state = (String) context.get("state");
            String city = (String) context.get("city");
            String address1 = (String) context.get("address1");
            String postalCode = (String) context.get("postalCode");
           GenericValue userLogin = (GenericValue) context.get("userLogin");
            try {
                Map<String, Object> map = new HashMap<>();
                map.put("firstName", firstName);
                map.put("lastName", lastName);
                map.put("partyId", partyId);
                map.put("userLogin", userLogin);
                Map<String, Object> result1 = dispatcher.runSync("createPerson", map);

                Map<String, Object> map2 = new HashMap<>();
                map2.put("partyId", partyId);
                map2.put("userLogin", userLogin);
                Map<String, Object> result11 = dispatcher.runSync("getPartyPostalAddress", map2);
                String contactMechId = (String) result11.get("contactMechId");

                String country1 = "";
                String state1 = "";
                if (country.equals("Canada")){
                    country1 = "CAN";}
                else if (country.equals("India")){
                country1 = "IND";}
               else if (country.equals("Australia")){
                country1 = "AUS";}
                else {
                    country1 = country;
                }
                if (state.equals("British Columbia"))
                    state1 = "BC";
                if (state.equals("Newfoundland"))
                    state1 = "NL";
                if (state.equals("South Australia"))
                    state1 = "AU-SA";
                if (state.equals("Victoria"))
                    state1 = "AU-VIC";
                if (state.equals("Delhi"))
                    state1 = "IN-DL";
                if (state.equals("Kerala"))
                    state1 = "IN-KL";
                if (state.equals("Goa"))
                    state1 = "IN-GA";
                Map<String, Object> map1 = new HashMap<>();
                map1.put("userLogin", userLogin);
                map1.put("city", city);
                map1.put("partyId", partyId);
                map1.put("countryGeoId", country1);
                map1.put("address1", address1);
                map1.put("stateProvinceGeoId", state1);
                map1.put("postalCode", postalCode);
                map1.put("contactMechId", contactMechId);
                map1.put("contactMechPurposeTypeId", "GENERAL_LOCATION");
                Map<String, Object> result2 = dispatcher.runSync("createPartyPostalAddress", map1);
                return result1;
            } catch (Exception e) {
            Debug.logError(e, module);
            return ServiceUtil.returnError("Error in creating record in OfbizDemo entity ........" +module);
        }
    }
}