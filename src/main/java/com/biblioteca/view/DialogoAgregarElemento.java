// Vista: DialogoAgregarElemento.java
package com.biblioteca.view;

import com.biblioteca.model.ElementoBiblioteca;
import com.biblioteca.model.Revista;
import com.biblioteca.model.DVD;
import javax.swing.*;
import java.awt.*;

public class DialogoAgregarElemento extends JDialog {
    private MainFrame parent;
    private String tituloDialogo;
    private String tipoElemento;
    private ElementoBiblioteca elementoAEditar;
    private JTextField txtTitulo;
    private JTextField txtAutor;
    private JTextField txtAnoPublicacion;
    private JTextField txtEdicion;
    private JTextField txtCategoria;
    private JButton btnGuardar;
    private ElementoBiblioteca resultado;

    // Constructor para agregar
    public DialogoAgregarElemento(MainFrame parent, String tituloDialogo, String tipoElemento) {
        super(parent, tituloDialogo, true);
        this.parent = parent;
        this.tituloDialogo = tituloDialogo;
        this.tipoElemento = tipoElemento;
        inicializarComponentes();
        setSize(400, 300);
        setLocationRelativeTo(parent);
    }

    // Constructor para editar
    public DialogoAgregarElemento(MainFrame parent, String tituloDialogo, String tipoElemento, ElementoBiblioteca elementoAEditar) {
        super(parent, tituloDialogo, true);
        this.parent = parent;
        this.tituloDialogo = tituloDialogo;
        this.tipoElemento = tipoElemento;
        this.elementoAEditar = elementoAEditar;
        inicializarComponentes();
        llenarCamposParaEdicion();
        setSize(400, 300);
        setLocationRelativeTo(parent);
    }

    private void inicializarComponentes() {
        // ... (Creación de etiquetas, campos de texto, botón Guardar, etc.
        //       según el tipo de elemento)
        setLayout(new FlowLayout());
        txtTitulo = new JTextField(20);
        txtAutor = new JTextField(20);
        txtAnoPublicacion = new JTextField(20);
        txtEdicion = new JTextField(20);
        txtCategoria = new JTextField(20);
        btnGuardar = new JButton("Guardar");
        btnGuardar.addActionListener(e -> guardarElemento());

        add(new JLabel("Título:"));
        add(txtTitulo);
        add(new JLabel("Autor:"));
        add(txtAutor);
        add(new JLabel("Año de Publicación:"));
        add(txtAnoPublicacion);
        if (tipoElemento.equals("REVISTA")) {
            add(new JLabel("Edición:"));
            add(txtEdicion);
            add(new JLabel("Categoría:"));
            add(txtCategoria);
        } else if (tipoElemento.equals("DVD")) {
            // Añadir campos específicos para DVD (duración, género)
        }
        add(btnGuardar);
    }

    private void llenarCamposParaEdicion() {
        if (elementoAEditar != null) {
            txtTitulo.setText(elementoAEditar.getTitulo());
            txtAutor.setText(elementoAEditar.getAutor());
            txtAnoPublicacion.setText(String.valueOf(elementoAEditar.getAnoPublicacion()));
            if (elementoAEditar instanceof Revista) {
                txtEdicion.setText(String.valueOf(((Revista) elementoAEditar).getNumeroEdicion()));
                txtCategoria.setText(((Revista) elementoAEditar).getCategoria());
            } else if (elementoAEditar instanceof DVD) {
                // Llenar campos específicos para DVD
            }
        }
    }

    private void guardarElemento() {
        String titulo = txtTitulo.getText();
        String autor = txtAutor.getText();
        int anoPublicacion = Integer.parseInt(txtAnoPublicacion.getText());

        if (tipoElemento.equals("REVISTA")) {
            int edicion = Integer.parseInt(txtEdicion.getText());
            String categoria = txtCategoria.getText();
            resultado = new Revista(0, titulo, autor, anoPublicacion, edicion, categoria); // ID se asignará en la base de datos
        } else if (tipoElemento.equals("DVD")) {
            // Crear objeto DVD con los datos ingresados
        }
        dispose(); // Cierra el diálogo
    }

    public ElementoBiblioteca mostrar() {
        setVisible(true);
        return resultado;
    }
}