/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package i.ogeyingbo.enterprise.trxn.entities;

/**
 *
 * @author BOLAJI-OGEYINGBO
 */  
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
@Table(name="transaction_history")
public class  TransactionHistory extends AbstractEntity {
    
}
