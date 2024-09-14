/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package i.ogeyingbo.enterprise.trxn.entities;

import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import java.math.BigDecimal;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 *
 * @author BOLAJI-OGEYINGBO
 */
@Getter @Setter @NoArgsConstructor  
@Entity
@Table(name="billing_charges_config")
public class  BillingChargesConfig extends AbstractEntity { 
    
    @JsonProperty("billingCode")
    @Column(name = "billing_code", nullable = false, unique = true)
    private  String   billingCode;
    
    @JsonProperty("partnerCode")
    @Column(name = "partner_code", nullable = false)
    private  String  partnerCode;
    
 
    @JsonProperty("isActive")
    @Column(name = "is_active", nullable = false)
    private  boolean   isActive;
    
    @JsonProperty("serviceId")
    @Column(name = "service_id", nullable = false)
    private  long  serviceId =  -1L;
	 
    @JsonProperty("serviceName")
    @Column(name = "service_name", nullable = false)
    private  String  serviceName;
    
    @JsonProperty("schemeCode")
    @Column(name = "scheme_code", nullable = false)
    private  String  schemeCode;
    
    @JsonProperty("appTrxnType")
    @Column(name = "applicable_trxn_type", nullable = false)
    private  String  appTrxnType;
    
    @JsonProperty("trxnBand")
    @Column(name = "trxn_band", nullable = false)
    private  String  trxnBand;
    
    @JsonProperty("lowerLimitValue")
    @Column(name = "lower_limit_value", nullable = false)
    private  BigDecimal  lowerLimitValue  =  new  BigDecimal(0.00);
    
    
    @JsonProperty("upperLimitValue")
    @Column(name = "upper_limit_value", nullable = false)
    private  BigDecimal  upperLimitValue  =  new  BigDecimal(0.00);
    
    
    @JsonProperty("usePercentage")
    @Column(name = "use_percentage", nullable = false)
    private  boolean  usePercentage  =  false;
    
    
    @JsonProperty("percentageOrFixedValue")
    @Column(name = "percentage_or_fixedvalue", nullable = false)
    private  BigDecimal  percentageOrFixedValue  =  new  BigDecimal(0.00);
    
    @JsonProperty("trxnChargeCap")
    @Column(name = "trxn_charge_cap", nullable = false)
    private  BigDecimal  trxnChargeCap  =  new  BigDecimal(0.00);
    
	 
    @JsonProperty("dateConfigured")
    @Column(name = "date_configured", nullable = false)
    private  String  dateConfigured;
    
    
    @JsonProperty("usePercentageForTax")
    @Column(name = "use_percentage_for_tax", nullable = false)
    private  boolean  usePercentageForTax  =  false;
    
    
    @JsonProperty("taxPercentageOrFixedValue")
    @Column(name = "tax_percentage_or_fixedvalue", nullable = false)
    private  BigDecimal  taxPercentageOrFixedValue  =  new  BigDecimal(0.00);
    
    @JsonProperty("taxChargeCap")
    @Column(name = "tax_charge_cap", nullable = false)
    private  BigDecimal  taxChargeCap  =  new  BigDecimal(0.00);
    
	 
    @JsonProperty("usePercentageForPartnerCommission")
    @Column(name = "use_percentage_for_partner_commission", nullable = false)
    private  boolean  usePercentageForPartnerCommission  =  false;
    
    
    @JsonProperty("partnerCommissionPercentageOrFixedValue")
    @Column(name = "partner_commission_percentage_or_fixedvalue", nullable = false)
    private  BigDecimal   partnerCommissionPercentageOrFixedValue  =  new  BigDecimal(0.00);
    
    @JsonProperty("partnerCommissionShareCap")
    @Column(name = "partner_commission_share_cap", nullable = false)
    private  BigDecimal  partnerCommissionShareCap  =  new  BigDecimal(0.00);
    
     
    @JsonProperty("useSaveInvestPercentage")
    @Column(name = "use_save_invest_percentage", nullable = false)
    private  boolean  useSaveInvestPercentage  =  false;
    
    
    @JsonProperty("saveInvestPercentageOrFixedValue")
    @Column(name = "save_invest_percentage_or_fixedvalue", nullable = false)
    private  BigDecimal   saveInvestPercentageOrFixedValue  =  new  BigDecimal(0.00);
    
    @JsonProperty("minimumSaveInvest")
    @Column(name = "minimum_save_invest", nullable = false)
    private  BigDecimal  minimumSaveInvest  =  new  BigDecimal(0.00);
    
    @JsonProperty("saveInvestCap")
    @Column(name = "save_invest_cap", nullable = false)
    private  BigDecimal  saveInvestCap  =  new  BigDecimal(0.00);
    
	 
    @JsonProperty("bonusShare")
    @Column(name = "bonus_share", nullable = false)
    private  BigDecimal  bonusShare  =  new  BigDecimal(0.00);
    
    
    @JsonProperty("bonusAccelerate")
    @Column(name = "bonus_accelerate", nullable = false)
    private  boolean  bonusAccelerate  =  true;
    
	 
    

    
}
