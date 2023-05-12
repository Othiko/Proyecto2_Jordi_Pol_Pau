package Proyecto;

import java.awt.BorderLayout;
import java.awt.FlowLayout;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;

import javax.swing.*;

public class VentanaRankings {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		new mainReports();
	}

}


class mainReports extends JFrame {
	private JPanel buttons;
	private JButton globalpoints,enemiesdefeated,damagedone,damagetaken;
	public mainReports() {
		buttons=new JPanel();
		globalpoints=new JButton("Global Points");enemiesdefeated=new JButton("Enemies Defeated");
		damagedone=new JButton("Damage done");damagetaken=new JButton("Damage Recived");
		buttons.add(globalpoints);buttons.add(enemiesdefeated);buttons.add(damagedone);buttons.add(damagetaken);
		globalpoints.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				// TODO Auto-generated method stub
				new globalPoints();
				dispose();
			}
		});
		enemiesdefeated.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				// TODO Auto-generated method stub
				new enemiesDefeated();
				dispose();
			}	
		});
		damagedone.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				// TODO Auto-generated method stub
				new damageDone();
				dispose();
			}
		});
		damagetaken.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				// TODO Auto-generated method stub
				new damageTaken();
				dispose();
			}
			
		});
		this.add(buttons);
		this.setSize(200,200);
		this.setLocationRelativeTo(null);
		this.setVisible(true);
		this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	}
}


class globalPoints extends JFrame {
	private String urlDatos = "jdbc:mysql://localhost/batallaRaces?serverTimezone=UTC";
	private String usuario = "paujs";
	private String pass = "admin1234";
	private JPanel users,main,glPoints,ranking,name;
	private JLabel title;
	private JButton back;
	private JPanel goback;
	private JLabel[] user= new JLabel[10],point = new JLabel[10],rank = new JLabel[10];
	
