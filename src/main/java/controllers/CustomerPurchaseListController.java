package main.java.controllers;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Label;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.cell.PropertyValueFactory;
import main.java.others.DBConnection;
import main.java.others.Purchase;

import java.net.URL;
import java.sql.*;
import java.time.LocalDate;
import java.util.ResourceBundle;


public class CustomerPurchaseListController implements Initializable {
    @FXML
    private TableView<Purchase> tblRecent;
    @FXML
    private TableColumn<Purchase, Integer> purID;
    @FXML
    private TableColumn<Purchase, Integer> cusID;
    @FXML
    private TableColumn<Purchase, Integer> itemID;
    @FXML
    private TableColumn<Purchase, String> date;
    @FXML
    private TableColumn<Purchase, Integer> qty;
    @FXML
    private TableColumn<Purchase, Double> paidAmmount;
    @FXML
    private TableColumn<Purchase, Double> dueAmount;
    @FXML
    private TableColumn<Purchase, String> empName;
    @FXML
    private Label lblSellCount;
    @FXML
    private Label lblDue, today;
    @FXML
    private Label lblAmount;
    public static int customerID = 0;

    @Override
    public void initialize(URL location, ResourceBundle resources) {

        today.setText(LocalDate.now().toString());
        purID.setCellValueFactory(new PropertyValueFactory<>("purID"));
        cusID.setCellValueFactory(new PropertyValueFactory<>("cusID"));
        itemID.setCellValueFactory(new PropertyValueFactory<>("itemID"));
        date.setCellValueFactory(new PropertyValueFactory<>("date"));
        qty.setCellValueFactory(new PropertyValueFactory<>("qty"));
        paidAmmount.setCellValueFactory(new PropertyValueFactory<>("paid"));
        dueAmount.setCellValueFactory(new PropertyValueFactory<>("due"));
        empName.setCellValueFactory(new PropertyValueFactory<>("user"));

        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement getSellsList = con.prepareStatement("SELECT * FROM purchases WHERE Customers_customerID = "+customerID);
            ResultSet sellsList = getSellsList.executeQuery();

            ObservableList<Purchase> list = FXCollections.observableArrayList();

            Integer ctr = 0;
            Double due = 0.0;
            Double total = 0.0;

            while(sellsList.next()) {
                list.add(new Purchase(sellsList.getInt("purchaseID"),
                        sellsList.getInt("Customers_customerID"),
                        sellsList.getInt("Item_itemID"),
                        sellsList.getString("purchaseDate"),
                        sellsList.getInt("purchaseQuantity"),
                        sellsList.getDouble("payAmount"),
                        sellsList.getDouble("amountDue"),
                        sellsList.getString("User_username")));

                ctr++;
                due += sellsList.getDouble("amountDue");
                total += sellsList.getDouble("payAmount");

            }

            lblDue.setText(due.toString() + " Rs");
            lblAmount.setText(total.toString() + " Rs");
            lblSellCount.setText(ctr.toString());

            tblRecent.setItems(list);
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
