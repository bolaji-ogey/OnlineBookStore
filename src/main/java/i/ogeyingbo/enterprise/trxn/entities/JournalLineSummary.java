/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package i.ogeyingbo.enterprise.trxn.entities;

/**
 *
 * @author BOLAJI-OGEYINGBO
 */
import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import java.math.BigDecimal;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;



@Getter @Setter @NoArgsConstructor  
@Entity
@Table(name="journal_line_summary")
public class  JournalLineSummary extends AbstractEntity {
    
    @JsonProperty("journalId")
    @Column(name = "journal_id", nullable = false, unique = true)
    private long  journalId;
    
    @JsonProperty("journalAction")
    @Column(name = "journal_action", nullable = false)
    private String  journalAction;
    
    @JsonProperty("profileId")
    @Column(name = "debit_profile_id", nullable = false)
    private String  debitProfileId;
    
    
    @JsonProperty("debitProfileTypeCode")
    @Column(name = "debit_profile_type_code", nullable = false)
    private String  debitProfileTypeCode;
    
    @JsonProperty("debitSchemeCode")
    @Column(name = "debit_scheme_code", nullable = false)
    private String  debitSchemeCode;
    
    @JsonProperty("debitWalletAccntId")
    @Column(name = "debit_wallet_accnt_id", nullable = false)
    private long  debitWalletAccntId = -1L;
    
    
    @JsonProperty("debitWalletAccntValue")
    @Column(name = "debit_wallet_accnt_value", nullable = false)
    private BigDecimal  debitWalletAccntValue  =  new  BigDecimal(0.00);
    
    @JsonProperty("creditPartnerCode")
    @Column(name = "credit_partner_code", nullable = false)
    private String  creditPartnerCode;
    
    @JsonProperty("creditSchemeCode")
    @Column(name = "credit_scheme_code", nullable = false)
    private String  creditSchemeCode;
    
    @JsonProperty("creditProfileId")
    @Column(name = "credit_profile_id", nullable = false, unique = true)
    private  long  creditProfileId =  -1L;
    
    @JsonProperty("creditProfileTypeCode")
    @Column(name = "credit_profile_type_code", nullable = false)
    private String  creditProfileTypeCode;
    
    
    @JsonProperty("creditWalletAccntId")
    @Column(name = "credit_wallet_accnt_id", nullable = false)
    private long   creditWalletAccntId = -1L;
    
    
    @JsonProperty("creditWalletAccntValue")
    @Column(name = "credit_wallet_accnt_value", nullable = false)
    private BigDecimal   creditWalletAccntValue  =  new  BigDecimal(0.00);
    
    
    @JsonProperty("operationalWalletAccntId")
    @Column(name = "operational_wallet_accnt_id", nullable = false)
    private long   operationalWalletAccntId = -1L;
    
    
    @JsonProperty("operationalWalletAccntValue")
    @Column(name = "operational_wallet_accnt_value", nullable = false)
    private BigDecimal   operationalWalletAccntValue  =  new  BigDecimal(0.00);
    
    
    @JsonProperty("operationalWalletAccntCreditDebit")
    @Column(name = "operational_wallet_accnt_credit_debit", nullable = false)
    private String   operationalWalletAccntCreditDebit;
    
    
    
    @JsonProperty("hostFeeWalletId")
    @Column(name = "host_fee_wallet_id", nullable = false)
    private long   hostFeeWalletId = -1L;
    
    
    @JsonProperty("operationalWalletValue")
    @Column(name = "host_fee_wallet_value", nullable = false)
    private BigDecimal   hostFeeWalletValue  =  new  BigDecimal(0.00);
    
    
    @JsonProperty("hostFeeWalletCreditDebit")
    @Column(name = "host_fee_wallet_credit_debit", nullable = false)
    private String   hostFeeWalletCreditDebit;
    
    
    
