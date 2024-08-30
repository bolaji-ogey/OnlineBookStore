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
@Table(name="journal")
public class  Journal extends AbstractEntity {
    
    @JsonProperty("trxnRequestId")
    @Column(name = "trxn_request_id", nullable = false)
    private String  trxnRequestId;
    
    @JsonProperty("trxnReference")
    @Column(name = "trxn_reference", nullable = false)
    private String  trxnReference;
    
    @JsonProperty("externalTrxnReference")
    @Column(name = "external_trxn_reference", nullable = false)
    private String  externalTrxnReference;
    
    
    @JsonProperty("journalAction")
    @Column(name = "journal_action", nullable = false)
    private String  journalAction;
    
    @JsonProperty("sourceCustReference")
    @Column(name = "source_customer_reference", nullable = false)
    private String  sourceCustReference;
    
    
    @JsonProperty("debitPartnerCode")
    @Column(name = "debit_partner_code", nullable = false)
    private String  debitPartnerCode;
    
    
    @JsonProperty("debitSchemeCode")
    @Column(name = "debit_scheme_code", nullable = false)
    private String  debitSchemeCode;
    
    
    @JsonProperty("debitCustUserId")
    @Column(name = "debit_cust_user_id", nullable = false)
    private  long  debitCustUserId = -1;
    
    
    @JsonProperty("debitProfileId")
    @Column(name = "debit_profile_id", nullable = false)
    private  long  debitProfileId = -1;
    
    @JsonProperty("debitProfileTypeCode")
    @Column(name = "debit_profile_type_code", nullable = false)
    private String  debitProfileTypeCode;
    
    
    @JsonProperty("debitBankCode")
    @Column(name = "debit_bank_code", nullable = false)
    private String  debitBankCode;
    
    
    @JsonProperty("debitWalletAccntNo")
    @Column(name = "debit_wallet_accnt_no", nullable = false)
    private  long  debitWalletAccntNo = -1;
    
    
    @JsonProperty("debitWalletAccntNoEncry")
    @Column(name = "debit_wallet_accnt_no_encry", nullable = false)
    private  String  debitWalletAccntNoEncry;
    
     
    @JsonProperty("trxnAmount")
    @Column(name = "trxn_amount", nullable = false)
    private BigDecimal  trxnAmount =  new BigDecimal(0.00);
    
    
    
    @JsonProperty("creditPartnerCode")
    @Column(name = "credit_partner_code", nullable = false)
    private String  creditPartnerCode;
    
    
    @JsonProperty("creditSchemeCode")
    @Column(name = "credit_scheme_code", nullable = false)
    private String  creditSchemeCode;
    
    
    @JsonProperty("creditCustUserId")
    @Column(name = "credit_cust_user_id", nullable = false)
    private  long  creditCustUserId = -1;
    
    
    @JsonProperty("creditProfileId")
    @Column(name = "credit_profile_id", nullable = false)
    private  long  creditProfileId = -1;
    
    @JsonProperty("creditProfileTypeCode")
    @Column(name = "credit_profile_type_code", nullable = false)
    private String  creditProfileTypeCode;
    
    
    @JsonProperty("creditBankCode")
    @Column(name = "credit_bank_code", nullable = false)
    private String  creditBankCode;
    
    
    @JsonProperty("creditWalletAccntNo")
    @Column(name = "credit_wallet_accnt_no", nullable = false)
    private  long  creditWalletAccntNo = -1;
    
    
    @JsonProperty("creditWalletAccntNoEncry")
    @Column(name = "credit_wallet_accnt_no_encry", nullable = false)
    private  String  creditWalletAccntNoEncry;
    
    
    @JsonProperty("memo")
    @Column(name = "memo", nullable = false)
    private String  memo;
    
    
    @JsonProperty("trxnChannel")
    @Column(name = "trxn_channel", nullable = false)
    private String  trxnChannel;
    
    
    @JsonProperty("trxnType")
    @Column(name = "trxn_type", nullable = false)
    private String  trxnType;
    
    
     @JsonProperty("serviceProviderId")
    @Column(name = "service_provider_id", nullable = false)
    private  int  serviceProviderId = -1;
    
    
    @JsonProperty("serviceProvider")
    @Column(name = "service_provider", nullable = false)
    private  String  serviceProvider;
    
    
    @JsonProperty("serviceName")
    @Column(name = "service_name", nullable = false)
    private  String  serviceName;
    
    
    @JsonProperty("trxnDate")
    @Column(name = "trxn_date", nullable = false)
    private  String  trxnDate;
    
    
    @JsonProperty("trxnTime")
    @Column(name = "trxn_time", nullable = false)
    private  String  trxnTime;
    
    
    
    @JsonProperty("dueDate")
    @Column(name = "due_date", nullable = false)
    private  String  dueDate;
    
    
    @JsonProperty("narration")
    @Column(name = "narration", nullable = false)
    private  String  narration;
    
    
    @JsonProperty("transStatusCode")
    @Column(name = "trans_status_date", nullable = false)
    private  String  transStatusCode;
    
    
    @JsonProperty("sysComment")
    @Column(name = "sys_comment", nullable = false)
    private  String  sysComment;
    
    
    
    
     
     
    
}