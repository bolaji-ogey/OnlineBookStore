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
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotBlank;
import java.math.BigDecimal;
import java.util.LinkedList;
import java.util.List;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter; 

 
@Getter @Setter @NoArgsConstructor  
@Entity
@Table(name="journal_line")
public class  JournalLine extends AbstractEntity {
    
    
    
    
    @JsonProperty("profileDetailId")
    @Column(name = "profile_detail_id", nullable = false, unique = true)
    private  long  profileDetailId =  -1L;
    
    @JsonProperty("profileTypeCode")
    @Column(name = "profile_type_code", nullable = false)
    private String  profileTypeCode;
    
    
    @JsonProperty("journalAction")
    @Column(name = "journal_action", nullable = false)
    private String  journalAction;
     
    
    @JsonProperty("creditDebitPartnerCode")
    @Column(name = "credit_debit_partner_code", nullable = false)
    private String  creditDebitPartnerCode;
    
     
    @JsonProperty("creditDebitSchemeCode")
    @Column(name = "credit_debit_scheme_code", nullable = false)
    private String  creditDebitSchemeCode;
    
    
     @JsonProperty("isCreditOrDebit")
    @Column(name = "is_credit_or_debit", nullable = false)
    private String  isCreditOrDebit;
    
    @JsonProperty("creditDebitvalue")
    @Column(name = "credit_debit_value", nullable = false)
    private BigDecimal  creditDebitvalue  =  new  BigDecimal(0.00);
     
    
    
    @JsonProperty("journalId")
    @Column(name = "journal_id", nullable = false)
    private  long  journalId;
    
    
    @JsonProperty("walletAccountId")
    @Column(name = "wallet_account_id", nullable = false)
    private   long  walletAccountId;
    
    
    @JsonProperty("currentBalance")
    @Column(name = "current_balance", nullable = false)
    private BigDecimal  currentBalance =  new BigDecimal(0.00);
    
    
    @JsonProperty("previousBalance")
    @Column(name = "previous_balance", nullable = false)
    private BigDecimal  previousBalance =  new BigDecimal(0.00);
    
    
    @JsonProperty("trxnDate")
    @Column(name = "trxn_date", nullable = false)
    private String  trxnDate;
    
    
    @JsonProperty("trxnTime")
    @Column(name = "trxn_time", nullable = false)
    private String  trxnTime;
     
    
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