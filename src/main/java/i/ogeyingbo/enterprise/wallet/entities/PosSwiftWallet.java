/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package i.ogeyingbo.enterprise.wallet.entities;

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
@Table(name="pos_swift_wallets")
public class  PosSwiftWallet extends AbstractEntity {
    
    
     
    @JsonProperty("walletAccountNo")
    @Column(name="wallet_accnt_no")
    private  Long  walletAccountNo;
    
    @JsonProperty("bookBalance")
    @Column(name="book_balance", length=200)
    private String  bookBalance;
    
    @JsonProperty("bookBalancePlain")
    @Column(name="book_balance_plain")
    private  BigDecimal  bookBalancePlain = new BigDecimal(0.00);
    
    
    @JsonProperty("dateOpened")
    @Column(name="date_opened")
    private String  dateOpened;
    
    @JsonProperty("customerNo")
    @Column(name="customer_no")
    private Long customerNo;
    
    @JsonProperty("customerRef")
    @Column(name="customer_ref", length=200)
    private String  customerRef;
     
        
    @JsonProperty("profileTypeCode")
    @Column(name="profile_type_code", length=5)
    private String  profileTypeCode;   
    
    
    @JsonProperty("schemeCode")
    @Column(name="scheme_code", length=20)
    private String  schemeCode;  
    
    
    @JsonProperty("walletAccountTypeId")
    @Column(name="wallet_account_type_id")
    private  Long  walletAccountTypeId  =  -1L;
    
    
    @JsonProperty("profileId")
    @Column(name="profile_id", length=60)
    private String  profileId; 
    
    
    @JsonProperty("walletName")
    @Column(name="scheme_code", length=60)
    private String  walletName; 
    
    
    @JsonProperty("lastModifiedDate")
    @Column(name="last_modified_date", length=60)
    private String  lastModifiedDate;
    
    
    @JsonProperty("activeStatus")
    @Column(name="active_status", length=60)
    private String  activeStatus;
    
    @JsonProperty("parentId")
    @Column(name="parent_id")
    private  long  parentId;
    
    
    @JsonProperty("virtualNuban")
    @Column(name="virtual_nuban", length=40)
    private String  virtualNuban; 
    
    
    @JsonProperty("nubanBankCode")
    @Column(name="nuban_bank_code", length=40)
    private String  nubanBankCode; 
    
    
    @JsonProperty("nubanAccountNo")
    @Column(name="nuban_account_no", length=40)
    private String  nubanAccountNo;
    
    
    @JsonProperty("trackingRef")
    @Column(name="tracking_ref", length=40)
    private String  trackingRef; 
    
    
    @JsonProperty("currencyCode")
    @Column(name="currency_code", length=3)
    private String  currencyCode; 
    
    
    @JsonProperty("availableBalance")
    @Column(name="available_balance", length=120)
    private String  availableBalance;
    
    
    @JsonProperty("availableBalancePlain")
    @Column(name="available_balance_plain")
    private BigDecimal  availableBalancePlain  = new  BigDecimal(0.00);
    
    
    @JsonProperty("pocketWalletBalance")
    @Column(name="pocket_wallet_balance", length=120)
    private String  pocketWalletBalance;
    
    
    @JsonProperty("pocketWalletBalancePlain")
    @Column(name="pocket_wallet_balance_plain")
    private BigDecimal  pocketWalletBalancePlain  = new  BigDecimal(0.00);
    
    
    @JsonProperty("holdAmountBalance")
    @Column(name="hold_amount_balance", length=120)
    private String  holdAmountBalance;
    
    
    @JsonProperty("holdAmountBalancePlain")
    @Column(name="hold_amount_balance_plain")
    private BigDecimal  holdAmountBalancePlain  = new  BigDecimal(0.00);
    
    
    
    @JsonProperty("transitTrxnBalance")
    @Column(name="transit_trxn_balance", length=120)
    private String  transitTrxnBalance;
    
    
    @JsonProperty("transitTrxnBalancePlain")
    @Column(name="transit_trxn_balance_plain")
    private BigDecimal  transitTrxnBalancePlain  = new  BigDecimal(0.00);
    
    
    
    @JsonProperty("walletLimit")
    @Column(name="wallet_limit", length=120)
    private String  walletLimit;
    
    
    
    @JsonProperty("sysAcctLock")
    @Column(name="sys_acct_lock", length=120)
    private String  sysAcctLock;
    
    
    
    @JsonProperty("overdraftBalance")
    @Column(name="overdraft_balance", length=120)
    private String   overdraftBalance;
    
    
    @JsonProperty("overdraftBalancePlain")
    @Column(name="overdraft_balance_plain")
    private BigDecimal  overdraftBalancePlain  = new  BigDecimal(0.00);
    
    
    
    @JsonProperty("pendingDebitCount")
    @Column(name="pending_debit_count")
    private  long  pendingDebitCount;
    
    
    @JsonProperty("pendingCreditCount")
    @Column(name="pending_credit_count")
    private  long  pendingCreditCount;
    
    
    @JsonProperty("debitCount")
    @Column(name="debit_count")
    private  long  debitCount;
    
    
    @JsonProperty("creditCount")
    @Column(name="credit_count")
    private  long  creditCount;
    
    
    
    @JsonProperty("dailyCummulativeDebit")
    @Column(name="daily_cummulative_debit", length=120)
    private String   dailyCummulativeDebit;
    
    
    @JsonProperty("dailyCummulativeDebitPlain")
    @Column(name="daily_cummulative_debit_plain")
    private BigDecimal  dailyCummulativeDebitPlain  = new  BigDecimal(0.00);
    
    
    
    @JsonProperty("dailyCummulativeCredit")
    @Column(name="daily_Cummulative_credit", length=120)
    private String   dailyCummulativeCredit;
    
    
    @JsonProperty("dailyCummulativeCreditPlain")
    @Column(name="daily_Cummulative_credit_plain")
    private BigDecimal  dailyCummulativeCreditPlain  = new  BigDecimal(0.00);
    
    
    @JsonProperty("lastCreditTrxnRef")
    @Column(name="last_credit_trxn_ref", length=20)
    private String   lastCreditTrxnRef;
    
    
    @JsonProperty("lastDebitTrxnRef")
    @Column(name="last_debit_trxn_ref", length=20)
    private String   lastDebitTrxnRef;
    
    
    @JsonProperty("lastCreditTrxnDate")
    @Column(name="last_credit_trxn_date", length=20)
    private String   lastCreditTrxnDate;
    
    
    @JsonProperty("lastDebitTrxnDate")
    @Column(name="last_debit_trxn_date", length=20)
    private String   lastDebitTrxnDate;
     
    
    @JsonProperty("sysAcctLockCode")
    @Column(name="sys_acct_lock_code", length=2)
    private String   sysAcctLockCode;
    
    
}
