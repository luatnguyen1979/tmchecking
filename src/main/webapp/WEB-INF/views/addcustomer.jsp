<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>

<div id="global">
                            
	<div id="formCustomer">
            <br/>
            <h3 align="center"><spring:message code="addingcustomer.label"/></h3>
            <br/>
            
            <form id="customerForm" action="addCust" name="newLogin" modelAttribute="newLogin" method="post">
                <div class="container">
                    
                   <!--  <div class="modal" id="result" style="display:none" >
                    <div class="modal-dialog">
                    <div class="modal-content">
                        <p id="success" >
                        </p> 
                        <p id="errors" >
                        </p>
                    </div>
                    </div>
                    </div> -->
                    <div class="row">
                        <div class="col-3 text-right"><spring:message code="addingcustomer.userName"/>:</div>
                        <div class="col-9 text-left">
                            <input id="userId" name="userId" name="userId" type="text" size="46"
                                class="form:input-large" />
                          
                        </div>

                    </div>
                     <div class="row">
                        <div class="col-3 text-right"><spring:message code="addingcustomer.password"/>:</div>
                        <div class="col-9 text-left">
                            <input id="password" name="password" name="password" type="password" size="46"
                                class="form:input-large" />
                          
                        </div>

                    </div>
                    <div class="row">
                        <div class="col-3 text-right"><spring:message code="addingcustomer.firstName"/>:</div>
                        <div class="col-9 text-left">
                            <input id="firstName" name="customer.firstName" type="text" size="46"
                                class="form:input-large" />
                            <errors name="customer.firstName" cssClass="text-danger"/>
                        </div>

                    </div>
                    
                    <div class="row">
                        <div class="col-3 text-right"><spring:message code="addingcustomer.lastName"/>:</div>
                        <div class="col-9 text-left">
                            <input id="lastName" name="customer.lastName" type="text" size="46"
                                class="form:input-large" />
                            <errors name="customer.lastName" cssClass="text-danger"/>
                        </div>

                    </div>
                    <div class="row">

                        <div class="col-3 text-right"><spring:message code="addressLine1"/>:</div>
                        <div class="col-9 text-left">
                            <input id="addressLine1" name="customer.address.addressLine1" type="text" size="46"
                                class="form:input-large" />
                            <errors name="customer.address.addressLine1" cssClass="text-danger"/>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-3 text-right"><spring:message code="addressLine2"/>:</div>
                        <div class="col-9 text-left">
                            <input id="addressLine2" name="customer.address.addressLine2" type="text" size="46"
                                class="form:input-large" />
                            <errors name="customer.address.addressLine2" cssClass="text-danger"/>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-3 text-right"><spring:message code="city"/>:</div>
                        <div class="col-9 text-left">
                            <input id="city" name="customer.address.city" type="text" size="46"
                                class="form:input-large" />
                            <errors name="customer.address.city" cssClass="text-danger"/>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-3 text-right"><spring:message code="state"/>:</div>
                        <div class="col-9 text-left">
                            <select id="state" name="customer.address.state"
                                style="width: 380px !important; min-width: 300px; max-width: 380px;">
                                <option value="" selected="true"><spring:message code="stateSelect"/></option>
                                <option value="AL">Alabama</option>
                                <option value="AK">Alaska</option>
                                <option value="AZ">Arizona</option>
                                <option value="AR">Arkansas</option>
                                <option value="CA">California</option>
                                <option value="CO">Colorado</option>
                                <option value="CT">Connecticut</option>
                                <option value="DE">Delaware</option>
                                <option value="DC">District Of Columbia</option>
                                <option value="FL">Florida</option>
                                <option value="GA">Georgia</option>
                                <option value="HI">Hawaii</option>
                                <option value="ID">Idaho</option>
                                <option value="IL">Illinois</option>
                                <option value="IN">Indiana</option>
                                <option value="IA">Iowa</option>
                                <option value="KS">Kansas</option>
                                <option value="KY">Kentucky</option>
                                <option value="LA">Louisiana</option>
                                <option value="ME">Maine</option>
                                <option value="MD">Maryland</option>
                                <option value="MA">Massachusetts</option>
                                <option value="MI">Michigan</option>
                                <option value="MN">Minnesota</option>
                                <option value="MS">Mississippi</option>
                                <option value="MO">Missouri</option>
                                <option value="MT">Montana</option>
                                <option value="NE">Nebraska</option>
                                <option value="NV">Nevada</option>
                                <option value="NH">New Hampshire</option>
                                <option value="NJ">New Jersey</option>
                                <option value="NM">New Mexico</option>
                                <option value="NY">New York</option>
                                <option value="NC">North Carolina</option>
                                <option value="ND">North Dakota</option>
                                <option value="OH">Ohio</option>
                                <option value="OK">Oklahoma</option>
                                <option value="OR">Oregon</option>
                                <option value="PA">Pennsylvania</option>
                                <option value="RI">Rhode Island</option>
                                <option value="SC">South Carolina</option>
                                <option value="SD">South Dakota</option>
                                <option value="TN">Tennessee</option>
                                <option value="TX">Texas</option>
                                <option value="UT">Utah</option>
                                <option value="VT">Vermont</option>
                                <option value="VA">Virginia</option>
                                <option value="WA">Washington</option>
                                <option value="WV">West Virginia</option>
                                <option value="WI">Wisconsin</option>
                                <option value="WY">Wyoming</option>

                                <option value="AS">American Samoa</option>
                                <option value="GU">Guam</option>
                                <option value="MP">Northern Mariana Islands</option>
                                <option value="PR">Puerto Rico</option>
                                <option value="UM">United States Minor Outlying Islands</option>
                                <option value="VI">Virgin Islands</option>
                            </select>
                            <errors name="customer.address.state" cssClass="text-danger"/>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-3 text-right"><spring:message code="zip"/>:</div>
                        <div class="col-9 text-left">
                            <input id="zipCode" name="customer.address.zipCode" type="text" size="46"
                                class="form:input-large" />
                            <errors name="customer.address.zipCode" cssClass="text-danger"/>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-3 text-right"><spring:message code="country"/>:</div>
                        <div class="col-9 text-left">
                            <select id="country" name="customer.address.country"
                                style="width: 380px !important; min-width: 300px; max-width: 380px;">
                                <option value="US" selected="true">United States</option>
                            </select>
                            <errors name="customer.address.country" cssClass="text-danger"/>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-3 text-right"><spring:message code="phone"/>:</div>
                        <div class="col-9 text-left">
                            <input id="phoneNumber" name="customer.cellPhone" type="text" size="46"
                                class="form:input-large" />
                            <errors name="customer.cellPhone" cssClass="text-danger"/>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-3 text-right"><spring:message code="email"/>:</div>
                        <div class="col-9 text-left">
                            <input id="email" name="customer.email" type="text" size="46"
                                class="form:input-large" />
                                
                                <input id="email" name="role" type="hidden" size="46"
                                class="form:input-large" />
                            <errors name="customer.email" cssClass="text-danger"/>
                        </div>
                    </div> 
                    <div class="row">
                        <div class="col-12">&nbsp;</div>
                    </div>
                    <div class="row">
                        <div class="col-2"></div>

                        <div class="col-8 text-center">
                            <input id="resetCustomer" type="reset" class="btn btn-primary" value="Reset">&nbsp;
                            <input type="submit" class="btn btn-primary" value="Save">
                                
                            <input
                                type="button" class="btn btn-primary" value="Cancel"
                                onclick="">
                        </div>
                        <div class="col-2"></div>
                    </div>
                    <div class="row">
                        <div class="col-12">&nbsp;</div>
                    </div>
                </div>
            </form>
        </div>

</div>

