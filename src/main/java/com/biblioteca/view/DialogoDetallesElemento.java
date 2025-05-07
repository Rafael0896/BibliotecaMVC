// Vista: DialogoDetallesElemento.java
package com.biblioteca.view;

import com.biblioteca.model.ElementoBiblioteca;
import com.biblioteca.model.Libro;
import com.biblioteca.model.DVD;
import com.biblioteca.model.Revista;
import javax.swing.*;
import java.awt.*;

public class DialogoDetallesElemento extends JDialog {
    private MainFrame parent;
    private ElementoBiblioteca elemento;

    private JLabel lblTituloValor;
    private JLabel lblAutorValor;
    private JLabel lblAnoPublicacionValor;
    private JPanel panelDetallesEspecificos;

    public DialogoDetallesElemento(MainFrame parent, ElementoBiblioteca elemento) {
        super(parent, "Detalles del Elemento", true);
        this.parent = parent;
        this.elemento = elemento;
        inicializarComponentes();
        mostrarDetalles();
        setSize(400, 300);
        setLocationRelativeTo(parent);
        setDefaultCloseOperation(JDialog.DISPOSE_ON_CLOSE);
    }

    private void inicializarComponentes() {
        setLayout(new BorderLayout(10, 10));
        JPanel panelGeneral = new JPanel(new GridLayout(0, 2, 5, 5));

        panelGeneral.add(new JLabel("Título:", SwingConstants.RIGHT));
        lblTituloValor = new JLabel();
        panelGeneral.add(lblTituloValor);

        panelGeneral.add(new JLabel("Autor:", SwingConstants.RIGHT));
        lblAutorValor = new JLabel();
        panelGeneral.add(lblAutorValor);

        panelGeneral.add(new JLabel("Año de Publicación:", SwingConstants.RIGHT));
        lblAnoPublicacionValor = new JLabel();
        panelGeneral.add(lblAnoPublicacionValor);

        panelDetallesEspecificos = new JPanel(new FlowLayout(FlowLayout.LEFT));
        panelGeneral.add(new JLabel("Detalles:", SwingConstants.RIGHT));
        panelGeneral.add(panelDetallesEspecificos);

        add(panelGeneral, BorderLayout.CENTER);

        JButton btnCerrar = new JButton("Cerrar");
        btnCerrar.addActionListener(e -> dispose());
        JPanel panelBoton = new JPanel(new FlowLayout(FlowLayout.CENTER));
        panelBoton.add(btnCerrar);
        add(panelBoton, BorderLayout.SOUTH);
    }

    private void mostrarDetalles() {
        lblTituloValor.setText(elemento.getTitulo());
        lblAutorValor.setText(elemento.getAutor());
        lblAnoPublicacionValor.setText(String.valueOf(elemento.getAnoPublicacion()));

        panelDetallesEspecificos.removeAll();
        panelDetallesEspecificos.setLayout(new BoxLayout(panelDetallesEspecificos, BoxLayout.Y_AXIS));

        if (elemento instanceof Libro) {
            Libro libro = (Libro) elemento;
            panelDetallesEspecificos.add(new JLabel("ISBN: " + libro.getIsbn()));
            panelDetallesEspecificos.add(new JLabel("Género: " + libro.getGenero()));
        } else if (elemento instanceof Revista) {
            Revista revista = (Revista) elemento;
            panelDetallesEspecificos.add(new JLabel("Edición: " + revista.getNumeroEdicion()));
            panelDetallesEspecificos.add(new JLabel("Categoría: " + revista.getCategoria()));
        } else if (elemento instanceof DVD) {
            DVD dvd = (DVD) elemento;
            panelDetallesEspecificos.add(new JLabel("Duración: " + dvd.getDuracion() + " minutos"));
            panelDetallesEspecificos.add(new JLabel("Género: " + dvd.getGenero()));
        }

        panelDetallesEspecificos.revalidate();
        panelDetallesEspecificos.repaint();
    }

    public void mostrar() {
        setVisible(true);
    }
}