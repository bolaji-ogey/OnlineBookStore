/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package i.ogeyingbo.dao;

import java.sql.ResultSet;
import java.sql.SQLException; 
import i.ogeyingbo.jdbc.core.RowMapper; 
import i.ogeyingbo.online.bookstore.model.objects.Employee;


/**
 *
 * @author BOLAJI-OGEYINGBO
 */
public class EmployeeRowMapper implements RowMapper<Employee> {
    
    @Override
    public Employee mapRow(ResultSet rs, int rowNum) throws
    SQLException {
        Employee employee = new Employee();
        employee.setId(rs.getInt("ID"));
        employee.setFirstName(rs.getString("FIRST_NAME"));
        employee.setLastName(rs.getString("LAST_NAME"));
        employee.setAddress(rs.getString("ADDRESS"));
    return employee;
    }
    
    
    
}
