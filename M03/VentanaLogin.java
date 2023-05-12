package Proyecto;

import java.awt.*;
import java.awt.event.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.swing.*;

public class VentanaLogin {

	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		new loginRegister();
	}

}

class loginRegister extends JFrame {
	private JPanel main,messages,userpassw,userrep,buttons,users,passwords;
	private JLabel message,userlabel,passwlabel,errorslab;
	private JTextField usertextfield;
	private JPasswordField passwordfield;
	private JButton login,register;
	String urlDatos = "jdbc:mysql://localhost/batallaRaces?serverTimezone=UTC";
	String usuario = "paujs";
	String pass = "admin1234";
	
	public loginRegister() throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection(urlDatos,usuario,pass);
		main=new JPanel();messages=new JPanel();userpassw=new JPanel();userrep=new JPanel();buttons=new JPanel();users=new JPanel();passwords=new JPanel();
		message=new JLabel("Login or Register a user");userlabel=new JLabel("User: ");passwlabel=new JLabel("Password: ");errorslab=new JLabel();
		usertextfield=new JTextField(10);
		passwordfield=new JPasswordField(10);
		login=new JButton("Login");register=new JButton("Register");
		userpassw.setLayout(new GridLayout(2,1));
		main.setLayout(new GridLayout(1,1));
		message.setAlignmentX(CENTER_ALIGNMENT);
		userpassw.setAlignmentX(CENTER_ALIGNMENT);
		users.add(userlabel);users.add(usertextfield);passwords.add(passwlabel);passwords.add(passwordfield);
		messages.add(message,BorderLayout.CENTER);userpassw.add(users);userpassw.add(passwords);
		userrep.add(errorslab);buttons.add(login);buttons.add(register);	
		login.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				// TODO Auto-generated method stub
				String user = usertextfield.getText();
				String password = String.valueOf(passwordfield.getPassword());
				String sql = "SELECT * FROM players WHERE player_name = '"+user+"' AND player_password = '"+password+"'";
				PreparedStatement statement = null;
				try {
					statement = conn.prepareStatement(sql);
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}

				ResultSet result = null;
				try {
					result = statement.executeQuery();
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}

				try {
					if (result.next()) {
						errorslab.setText("Login successful!");
					} else {
						errorslab.setText("Invalid username or password.!");
					}
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			}
		});
		
		register.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				// TODO Auto-generated method stub
				String user = usertextfield.getText();
				String password = String.valueOf(passwordfield.getPassword());
				String sql = "SELECT * FROM players WHERE player_name = '"+user+"'";
				
				PreparedStatement statement = null;
				try {
					statement = conn.prepareStatement(sql);
				} catch (SQLException e2) {
					// TODO Auto-generated catch block
					e2.printStackTrace();
				}

				ResultSet result = null;
				try {
					result = statement.executeQuery();
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}

				try {
					if (result.next()) {
						errorslab.setText("User already exists");
					} else {
						sql = "insert into players(player_name,player_password,player_global_points,player_enemies_defeated,player_damage_done,player_damage_taken) "
								+ "values ('"+user+"','"+password+"',0,0,0,0)";
						PreparedStatement statement1 = conn.prepareStatement(sql);
						statement1.executeUpdate();
						errorslab.setText("User created succesfully");
					}
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			}
			
		});
		
		main.add(message);main.add(userpassw);main.add(buttons);main.add(userrep);
		main.setLayout(new BoxLayout(main,BoxLayout.Y_AXIS));
		this.add(main);
		this.setSize(300,250);
		this.setVisible(true);
		this.setLocationRelativeTo(null);
		this.setResizable(false);
		this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);				
	}
}