	public globalPoints() {
		try {
			main=new JPanel();
			name=new JPanel();users=new JPanel();glPoints=new JPanel();ranking=new JPanel();
			goback=new JPanel();			
			back=new JButton("Go Back");
			goback.add(back);
			main.setLayout(new FlowLayout());
			users.setLayout(new BoxLayout(users,BoxLayout.Y_AXIS));
			glPoints.setLayout(new BoxLayout(glPoints,BoxLayout.Y_AXIS));
			ranking.setLayout(new BoxLayout(ranking,BoxLayout.Y_AXIS));
			
			title=new JLabel("Global Points Ranking");
			name.add(title);
			main.add(name,BorderLayout.NORTH);
			
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection(urlDatos,usuario,pass);
			Statement stmnt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
			String consultaEmp = "select player_name,player_global_points from players order by player_global_points desc limit 10;";
			ResultSet rs = stmnt.executeQuery(consultaEmp);
			ResultSetMetaData rsmd = rs.getMetaData();
			int i = 0;
			while (rs.next()) {
				rank[i] = new JLabel(String.valueOf(i+1));
				user[i] = new JLabel(rs.getString(1));
				point[i] = new JLabel(String.valueOf(rs.getInt(2)));
				ranking.add(rank[i]);users.add(user[i]);glPoints.add(point[i]);
				i++;
			}
			
			main.add(ranking,BorderLayout.WEST);main.add(users,BorderLayout.CENTER);main.add(glPoints,BorderLayout.EAST);
			main.add(goback,BorderLayout.SOUTH);
			back.addActionListener(new ActionListener() {

				@Override
				public void actionPerformed(ActionEvent e) {
					// TODO Auto-generated method stub
					new mainReports();
					dispose();
				}
			});
			this.add(main);
			this.setSize(150,300);
			this.setTitle("Global Points");
			this.setLocationRelativeTo(null);
			this.setResizable(false);
			this.setVisible(true);
			this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}

class enemiesDefeated extends JFrame {
	private String urlDatos = "jdbc:mysql://localhost/batallaRaces?serverTimezone=UTC";
	private String usuario = "paujs";
	private String pass = "admin1234";
	private JPanel users,main,defeated,ranking,name;
	private JLabel title;
	private JButton back;
	private JPanel goback;
	private JLabel[] user= new JLabel[10],enemiesdef = new JLabel[10],rank = new JLabel[10];
	public enemiesDefeated() {
		try {
			main=new JPanel();
			name=new JPanel();users=new JPanel();defeated=new JPanel();ranking=new JPanel();
			goback=new JPanel();			
			back=new JButton("Go Back");
			goback.add(back);
			main.setLayout(new FlowLayout());
			users.setLayout(new BoxLayout(users,BoxLayout.Y_AXIS));
			defeated.setLayout(new BoxLayout(defeated,BoxLayout.Y_AXIS));
			ranking.setLayout(new BoxLayout(ranking,BoxLayout.Y_AXIS));
			
			title=new JLabel("Enemies Defeated Ranking");
			name.add(title);
			main.add(name,BorderLayout.NORTH);
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection(urlDatos,usuario,pass);
			Statement stmnt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
			String consultaEmp = "select player_name,player_enemies_defeated from players order by player_enemies_defeated desc limit 10;";
			ResultSet rs = stmnt.executeQuery(consultaEmp);
			ResultSetMetaData rsmd = rs.getMetaData();
			int i = 0;
			while (rs.next()) {
				rank[i] = new JLabel(String.valueOf(i+1));
				user[i] = new JLabel(rs.getString(1));
				enemiesdef[i] = new JLabel(String.valueOf(rs.getInt(2)));
				ranking.add(rank[i]);users.add(user[i]);defeated.add(enemiesdef[i]);
				i++;
			}
			
			main.add(ranking,BorderLayout.WEST);main.add(users,BorderLayout.CENTER);main.add(defeated,BorderLayout.EAST);
			main.add(goback,BorderLayout.SOUTH);
			back.addActionListener(new ActionListener() {

				@Override
				public void actionPerformed(ActionEvent e) {
					// TODO Auto-generated method stub
					new mainReports();
					dispose();
				}
			});
			this.add(main);
			this.add(main);
			this.setSize(170,300);
			this.setTitle("Global Points");
			this.setLocationRelativeTo(null);
			this.setResizable(false);
			this.setVisible(true);
			this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}

class damageDone extends JFrame {
	private String urlDatos = "jdbc:mysql://localhost/batallaRaces?serverTimezone=UTC";
	private String usuario = "paujs";
	private String pass = "admin1234";
	private JPanel users,main,dmgDone,ranking,name;
	private JLabel title;
	private JButton back;
	private JPanel goback;
	private JLabel[] user= new JLabel[10],damage = new JLabel[10],rank = new JLabel[10];
	public damageDone() {
		try {
			main=new JPanel();
			name=new JPanel();users=new JPanel();dmgDone=new JPanel();ranking=new JPanel();
			goback=new JPanel();			
			back=new JButton("Go Back");
			goback.add(back);
			main.setLayout(new FlowLayout());
			users.setLayout(new BoxLayout(users,BoxLayout.Y_AXIS));
			dmgDone.setLayout(new BoxLayout(dmgDone,BoxLayout.Y_AXIS));
			ranking.setLayout(new BoxLayout(ranking,BoxLayout.Y_AXIS));
			
			title=new JLabel("Damage Done Ranking");
			name.add(title);
			main.add(name,BorderLayout.NORTH);
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection(urlDatos,usuario,pass);
			Statement stmnt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
			String consultaEmp = "select player_name,player_damage_done from players order by player_damage_done desc limit 10;";
			ResultSet rs = stmnt.executeQuery(consultaEmp);
			ResultSetMetaData rsmd = rs.getMetaData();
			int i = 0;
			while (rs.next()) {
				rank[i] = new JLabel(String.valueOf(i+1));
				user[i] = new JLabel(rs.getString(1));
				damage[i] = new JLabel(String.valueOf(rs.getInt(2)));
				ranking.add(rank[i]);users.add(user[i]);dmgDone.add(damage[i]);
				i++;
			}
			
			main.add(ranking,BorderLayout.WEST);main.add(users,BorderLayout.CENTER);main.add(dmgDone,BorderLayout.EAST);
			main.add(goback,BorderLayout.SOUTH);
			back.addActionListener(new ActionListener() {

				@Override
				public void actionPerformed(ActionEvent e) {
					// TODO Auto-generated method stub
					new mainReports();
					dispose();
				}
			});
			this.add(main);
			this.setSize(150,300);
			this.setTitle("Global Points");
			this.setLocationRelativeTo(null);
			this.setResizable(false);
			this.setVisible(true);
			this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}

class damageTaken extends JFrame {
	private String urlDatos = "jdbc:mysql://localhost/batallaRaces?serverTimezone=UTC";
	private String usuario = "paujs";
	private String pass = "admin1234";
	private JPanel users,main,dmgTaken,ranking,name;
	private JLabel title;
	private JButton back;
	private JPanel goback;
	private JLabel[] user= new JLabel[10],damage = new JLabel[10],rank = new JLabel[10];
	public damageTaken() {
		try {
			main=new JPanel();
			name=new JPanel();users=new JPanel();dmgTaken=new JPanel();ranking=new JPanel();
			goback=new JPanel();			
			back=new JButton("Go Back");
			goback.add(back);
			main.setLayout(new FlowLayout());
			users.setLayout(new BoxLayout(users,BoxLayout.Y_AXIS));
			dmgTaken.setLayout(new BoxLayout(dmgTaken,BoxLayout.Y_AXIS));
			ranking.setLayout(new BoxLayout(ranking,BoxLayout.Y_AXIS));
			
			title=new JLabel("Damage Recived Ranking");
			name.add(title);
			main.add(name,BorderLayout.NORTH);
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection(urlDatos,usuario,pass);
			Statement stmnt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
			String consultaEmp = "select player_name,player_damage_taken from players order by player_damage_taken desc limit 10;";
			ResultSet rs = stmnt.executeQuery(consultaEmp);
			ResultSetMetaData rsmd = rs.getMetaData();
			int i = 0;
			while (rs.next()) {
				rank[i] = new JLabel(String.valueOf(i+1));
				user[i] = new JLabel(rs.getString(1));
				damage[i] = new JLabel(String.valueOf(rs.getInt(2)));
				ranking.add(rank[i]);users.add(user[i]);dmgTaken.add(damage[i]);
				i++;
			}
			
			main.add(ranking,BorderLayout.WEST);main.add(users,BorderLayout.CENTER);main.add(dmgTaken,BorderLayout.EAST);
			main.add(goback,BorderLayout.SOUTH);
			back.addActionListener(new ActionListener() {

				@Override
				public void actionPerformed(ActionEvent e) {
					// TODO Auto-generated method stub
					new mainReports();
					dispose();
				}
			});
			this.add(main);
			this.setSize(165,300);
			this.setTitle("Damage Recibed");
			this.setLocationRelativeTo(null);
			this.setResizable(false);
			this.setVisible(true);
			this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}