    @JsonProperty("billerWalletId")
    @Column(name = "biller_wallet_id", nullable = false)
    private long   billerWalletId = -1L;
    
    
    @JsonProperty("billerPayableRecievable")
    @Column(name = "biller_payable_recievable", nullable = false)
    private String   billerPayableRecievable;
    
    
    @JsonProperty("billerWalletValue")
    @Column(name = "biller_wallet_value", nullable = false)
    private BigDecimal   billerWalletValue  =  new  BigDecimal(0.00);
    
    
    @JsonProperty("billerWalletCreditDebit")
    @Column(name = "biller_wallet_credit_debit", nullable = false)
    private String   billerWalletCreditDebit;
    
    
    
    
    @JsonProperty("billerCommissionWalletId")
    @Column(name = "biller_commission_wallet_id", nullable = false)
    private long   billerCommissionWalletId = -1L;
    
    
    @JsonProperty("billerCommissionPayableRecievable")
    @Column(name = "biller_commission_payable_recievable", nullable = false)
    private String   billerCommissionPayableRecievable;
    
    
    @JsonProperty("billerCommissionWalletValue")
    @Column(name = "biller_commission_wallet_value", nullable = false)
    private BigDecimal   billerCommissionWalletValue  =  new  BigDecimal(0.00);
    
    
    @JsonProperty("billerCommissionWalletCreditDebit")
    @Column(name = "biller_commission_wallet_credit_debit", nullable = false)
    private String   billerCommissionWalletCreditDebit;
    
    
    
    @JsonProperty("taxWalletId")
    @Column(name = "tax_wallet_id", nullable = false)
    private long   taxWalletId = -1L;
    
    
    @JsonProperty("taxTypeId")
    @Column(name = "tax_type_id", nullable = false)
    private  int   taxTypeId =  -1;
    
    
     @JsonProperty("taxType")
    @Column(name = "tax_type", nullable = false)
    private String   taxType;
    
    
    @JsonProperty("taxWalletValue")
    @Column(name = "tax_wallet_value", nullable = false)
    private BigDecimal   taxWalletValue  =  new  BigDecimal(0.00);
    
    
    @JsonProperty("taxWalletCreditDebit")
    @Column(name = "tax_wallet_credit_debit", nullable = false)
    private String   taxWalletCreditDebit;
    
    
    
    
     @JsonProperty("partnerCommission1WalletId")
    @Column(name = "partner_commission_1_wallet_id", nullable = false)
    private long   partnerCommission1WalletId = -1L;
    
    
    @JsonProperty("partnerCommission1PayableRecievable")
    @Column(name = "partner_commission_1_payable_recievable", nullable = false)
    private String   partnerCommission1PayableRecievable;
    
    
    @JsonProperty("partnerCommission1WalletValue")
    @Column(name = "partner_commission_1_wallet_value", nullable = false)
    private BigDecimal   partnerCommission1WalletValue  =  new  BigDecimal(0.00);
    
    
    @JsonProperty("partnerCommission1WalletCreditDebit")
    @Column(name = "partner_commission_1_wallet_credit_debit", nullable = false)
    private String   partnerCommission1WalletCreditDebit;
    
    
    
     @JsonProperty("partnerCommission2WalletId")
    @Column(name = "partner_commission_2_wallet_id", nullable = false)
    private long   partnerCommission2WalletId = -1L;
    
    
    @JsonProperty("partnerCommission2PayableRecievable")
    @Column(name = "partner_commission_2_payable_recievable", nullable = false)
    private String   partnerCommission2PayableRecievable;
    
    
    @JsonProperty("partnerCommission2WalletValue")
    @Column(name = "partner_commission_2_wallet_value", nullable = false)
    private BigDecimal   partnerCommission2WalletValue  =  new  BigDecimal(0.00);
    
    
    @JsonProperty("partnerCommission2WalletCreditDebit")
    @Column(name = "partner_commission_2_wallet_credit_debit", nullable = false)
    private String   partnerCommission2WalletCreditDebit;
    
    
    
    
     @JsonProperty("trxnDate")
    @Column(name = "trxn_date", nullable = false)
    private  String  trxnDate;
    
    
    @JsonProperty("trxnTime")
    @Column(name = "trxn_time", nullable = false)
    private  String  trxnTime;
    
      
    
    
    
    @JsonProperty("trxnReference")
    @Column(name = "trxn_reference", nullable = false)
    private String  trxnReference;
    
    @JsonProperty("externalTrxnReference")
    @Column(name = "external_trxn_reference", nullable = false)
    private String  externalTrxnReference;
    
     
    
    @JsonProperty("trxnType")
    @Column(name = "trxn_type", nullable = false)
    private String  trxnType;
    
    
    @JsonProperty("trxnChannel")
    @Column(name = "trxn_channel", nullable = false)
    private String  trxnChannel;
    
}