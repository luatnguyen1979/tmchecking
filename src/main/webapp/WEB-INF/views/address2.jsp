<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>

<div id="result" style="display:none" >     
            <p id="success" > 
    
            </p> 
            <p id="errors" > 
    
            </p>
</div>
<div id="formInput" class="modal" style="display: none">
	<div class="modal-dialog">
		<!-- Modal content -->
		<div class="modal-content">
		  <br/>
			<h3 align="center">Adding Address</h3>
			<br/>
			<form:form id="addressForm" name="address" method="POST">
				<div class="container">

					<div class="row">
						<div class="col-3 text-right">Full Name:</div>
						<div class="col-9 text-left">
							<form:input id="fullName" path="fullName" type="text" size="46"
								class="form:input-large" />
							<form:errors path="fullName" cssClass="text-danger"/>
						</div>

					</div>
					<div class="row">

						<div class="col-3 text-right">Address Line 1:</div>
						<div class="col-9 text-left">
							<form:input id="addressLine1" path="addressLine1" type="text" size="46"
								class="form:input-large" />
							<form:errors path="addressLine1" cssClass="text-danger"/>
						</div>
					</div>
					<div class="row">
						<div class="col-3 text-right">Address Line 2:</div>
						<div class="col-9 text-left">
							<form:input id="addressLine2" path="addressLine2" type="text" size="46"
								class="form:input-large" />
							<form:errors path="addressLine2" cssClass="text-danger"/>
						</div>
					</div>
					<div class="row">
						<div class="col-3 text-right">City:</div>
						<div class="col-9 text-left">
							<form:input id="city" path="city" type="text" size="46"
								class="form:input-large" />
							<form:errors path="city" cssClass="text-danger"/>
						</div>
					</div>
					<div class="row">
						<div class="col-3 text-right">State:</div>
						<div class="col-9 text-left">
							<form:select id="state" path="state"
								style="width: 380px !important; min-width: 300px; max-width: 380px;">
								<form:option value="" selected>Select a State</form:option>
								<form:option value="AL">Alabama</form:option>
								<form:option value="AK">Alaska</form:option>
								<form:option value="AZ">Arizona</form:option>
								<form:option value="AR">Arkansas</form:option>
								<form:option value="CA">California</form:option>
								<form:option value="CO">Colorado</form:option>
								<form:option value="CT">Connecticut</form:option>
								<form:option value="DE">Delaware</form:option>
								<form:option value="DC">District Of Columbia</form:option>
								<form:option value="FL">Florida</form:option>
								<form:option value="GA">Georgia</form:option>
								<form:option value="HI">Hawaii</form:option>
								<form:option value="ID">Idaho</form:option>
								<form:option value="IL">Illinois</form:option>
								<form:option value="IN">Indiana</form:option>
								<form:option value="IA">Iowa</form:option>
								<form:option value="KS">Kansas</form:option>
								<form:option value="KY">Kentucky</form:option>
								<form:option value="LA">Louisiana</form:option>
								<form:option value="ME">Maine</form:option>
								<form:option value="MD">Maryland</form:option>
								<form:option value="MA">Massachusetts</form:option>
								<form:option value="MI">Michigan</form:option>
								<form:option value="MN">Minnesota</form:option>
								<form:option value="MS">Mississippi</form:option>
								<form:option value="MO">Missouri</form:option>
								<form:option value="MT">Montana</form:option>
								<form:option value="NE">Nebraska</form:option>
								<form:option value="NV">Nevada</form:option>
								<form:option value="NH">New Hampshire</form:option>
								<form:option value="NJ">New Jersey</form:option>
								<form:option value="NM">New Mexico</form:option>
								<form:option value="NY">New York</form:option>
								<form:option value="NC">North Carolina</form:option>
								<form:option value="ND">North Dakota</form:option>
								<form:option value="OH">Ohio</form:option>
								<form:option value="OK">Oklahoma</form:option>
								<form:option value="OR">Oregon</form:option>
								<form:option value="PA">Pennsylvania</form:option>
								<form:option value="RI">Rhode Island</form:option>
								<form:option value="SC">South Carolina</form:option>
								<form:option value="SD">South Dakota</form:option>
								<form:option value="TN">Tennessee</form:option>
								<form:option value="TX">Texas</form:option>
								<form:option value="UT">Utah</form:option>
								<form:option value="VT">Vermont</form:option>
								<form:option value="VA">Virginia</form:option>
								<form:option value="WA">Washington</form:option>
								<form:option value="WV">West Virginia</form:option>
								<form:option value="WI">Wisconsin</form:option>
								<form:option value="WY">Wyoming</form:option>

								<form:option value="AS">American Samoa</form:option>
								<form:option value="GU">Guam</form:option>
								<form:option value="MP">Northern Mariana Islands</form:option>
								<form:option value="PR">Puerto Rico</form:option>
								<form:option value="UM">United States Minor Outlying Islands</form:option>
								<form:option value="VI">Virgin Islands</form:option>
							</form:select>
							<form:errors path="state" cssClass="text-danger"/>
						</div>
					</div>
					<div class="row">
						<div class="col-3 text-right">Zip Code:</div>
						<div class="col-9 text-left">
							<form:input id="zipCode" path="zipCode" type="text" size="46"
								class="form:input-large" />
							<form:errors path="zipCode" cssClass="text-danger"/>
						</div>
					</div>
					<div class="row">
						<div class="col-3 text-right">Country:</div>
						<div class="col-9 text-left">
							<form:select id="country" path="country"
								style="width: 380px !important; min-width: 300px; max-width: 380px;">
								<form:option value="AF">Afghanistan</form:option>
								<form:option value="AX">Åland Islands</form:option>								<form:option value="AL">Albania</form:option>								<form:option value="DZ">Algeria</form:option>
								<form:option value="AS">American Samoa</form:option>
								<form:option value="AD">Andorra</form:option>
								<form:option value="AO">Angola</form:option>
								<form:option value="AI">Anguilla</form:option>
								<form:option value="AQ">Antarctica</form:option>
								<form:option value="AG">Antigua and Barbuda</form:option>
								<form:option value="AR">Argentina</form:option>
								<form:option value="AM">Armenia</form:option>
								<form:option value="AW">Aruba</form:option>
								<form:option value="AU">Australia</form:option>
								<form:option value="AT">Austria</form:option>
								<form:option value="AZ">Azerbaijan</form:option>
								<form:option value="BS">Bahamas</form:option>
								<form:option value="BH">Bahrain</form:option>
								<form:option value="BD">Bangladesh</form:option>
								<form:option value="BB">Barbados</form:option>
								<form:option value="BY">Belarus</form:option>
								<form:option value="BE">Belgium</form:option>
								<form:option value="BZ">Belize</form:option>
								<form:option value="BJ">Benin</form:option>
								<form:option value="BM">Bermuda</form:option>
								<form:option value="BT">Bhutan</form:option>
								<form:option value="BO">Bolivia, Plurinational State of</form:option>
								<form:option value="BQ">Bonaire, Sint Eustatius and Saba</form:option>
								<form:option value="BA">Bosnia and Herzegovina</form:option>
								<form:option value="BW">Botswana</form:option>
								<form:option value="BV">Bouvet Island</form:option>
								<form:option value="BR">Brazil</form:option>
								<form:option value="IO">British Indian Ocean Territory</form:option>
								<form:option value="BN">Brunei Darussalam</form:option>
								<form:option value="BG">Bulgaria</form:option>
								<form:option value="BF">Burkina Faso</form:option>
								<form:option value="BI">Burundi</form:option>
								<form:option value="KH">Cambodia</form:option>
								<form:option value="CM">Cameroon</form:option>
								<form:option value="CA">Canada</form:option>
								<form:option value="CV">Cape Verde</form:option>
								<form:option value="KY">Cayman Islands</form:option>
								<form:option value="CF">Central African Republic</form:option>
								<form:option value="TD">Chad</form:option>
								<form:option value="CL">Chile</form:option>
								<form:option value="CN">China</form:option>
								<form:option value="CX">Christmas Island</form:option>
								<form:option value="CC">Cocos (Keeling) Islands</form:option>
								<form:option value="CO">Colombia</form:option>
								<form:option value="KM">Comoros</form:option>
								<form:option value="CG">Congo</form:option>
								<form:option value="CD">Congo, the Democratic Republic of the</form:option>
								<form:option value="CK">Cook Islands</form:option>
								<form:option value="CR">Costa Rica</form:option>
								<form:option value="CI">Côte d'Ivoire</form:option>
								<form:option value="HR">Croatia</form:option>
								<form:option value="CU">Cuba</form:option>
								<form:option value="CW">Curaçao</form:option>
								<form:option value="CY">Cyprus</form:option>
								<form:option value="CZ">Czech Republic</form:option>
								<form:option value="DK">Denmark</form:option>
								<form:option value="DJ">Djibouti</form:option>
								<form:option value="DM">Dominica</form:option>
								<form:option value="DO">Dominican Republic</form:option>
								<form:option value="EC">Ecuador</form:option>
								<form:option value="EG">Egypt</form:option>
								<form:option value="SV">El Salvador</form:option>
								<form:option value="GQ">Equatorial Guinea</form:option>
								<form:option value="ER">Eritrea</form:option>
								<form:option value="EE">Estonia</form:option>
								<form:option value="ET">Ethiopia</form:option>
								<form:option value="FK">Falkland Islands (Malvinas)</form:option>
								<form:option value="FO">Faroe Islands</form:option>
								<form:option value="FJ">Fiji</form:option>
								<form:option value="FI">Finland</form:option>
								<form:option value="FR">France</form:option>
								<form:option value="GF">French Guiana</form:option>
								<form:option value="PF">French Polynesia</form:option>
								<form:option value="TF">French Southern Territories</form:option>
								<form:option value="GA">Gabon</form:option>
								<form:option value="GM">Gambia</form:option>
								<form:option value="GE">Georgia</form:option>
								<form:option value="DE">Germany</form:option>
								<form:option value="GH">Ghana</form:option>
								<form:option value="GI">Gibraltar</form:option>
								<form:option value="GR">Greece</form:option>
								<form:option value="GL">Greenland</form:option>
								<form:option value="GD">Grenada</form:option>
								<form:option value="GP">Guadeloupe</form:option>
								<form:option value="GU">Guam</form:option>
								<form:option value="GT">Guatemala</form:option>
								<form:option value="GG">Guernsey</form:option>
								<form:option value="GN">Guinea</form:option>
								<form:option value="GW">Guinea-Bissau</form:option>
								<form:option value="GY">Guyana</form:option>
								<form:option value="HT">Haiti</form:option>
								<form:option value="HM">Heard Island and McDonald Islands</form:option>
								<form:option value="VA">Holy See (Vatican City State)</form:option>
								<form:option value="HN">Honduras</form:option>
								<form:option value="HK">Hong Kong</form:option>
								<form:option value="HU">Hungary</form:option>
								<form:option value="IS">Iceland</form:option>
								<form:option value="IN">India</form:option>
								<form:option value="ID">Indonesia</form:option>
								<form:option value="IR">Iran, Islamic Republic of</form:option>
								<form:option value="IQ">Iraq</form:option>
								<form:option value="IE">Ireland</form:option>
								<form:option value="IM">Isle of Man</form:option>
								<form:option value="IL">Israel</form:option>
								<form:option value="IT">Italy</form:option>
								<form:option value="JM">Jamaica</form:option>
								<form:option value="JP">Japan</form:option>
								<form:option value="JE">Jersey</form:option>
								<form:option value="JO">Jordan</form:option>
								<form:option value="KZ">Kazakhstan</form:option>
								<form:option value="KE">Kenya</form:option>
								<form:option value="KI">Kiribati</form:option>
								<form:option value="KP">Korea, Democratic People's Republic of</form:option>
								<form:option value="KR">Korea, Republic of</form:option>
								<form:option value="KW">Kuwait</form:option>
								<form:option value="KG">Kyrgyzstan</form:option>
								<form:option value="LA">Lao People's Democratic Republic</form:option>
								<form:option value="LV">Latvia</form:option>
								<form:option value="LB">Lebanon</form:option>
								<form:option value="LS">Lesotho</form:option>
								<form:option value="LR">Liberia</form:option>
								<form:option value="LY">Libya</form:option>
								<form:option value="LI">Liechtenstein</form:option>
								<form:option value="LT">Lithuania</form:option>
								<form:option value="LU">Luxembourg</form:option>
								<form:option value="MO">Macao</form:option>
								<form:option value="MK">Macedonia, the former Yugoslav Republic of</form:option>
								<form:option value="MG">Madagascar</form:option>
								<form:option value="MW">Malawi</form:option>
								<form:option value="MY">Malaysia</form:option>
								<form:option value="MV">Maldives</form:option>
								<form:option value="ML">Mali</form:option>
								<form:option value="MT">Malta</form:option>
								<form:option value="MH">Marshall Islands</form:option>
								<form:option value="MQ">Martinique</form:option>
								<form:option value="MR">Mauritania</form:option>
								<form:option value="MU">Mauritius</form:option>
								<form:option value="YT">Mayotte</form:option>
								<form:option value="MX">Mexico</form:option>
								<form:option value="FM">Micronesia, Federated States of</form:option>
								<form:option value="MD">Moldova, Republic of</form:option>
								<form:option value="MC">Monaco</form:option>
								<form:option value="MN">Mongolia</form:option>
								<form:option value="ME">Montenegro</form:option>
								<form:option value="MS">Montserrat</form:option>
								<form:option value="MA">Morocco</form:option>
								<form:option value="MZ">Mozambique</form:option>
								<form:option value="MM">Myanmar</form:option>
								<form:option value="NA">Namibia</form:option>
								<form:option value="NR">Nauru</form:option>
								<form:option value="NP">Nepal</form:option>
								<form:option value="NL">Netherlands</form:option>
								<form:option value="NC">New Caledonia</form:option>
								<form:option value="NZ">New Zealand</form:option>
								<form:option value="NI">Nicaragua</form:option>
								<form:option value="NE">Niger</form:option>
								<form:option value="NG">Nigeria</form:option>
								<form:option value="NU">Niue</form:option>
								<form:option value="NF">Norfolk Island</form:option>
								<form:option value="MP">Northern Mariana Islands</form:option>
								<form:option value="NO">Norway</form:option>
								<form:option value="OM">Oman</form:option>
								<form:option value="PK">Pakistan</form:option>
								<form:option value="PW">Palau</form:option>
								<form:option value="PS">Palestinian Territory, Occupied</form:option>
								<form:option value="PA">Panama</form:option>
								<form:option value="PG">Papua New Guinea</form:option>
								<form:option value="PY">Paraguay</form:option>
								<form:option value="PE">Peru</form:option>
								<form:option value="PH">Philippines</form:option>
								<form:option value="PN">Pitcairn</form:option>
								<form:option value="PL">Poland</form:option>
								<form:option value="PT">Portugal</form:option>
								<form:option value="PR">Puerto Rico</form:option>
								<form:option value="QA">Qatar</form:option>
								<form:option value="RE">Réunion</form:option>
								<form:option value="RO">Romania</form:option>
								<form:option value="RU">Russian Federation</form:option>
								<form:option value="RW">Rwanda</form:option>
								<form:option value="BL">Saint Barthélemy</form:option>
								<form:option value="SH">Saint Helena, Ascension and Tristan da Cunha</form:option>
								<form:option value="KN">Saint Kitts and Nevis</form:option>
								<form:option value="LC">Saint Lucia</form:option>
								<form:option value="MF">Saint Martin (French part)</form:option>
								<form:option value="PM">Saint Pierre and Miquelon</form:option>
								<form:option value="VC">Saint Vincent and the Grenadines</form:option>
								<form:option value="WS">Samoa</form:option>
								<form:option value="SM">San Marino</form:option>
								<form:option value="ST">Sao Tome and Principe</form:option>
								<form:option value="SA">Saudi Arabia</form:option>
								<form:option value="SN">Senegal</form:option>
								<form:option value="RS">Serbia</form:option>
								<form:option value="SC">Seychelles</form:option>
								<form:option value="SL">Sierra Leone</form:option>
								<form:option value="SG">Singapore</form:option>
								<form:option value="SX">Sint Maarten (Dutch part)</form:option>
								<form:option value="SK">Slovakia</form:option>
								<form:option value="SI">Slovenia</form:option>
								<form:option value="SB">Solomon Islands</form:option>
								<form:option value="SO">Somalia</form:option>
								<form:option value="ZA">South Africa</form:option>
								<form:option value="GS">South Georgia and the South Sandwich Islands</form:option>
								<form:option value="SS">South Sudan</form:option>
								<form:option value="ES">Spain</form:option>
								<form:option value="LK">Sri Lanka</form:option>
								<form:option value="SD">Sudan</form:option>
								<form:option value="SR">Suriname</form:option>
								<form:option value="SJ">Svalbard and Jan Mayen</form:option>
								<form:option value="SZ">Swaziland</form:option>
								<form:option value="SE">Sweden</form:option>
								<form:option value="CH">Switzerland</form:option>
								<form:option value="SY">Syrian Arab Republic</form:option>
								<form:option value="TW">Taiwan, Province of China</form:option>
								<form:option value="TJ">Tajikistan</form:option>
								<form:option value="TZ">Tanzania, United Republic of</form:option>
								<form:option value="TH">Thailand</form:option>
								<form:option value="TL">Timor-Leste</form:option>
								<form:option value="TG">Togo</form:option>
								<form:option value="TK">Tokelau</form:option>
								<form:option value="TO">Tonga</form:option>
								<form:option value="TT">Trinidad and Tobago</form:option>
								<form:option value="TN">Tunisia</form:option>
								<form:option value="TR">Turkey</form:option>
								<form:option value="TM">Turkmenistan</form:option>
								<form:option value="TC">Turks and Caicos Islands</form:option>
								<form:option value="TV">Tuvalu</form:option>
								<form:option value="UG">Uganda</form:option>
								<form:option value="UA">Ukraine</form:option>
								<form:option value="AE">United Arab Emirates</form:option>
								<form:option value="GB">United Kingdom</form:option>
								<form:option value="US" selected>United States</form:option>
								<form:option value="UM">United States Minor Outlying Islands</form:option>
								<form:option value="UY">Uruguay</form:option>
								<form:option value="UZ">Uzbekistan</form:option>
								<form:option value="VU">Vanuatu</form:option>
								<form:option value="VE">Venezuela, Bolivarian Republic of</form:option>
								<form:option value="VN">Viet Nam</form:option>
								<form:option value="VG">Virgin Islands, British</form:option>
								<form:option value="VI">Virgin Islands, U.S.</form:option>
								<form:option value="WF">Wallis and Futuna</form:option>
								<form:option value="EH">Western Sahara</form:option>
								<form:option value="YE">Yemen</form:option>
								<form:option value="ZM">Zambia</form:option>
								<form:option value="ZW">Zimbabwe</form:option>
							</form:select>
							<form:errors path="country" cssClass="text-danger"/>
						</div>
					</div>
					<div class="row">
						<div class="col-3 text-right">Phone Number:</div>
						<div class="col-9 text-left">
							<form:input id="phoneNumber" path="phoneNumber" type="text" size="46"
								class="form:input-large" />
							<form:errors path="phoneNumber" cssClass="text-danger"/>
						</div>
					</div>
					<div class="row">
						<div class="col-12">&nbsp;</div>
					</div>
					<div class="row">
						<div class="col-2"></div>

						<div class="col-8 text-center">
							<input type="reset" class="btn btn-primary" value="Reset">&nbsp;
							<input type="button" class="btn btn-primary" value="Save"
								onclick="addAddress();return false;">&nbsp;
							<input
								type="button" class="btn btn-primary" value="Cancel"
								onclick="make_hidden('formInput');return false;">
						</div>
						<div class="col-2"></div>
					</div>
					<div class="row">
                        <div class="col-12">&nbsp;</div>
                    </div>
				</div>
			</form:form>
		</div>
	</div>
</div>