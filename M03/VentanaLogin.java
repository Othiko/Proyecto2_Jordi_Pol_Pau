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
	
	/* loginRegister() may throw ClassNotFoundException or SQLException. */
	public loginRegister() throws ClassNotFoundException, SQLException {
		/* Stablish the connection with our database. */
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection(urlDatos,usuario,pass);
		
		/* Instantiate all JPanels needed. */
		main=new JPanel();messages=new JPanel();userpassw=new JPanel();userrep=new JPanel();buttons=new JPanel();users=new JPanel();passwords=new JPanel();
		/* Instantiate all JLabels needed. */
		message=new JLabel("Login or Register a user");userlabel=new JLabel("User: ");passwlabel=new JLabel("Password: ");errorslab=new JLabel();
		usertextfield=new JTextField(10);		// Instantiate username JTextField.
		passwordfield=new JPasswordField(10);		// Instantiate user pass JPasswordField.
		login=new JButton("Login");register=new JButton("Register");	// Instantiate all JButtons needed.
		
		/* Set a layout for every JPanel in Login. */
		userpassw.setLayout(new GridLayout(2,1));
		main.setLayout(new GridLayout(1,1));
		message.setAlignmentX(CENTER_ALIGNMENT);
		userpassw.setAlignmentX(CENTER_ALIGNMENT);
		
		/* Add all objects to their respective JPanels. */
		users.add(userlabel);users.add(usertextfield);passwords.add(passwlabel);passwords.add(passwordfield);
		messages.add(message,BorderLayout.CENTER);userpassw.add(users);userpassw.add(passwords);
		userrep.add(errorslab);buttons.add(login);buttons.add(register);
		
		/* When login JButton clicked, check: */	
		login.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				/* We create a variable which values are the user and the password */
				String user = usertextfield.getText();
				String password = String.valueOf(passwordfield.getPassword());
				/* With that query we check if the users already exists. */
				String sql = "SELECT * FROM players WHERE player_name = '"+user+"' AND player_password = '"+password+"'";
				PreparedStatement statement = null;
				ResultSet result = null;
				try {
					statement = conn.prepareStatement(sql);
					result = statement.executeQuery();
					
					if (result.next()) {
						/* If there's a result it means that there's a username that uses the same password, so tue user
						 can just login. */
						errorslab.setText("Login successful!");
					} else {
						/* If there are no results, it means there's no user with the password you've provided,
						then you should register a new account. */
						errorslab.setText("Invalid username or password.!");
					}
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
			}
		});
		
		/* When register JButton clicked, check: */
		register.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				/* We obtain the username and password written and check if it's in our database. */
				String user = usertextfield.getText();
				String password = String.valueOf(passwordfield.getPassword());
				String sql = "SELECT * FROM players WHERE player_name = '"+user+"'";
				
				PreparedStatement statement = null;
				ResultSet result = null;
				try {
					statement = conn.prepareStatement(sql);
					result = statement.executeQuery();
					if (result.next()) {
						/* If there's a result, user can't register because there's an account with
						the same username. */
						errorslab.setText("User already exists");
					} else {
						/* If there are no results, then we create the new account. */
						sql = "insert into players(player_name,player_password,player_global_points,player_enemies_defeated,player_damage_done,player_damage_taken) "
								+ "values ('"+user+"','"+password+"',0,0,0,0)";
						PreparedStatement statement1 = conn.prepareStatement(sql);
						statement1.executeUpdate();
						errorslab.setText("User created succesfully");
					}
				} catch (SQLException e2) {
					e2.printStackTrace();
				}
			}
		});
		
		/* We add the remaining objects to their JPanels. */
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
