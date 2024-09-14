/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package i.ogeyingbo.enterprise.trxn.entities;

/**
 *
 * @author BOLAJI-OGEYINGBO
 */ 
import jakarta.annotation.Nullable;
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
@Table(name="transaction_registers")
public class  TransactionRegister extends AbstractEntity {
    
     
	wallet_id int8 NOT NULL DEFAULT '-1'::integer,
	wallet_accnt_number bpchar(15) NOT NULL DEFAULT '-'::bpchar,
	customer_reference bpchar(60) NOT NULL DEFAULT '-'::bpchar,
	current_column_ref int4 NOT NULL DEFAULT 0,
	trxn_date_0 date NULL,
	trxn_time_0 time NULL,
	trxn_post_type_0 bpchar(2) NOT NULL DEFAULT 'dr'::bpchar,
	trxn_post_function_0 bpchar(1) NOT NULL DEFAULT '-'::bpchar,
	trxn_amount_0 numeric(15, 2) NULL DEFAULT 0.00,
	total_trxn_fee_0 numeric(15, 2) NULL DEFAULT 0.00,
	auth_user_id_0 int8 NOT NULL DEFAULT '-1'::integer,
	auth_factor_1_key_hash_0 bpchar(20) NOT NULL DEFAULT 'dr'::bpchar,
	reciever_bank_type_0 bpchar(15) NOT NULL DEFAULT '-'::bpchar,
	reciever_accnt_num_0 bpchar(15) NOT NULL DEFAULT '-'::bpchar,
	reciever_bank_code_0 bpchar(3) NOT NULL DEFAULT '-'::bpchar,
	trxn_date_1 date NULL,
	trxn_time_1 time NULL,
	trxn_post_type_1 bpchar(2) NOT NULL DEFAULT 'dr'::bpchar,
	trxn_post_function_1 bpchar(1) NOT NULL DEFAULT '-'::bpchar,
	trxn_amount_1 numeric(15, 2) NULL DEFAULT 0.00,
	total_trxn_fee_1 numeric(15, 2) NULL DEFAULT 0.00,
	auth_user_id_1 int8 NOT NULL DEFAULT '-1'::integer,
	auth_factor_1_key_hash_1 bpchar(10) NOT NULL DEFAULT '-'::bpchar,
	auth_factor_2_key_hash_1 bpchar(10) NOT NULL DEFAULT '-'::bpchar,
	reciever_bank_type_1 bpchar(15) NOT NULL DEFAULT '-'::bpchar,
	reciever_accnt_num_1 bpchar(15) NOT NULL DEFAULT '-'::bpchar,
	reciever_bank_code_1 bpchar(3) NOT NULL DEFAULT '-'::bpchar,
	trxn_date_2 date NULL,
	trxn_time_2 time NULL,
	trxn_post_type_2 bpchar(2) NOT NULL DEFAULT 'dr'::bpchar,
	trxn_post_function_2 bpchar(1) NOT NULL DEFAULT '-'::bpchar,
	trxn_amount_2 numeric(15, 2) NULL DEFAULT 0.00,
	total_trxn_fee_2 numeric(15, 2) NULL DEFAULT 0.00,
	auth_user_id_2 int8 NOT NULL DEFAULT '-1'::integer,
	auth_factor_1_key_hash_2 bpchar(10) NOT NULL DEFAULT '-'::bpchar,
	auth_factor_2_key_hash_2 bpchar(10) NOT NULL DEFAULT '-'::bpchar,
	reciever_bank_type_2 bpchar(15) NOT NULL DEFAULT '-'::bpchar,
	reciever_accnt_num_2 bpchar(15) NOT NULL DEFAULT '-'::bpchar,
	reciever_bank_code_2 bpchar(3) NOT NULL DEFAULT '-'::bpchar,
	trxn_date_3 date NULL,
	trxn_time_3 time NULL,
	trxn_post_type_3 bpchar(2) NOT NULL DEFAULT 'dr'::bpchar,
	trxn_post_function_3 bpchar(1) NOT NULL DEFAULT '-'::bpchar,
	trxn_amount_3 numeric(15, 2) NULL DEFAULT 0.00,
	total_trxn_fee_3 numeric(15, 2) NULL DEFAULT 0.00,
	auth_user_id_3 int8 NOT NULL DEFAULT '-1'::integer,
	auth_factor_1_key_hash_3 bpchar(10) NOT NULL DEFAULT '-'::bpchar,
	auth_factor_2_key_hash_3 bpchar(10) NOT NULL DEFAULT '-'::bpchar,
	reciever_bank_type_3 bpchar(15) NOT NULL DEFAULT '-'::bpchar,
	reciever_accnt_num_3 bpchar(15) NOT NULL DEFAULT '-'::bpchar,
	reciever_bank_code_3 bpchar(3) NOT NULL DEFAULT '-'::bpchar,
	trxn_date_4 date NULL,
	trxn_time_4 time NULL,
	trxn_post_type_4 bpchar(2) NOT NULL DEFAULT 'dr'::bpchar,
	trxn_post_function_4 bpchar(1) NOT NULL DEFAULT '-'::bpchar,
	trxn_amount_4 numeric(15, 2) NULL DEFAULT 0.00,
	total_trxn_fee_4 numeric(15, 2) NULL DEFAULT 0.00,
	auth_user_id_4 int8 NOT NULL DEFAULT '-1'::integer,
	auth_factor_1_key_hash_4 bpchar(10) NOT NULL DEFAULT '-'::bpchar,
	auth_factor_2_key_hash_4 bpchar(10) NOT NULL DEFAULT '-'::bpchar,
	reciever_bank_type_4 bpchar(15) NOT NULL DEFAULT '-'::bpchar,
	reciever_accnt_num_4 bpchar(15) NOT NULL DEFAULT '-'::bpchar,
	reciever_bank_code_4 bpchar(3) NOT NULL DEFAULT '-'::bpchar,
	trxn_date_5 date NULL,
	trxn_time_5 time NULL,
	trxn_post_type_5 bpchar(2) NOT NULL DEFAULT 'dr'::bpchar,
	trxn_post_function_5 bpchar(1) NOT NULL DEFAULT '-'::bpchar,
	trxn_amount_5 numeric(15, 2) NULL DEFAULT 0.00,
	total_trxn_fee_5 numeric(15, 2) NULL DEFAULT 0.00,
	auth_user_id_5 int8 NOT NULL DEFAULT '-1'::integer,
	auth_factor_1_key_hash_5 bpchar(10) NOT NULL DEFAULT '-'::bpchar,
	auth_factor_2_key_hash_5 bpchar(10) NOT NULL DEFAULT '-'::bpchar,
	reciever_bank_type_5 bpchar(15) NOT NULL DEFAULT '-'::bpchar,
	reciever_accnt_num_5 bpchar(15) NOT NULL DEFAULT '-'::bpchar,
	reciever_bank_code_5 bpchar(3) NOT NULL DEFAULT '-'::bpchar,
	trxn_date_6 date NULL,
	trxn_time_6 time NULL,
	trxn_post_type_6 bpchar(2) NOT NULL DEFAULT '-'::bpchar,
	trxn_post_function_6 bpchar(1) NOT NULL DEFAULT '-'::bpchar,
	trxn_amount_6 numeric(15, 2) NULL DEFAULT 0.00,
	total_trxn_fee_6 numeric(15, 2) NULL DEFAULT 0.00,
	auth_user_id_6 int8 NOT NULL DEFAULT '-1'::integer,
	auth_factor_1_key_hash_6 bpchar(10) NOT NULL DEFAULT '-'::bpchar,
	auth_factor_2_key_hash_6 bpchar(10) NOT NULL DEFAULT '-'::bpchar,
	reciever_bank_type_6 bpchar(15) NOT NULL DEFAULT '-'::bpchar,
	reciever_accnt_num_6 bpchar(15) NOT NULL DEFAULT '-'::bpchar,
	reciever_bank_code_6 bpchar(3) NOT NULL DEFAULT '-'::bpchar,
	trxn_date_7 date NULL,
	trxn_time_7 time NULL,
	trxn_post_type_7 bpchar(2) NOT NULL DEFAULT 'dr'::bpchar,
	trxn_post_function_7 bpchar(1) NOT NULL DEFAULT '-'::bpchar,
	trxn_amount_7 numeric(15, 2) NULL DEFAULT 0.00,
	total_trxn_fee_7 numeric(15, 2) NULL DEFAULT 0.00,
	auth_user_id_7 int8 NOT NULL DEFAULT '-1'::integer,
	auth_factor_1_key_hash_7 bpchar(10) NOT NULL DEFAULT '-'::bpchar,
	auth_factor_2_key_hash_7 bpchar(10) NOT NULL DEFAULT '-'::bpchar,
	reciever_bank_type_7 bpchar(15) NOT NULL DEFAULT '-'::bpchar,
	reciever_accnt_num_7 bpchar(15) NOT NULL DEFAULT '-'::bpchar,
	reciever_bank_code_7 bpchar(3) NOT NULL DEFAULT '-'::bpchar,
	trxn_date_8 date NULL,
	trxn_time_8 time NULL,
	trxn_post_type_8 bpchar(2) NOT NULL DEFAULT '-'::bpchar,
	trxn_post_function_8 bpchar(1) NOT NULL DEFAULT '-'::bpchar,
	trxn_amount_8 numeric(15, 2) NULL DEFAULT 0.00,
	total_trxn_fee_8 numeric(15, 2) NULL DEFAULT 0.00,
	auth_user_id_8 int8 NOT NULL DEFAULT '-1'::integer,
	auth_factor_1_key_hash_8 bpchar(10) NOT NULL DEFAULT '-'::bpchar,
	auth_factor_2_key_hash_8 bpchar(10) NOT NULL DEFAULT '-'::bpchar,
	reciever_bank_type_8 bpchar(15) NOT NULL DEFAULT '-'::bpchar,
	reciever_accnt_num_8 bpchar(15) NOT NULL DEFAULT '-'::bpchar,
	reciever_bank_code_8 bpchar(3) NOT NULL DEFAULT '-'::bpchar,
	trxn_date_9 date NULL,
	trxn_time_9 time NULL,
	trxn_post_type_9 bpchar(2) NOT NULL DEFAULT '-'::bpchar,
	trxn_post_function_9 bpchar(1) NOT NULL DEFAULT '-'::bpchar,
	trxn_amount_9 numeric(15, 2) NULL DEFAULT 0.00,
	total_trxn_fee_9 numeric(15, 2) NULL DEFAULT 0.00,
	auth_user_id_9 int8 NOT NULL DEFAULT '-1'::integer,
	auth_factor_1_key_hash_9 bpchar(10) NOT NULL DEFAULT '-'::bpchar,
	auth_factor_2_key_hash_9 bpchar(10) NOT NULL DEFAULT '-'::bpchar,
	reciever_bank_type_9 bpchar(15) NOT NULL DEFAULT '-'::bpchar,
	reciever_accnt_num_9 bpchar(15) NOT NULL DEFAULT '-'::bpchar,
	reciever_bank_code_9 bpchar(3) NOT NULL DEFAULT '-'::bpchar
 
    
    
    
}
