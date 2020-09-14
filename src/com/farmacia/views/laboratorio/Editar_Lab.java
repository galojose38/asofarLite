/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.farmacia.views.laboratorio;

//import com.objetos.dao.CRUD;
//import com.objetos.dao.Consultas;
//import com.objetos.entities.Laboratorio;
//import com.objetos.fecha.Fecha;
//import com.objetos.file.Archivos;
import com.farmacia.dao.CRUD;
import com.farmacia.dao.Consultas;
import com.farmacia.entities1.ClaseReporte;
import com.farmacia.entities1.Laboratorio;
import com.farmacia.fecha.Fecha;
import com.farmacia.validaciones.Validacion;
import java.awt.Dimension;
//import static com.objetos.views.Consulta_Lab.listar;
import java.awt.Image;
import java.awt.MouseInfo;
import java.awt.Point;
import java.sql.Date;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.ImageIcon;
import javax.swing.JDialog;
import javax.swing.JFileChooser;
import javax.swing.JOptionPane;
import javax.swing.filechooser.FileNameExtensionFilter;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import net.sf.jasperreports.engine.util.JRLoader;
import net.sf.jasperreports.view.JRViewer;


/**
 *
 * @author alumno
 */
public class Editar_Lab extends javax.swing.JDialog {

    int x, y;
    private String rutaimagen = "";
    private Date fecha1 = null;
    ArrayList<Laboratorio> lista = null;
    int posi;
    Consultas cons = new Consultas();
    CRUD cc = new CRUD();
    Laboratorio obj2 = null;
    boolean corr = true;
    int alto = java.awt.Toolkit.getDefaultToolkit().getScreenSize().height;
    int ancho = java.awt.Toolkit.getDefaultToolkit().getScreenSize().width;
    public String fot;
//    private String rutaimagen = "", msge = "";

    /**
     * Creates new form Ingresar_Lab
     */
    public Editar_Lab(java.awt.Frame parent, boolean modal) {
        super(parent, modal);
    }

    public Editar_Lab(java.awt.Frame parent, boolean modal, Laboratorio obj, int poss) {
        super(parent, modal);
        setUndecorated(true);

        initComponents();
        VaciarImagen();
        this.setLocationRelativeTo(null);
        Habilitar(true);
        posi = poss;
        obj2 = obj;
        llenarDatos(obj);
        if ("".equals(obj.getImagen())) {
            Image img = new ImageIcon("img.cliente.png").getImage();
            ImageIcon img2 = new ImageIcon(img.getScaledInstance(258, 227, Image.SCALE_SMOOTH));
            imagen.setIcon(img2);
        }

    }

    private void llenarDatos(Laboratorio obj) {
        
        ruc.setText(obj.getRUC());
        nombre.setText(obj.getNombre());
        direccion.setText(obj.getDireccion());
        telefono.setText(obj.getTelefono());
        fecha1 = obj.getFecha();
        fecha.setText(Fecha.getStringFecha(fecha1));
        // llenarImagen(obj.getImagen());
        correo.setText(obj.getCorreo());
        getPicture2(obj.getImagen());
        System.out.println(obj.getImagen());
    }

    /* public void llenarImagen(String fil) {
        imagen.setIcon(new ImageIcon(fil));
        ImageIcon icon = new ImageIcon(fil);
        Image img = icon.getImage();
        System.out.println(fil + " Foto " + imagen.getWidth() + " " + imagen.getHeight());
        Image newimg = img.getScaledInstance(259, 221, java.awt.Image.SCALE_SMOOTH);
        ImageIcon newIcono = new ImageIcon(newimg);
        imagen.setIcon(newIcono);
        rutaimagen = fil;
    }*/
    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jButton5 = new javax.swing.JButton();
        jPanel1 = new javax.swing.JPanel();
        jPanel2 = new javax.swing.JPanel();
        telefono = new javax.swing.JTextField();
        jLabel6 = new javax.swing.JLabel();
        fecha = new javax.swing.JTextField();
        correo = new javax.swing.JTextField();
        imagen = new javax.swing.JLabel();
        BotonFecha = new javax.swing.JButton();
        jLabel7 = new javax.swing.JLabel();
        direccion = new javax.swing.JTextField();
        jLabel2 = new javax.swing.JLabel();
        jLabel3 = new javax.swing.JLabel();
        jLabel4 = new javax.swing.JLabel();
        jLabel5 = new javax.swing.JLabel();
        ruc = new javax.swing.JTextField();
        nombre = new javax.swing.JTextField();
        BotonImagen = new javax.swing.JButton();
        BotonSinImagen = new javax.swing.JButton();
        jLabel1 = new javax.swing.JLabel();
        BotonGuardar = new javax.swing.JButton();
        BotonSalir = new javax.swing.JButton();
        BotonEliminar = new javax.swing.JButton();
        Reporte = new javax.swing.JButton();

        jButton5.setText("Salir");

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);
        setUndecorated(true);

        jPanel1.setBorder(new javax.swing.border.LineBorder(new java.awt.Color(0, 0, 0), 3, true));

        jPanel2.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(1, 1, 1), 2));

        telefono.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        telefono.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyTyped(java.awt.event.KeyEvent evt) {
                telefonoKeyTyped(evt);
            }
        });

        jLabel6.setFont(new java.awt.Font("Cambria", 1, 14)); // NOI18N
        jLabel6.setForeground(new java.awt.Color(1, 1, 1));
        jLabel6.setText("E-MAIL:");

        fecha.setEditable(false);
        fecha.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        fecha.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                fechaActionPerformed(evt);
            }
        });

        correo.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        correo.addFocusListener(new java.awt.event.FocusAdapter() {
            public void focusLost(java.awt.event.FocusEvent evt) {
                correoFocusLost(evt);
            }
        });
        correo.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                correoActionPerformed(evt);
            }
        });

        imagen.setForeground(new java.awt.Color(1, 1, 1));
        imagen.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(1, 1, 1), 2));

        BotonFecha.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        BotonFecha.setText("...");
        BotonFecha.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                BotonFechaActionPerformed(evt);
            }
        });

        jLabel7.setFont(new java.awt.Font("Cambria", 1, 14)); // NOI18N
        jLabel7.setForeground(new java.awt.Color(1, 1, 1));
        jLabel7.setText("FECHA:");

        direccion.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        direccion.addFocusListener(new java.awt.event.FocusAdapter() {
            public void focusLost(java.awt.event.FocusEvent evt) {
                direccionFocusLost(evt);
            }
        });

        jLabel2.setFont(new java.awt.Font("Cambria", 1, 14)); // NOI18N
        jLabel2.setForeground(new java.awt.Color(1, 1, 1));
        jLabel2.setHorizontalAlignment(javax.swing.SwingConstants.LEFT);
        jLabel2.setText("RUC:");

        jLabel3.setFont(new java.awt.Font("Cambria", 1, 14)); // NOI18N
        jLabel3.setForeground(new java.awt.Color(1, 1, 1));
        jLabel3.setHorizontalAlignment(javax.swing.SwingConstants.LEFT);
        jLabel3.setText("NOMBRE:");

        jLabel4.setFont(new java.awt.Font("Cambria", 1, 14)); // NOI18N
        jLabel4.setForeground(new java.awt.Color(1, 1, 1));
        jLabel4.setHorizontalAlignment(javax.swing.SwingConstants.LEFT);
        jLabel4.setText("DIRECCION:");

        jLabel5.setFont(new java.awt.Font("Cambria", 1, 14)); // NOI18N
        jLabel5.setForeground(new java.awt.Color(1, 1, 1));
        jLabel5.setHorizontalAlignment(javax.swing.SwingConstants.LEFT);
        jLabel5.setText("TELEFONO:");

        ruc.setEditable(false);
        ruc.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        ruc.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyReleased(java.awt.event.KeyEvent evt) {
                rucKeyReleased(evt);
            }
            public void keyTyped(java.awt.event.KeyEvent evt) {
                rucKeyTyped(evt);
            }
        });

        nombre.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        nombre.addFocusListener(new java.awt.event.FocusAdapter() {
            public void focusLost(java.awt.event.FocusEvent evt) {
                nombreFocusLost(evt);
            }
        });

        BotonImagen.setFont(new java.awt.Font("Ubuntu", 1, 10)); // NOI18N
        BotonImagen.setIcon(new javax.swing.ImageIcon(getClass().getResource("/com/farmacia/icono/imagen1.jpg"))); // NOI18N
        BotonImagen.setText("AGREGAR FOTO"); // NOI18N
        BotonImagen.setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));
        BotonImagen.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                BotonImagenActionPerformed(evt);
            }
        });

        BotonSinImagen.setFont(new java.awt.Font("Ubuntu", 1, 10)); // NOI18N
        BotonSinImagen.setIcon(new javax.swing.ImageIcon(getClass().getResource("/com/farmacia/icono/sinimagen1.jpeg"))); // NOI18N
        BotonSinImagen.setText("VACIAR FOTO");
        BotonSinImagen.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                BotonSinImagenActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout jPanel2Layout = new javax.swing.GroupLayout(jPanel2);
        jPanel2.setLayout(jPanel2Layout);
        jPanel2Layout.setHorizontalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel2Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(jLabel3)
                    .addComponent(jLabel5)
                    .addComponent(jLabel4)
                    .addComponent(jLabel2)
                    .addComponent(jLabel6)
                    .addComponent(jLabel7))
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel2Layout.createSequentialGroup()
                        .addGap(21, 21, 21)
                        .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(jPanel2Layout.createSequentialGroup()
                                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                    .addComponent(nombre, javax.swing.GroupLayout.PREFERRED_SIZE, 160, javax.swing.GroupLayout.PREFERRED_SIZE)
                                    .addComponent(ruc, javax.swing.GroupLayout.PREFERRED_SIZE, 160, javax.swing.GroupLayout.PREFERRED_SIZE)
                                    .addComponent(telefono, javax.swing.GroupLayout.PREFERRED_SIZE, 160, javax.swing.GroupLayout.PREFERRED_SIZE)
                                    .addComponent(direccion, javax.swing.GroupLayout.PREFERRED_SIZE, 160, javax.swing.GroupLayout.PREFERRED_SIZE))
                                .addGap(15, 15, 15))
                            .addGroup(jPanel2Layout.createSequentialGroup()
                                .addComponent(fecha, javax.swing.GroupLayout.PREFERRED_SIZE, 131, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addComponent(BotonFecha, javax.swing.GroupLayout.PREFERRED_SIZE, 1, Short.MAX_VALUE)
                                .addGap(6, 6, 6))))
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel2Layout.createSequentialGroup()
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addComponent(correo, javax.swing.GroupLayout.PREFERRED_SIZE, 160, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(18, 18, 18)))
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel2Layout.createSequentialGroup()
                        .addComponent(BotonImagen, javax.swing.GroupLayout.PREFERRED_SIZE, 147, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(BotonSinImagen, javax.swing.GroupLayout.PREFERRED_SIZE, 147, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addContainerGap())
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel2Layout.createSequentialGroup()
                        .addComponent(imagen, javax.swing.GroupLayout.PREFERRED_SIZE, 223, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(40, 40, 40))))
        );
        jPanel2Layout.setVerticalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel2Layout.createSequentialGroup()
                .addGap(14, 14, 14)
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel2Layout.createSequentialGroup()
                        .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(jLabel2, javax.swing.GroupLayout.PREFERRED_SIZE, 28, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(ruc, javax.swing.GroupLayout.PREFERRED_SIZE, 28, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(nombre, javax.swing.GroupLayout.PREFERRED_SIZE, 28, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(jLabel3, javax.swing.GroupLayout.PREFERRED_SIZE, 28, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(direccion, javax.swing.GroupLayout.PREFERRED_SIZE, 28, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(jLabel4, javax.swing.GroupLayout.PREFERRED_SIZE, 28, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(jLabel5, javax.swing.GroupLayout.PREFERRED_SIZE, 31, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(telefono, javax.swing.GroupLayout.PREFERRED_SIZE, 28, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(jLabel7, javax.swing.GroupLayout.PREFERRED_SIZE, 28, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(fecha, javax.swing.GroupLayout.PREFERRED_SIZE, 28, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(BotonFecha, javax.swing.GroupLayout.PREFERRED_SIZE, 31, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(jLabel6)
                            .addComponent(correo, javax.swing.GroupLayout.PREFERRED_SIZE, 28, javax.swing.GroupLayout.PREFERRED_SIZE)))
                    .addGroup(jPanel2Layout.createSequentialGroup()
                        .addComponent(imagen, javax.swing.GroupLayout.PREFERRED_SIZE, 172, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(BotonImagen, javax.swing.GroupLayout.PREFERRED_SIZE, 36, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(BotonSinImagen, javax.swing.GroupLayout.PREFERRED_SIZE, 36, javax.swing.GroupLayout.PREFERRED_SIZE))))
                .addContainerGap())
        );

        jLabel1.setBackground(new java.awt.Color(0, 153, 153));
        jLabel1.setFont(new java.awt.Font("Tahoma", 1, 24)); // NOI18N
        jLabel1.setForeground(new java.awt.Color(254, 254, 254));
        jLabel1.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        jLabel1.setText("LABORATORIO");
        jLabel1.setOpaque(true);
        jLabel1.addMouseMotionListener(new java.awt.event.MouseMotionAdapter() {
            public void mouseDragged(java.awt.event.MouseEvent evt) {
                jLabel1MouseDragged(evt);
            }
        });
        jLabel1.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mousePressed(java.awt.event.MouseEvent evt) {
                jLabel1MousePressed(evt);
            }
        });

        BotonGuardar.setFont(new java.awt.Font("Ubuntu", 1, 11)); // NOI18N
        BotonGuardar.setForeground(new java.awt.Color(0, 102, 0));
        BotonGuardar.setIcon(new javax.swing.ImageIcon(getClass().getResource("/com/farmacia/icono/guardar1.jpg"))); // NOI18N
        BotonGuardar.setText("GUARDAR");
        BotonGuardar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                BotonGuardarActionPerformed(evt);
            }
        });

        BotonSalir.setFont(new java.awt.Font("Ubuntu", 1, 11)); // NOI18N
        BotonSalir.setIcon(new javax.swing.ImageIcon(getClass().getResource("/com/farmacia/icono/salir1.png"))); // NOI18N
        BotonSalir.setText("SALIR");
        BotonSalir.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                BotonSalirActionPerformed(evt);
            }
        });

        BotonEliminar.setFont(new java.awt.Font("Ubuntu", 1, 11)); // NOI18N
        BotonEliminar.setIcon(new javax.swing.ImageIcon(getClass().getResource("/com/farmacia/icono/eliminar1.png"))); // NOI18N
        BotonEliminar.setText("ELIMINAR");
        BotonEliminar.setToolTipText("");
        BotonEliminar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                BotonEliminarActionPerformed(evt);
            }
        });

        Reporte.setFont(new java.awt.Font("Ubuntu", 1, 11)); // NOI18N
        Reporte.setText("IMPRIMIR");
        Reporte.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                ReporteActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jLabel1, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jPanel2, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addContainerGap())
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addGap(39, 39, 39)
                .addComponent(BotonGuardar, javax.swing.GroupLayout.PREFERRED_SIZE, 120, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(18, 18, 18)
                .addComponent(Reporte, javax.swing.GroupLayout.PREFERRED_SIZE, 120, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(18, 18, 18)
                .addComponent(BotonEliminar, javax.swing.GroupLayout.PREFERRED_SIZE, 120, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(18, 18, 18)
                .addComponent(BotonSalir, javax.swing.GroupLayout.PREFERRED_SIZE, 120, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addComponent(jLabel1, javax.swing.GroupLayout.PREFERRED_SIZE, 45, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jPanel2, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(BotonEliminar, javax.swing.GroupLayout.PREFERRED_SIZE, 36, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(Reporte, javax.swing.GroupLayout.PREFERRED_SIZE, 36, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(BotonGuardar, javax.swing.GroupLayout.PREFERRED_SIZE, 36, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(BotonSalir, javax.swing.GroupLayout.PREFERRED_SIZE, 36, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel1, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void fechaActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_fechaActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_fechaActionPerformed

    private void BotonGuardarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_BotonGuardarActionPerformed
        Guardar();
    }//GEN-LAST:event_BotonGuardarActionPerformed

    private void BotonSalirActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_BotonSalirActionPerformed
        // TODO add your handling code here:
        this.setVisible(false);
    }//GEN-LAST:event_BotonSalirActionPerformed

    private void BotonImagenActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_BotonImagenActionPerformed
        // TODO add your handling code here:
        String pass = "";
        getPicture1(pass);
    }//GEN-LAST:event_BotonImagenActionPerformed

    private void BotonSinImagenActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_BotonSinImagenActionPerformed
        // TODO add your handling code here:
        VaciarImagen();
    }//GEN-LAST:event_BotonSinImagenActionPerformed

    private void BotonFechaActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_BotonFechaActionPerformed
        // TODO add your handling code here:
        Calendario calen = new Calendario(new javax.swing.JFrame(), true);
        calen.setVisible(true);
        fecha1 = calen.getFecha();
        int com = Fecha.compararFecha(fecha1, (Date) Fecha.FechaSql());
        if (com == 1 || com == 0) {
            JOptionPane.showMessageDialog(null, "Fecha invalida");
            fecha1 = null;
            fecha.setText(" ");
        } else {
            fecha.setText(Fecha.getStringFecha(fecha1));

        }
    }//GEN-LAST:event_BotonFechaActionPerformed

    private void telefonoKeyTyped(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_telefonoKeyTyped
        // TODO add your handling code here:
        char car = evt.getKeyChar();
        if (telefono.getText().length() >= 10) {
            evt.consume();
        }
        if ((car < '0' || car > '9')) {
            evt.consume();
        }
    }//GEN-LAST:event_telefonoKeyTyped

    private void rucKeyReleased(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_rucKeyReleased
        // TODO add your handling code here:
        if (Validacion.validarRUC(lista, ruc.getText())) {
            Habilitar(true);
        } else {
            Habilitar(false);
        }
    }//GEN-LAST:event_rucKeyReleased

    private void rucKeyTyped(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_rucKeyTyped
        // TODO add your handling code here:
        char car = evt.getKeyChar();
        if (ruc.getText().length() >= 13) {
            evt.consume();
        }
        if ((car < '0' || car > '9')) {
            evt.consume();
        }
    }//GEN-LAST:event_rucKeyTyped

    private void BotonEliminarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_BotonEliminarActionPerformed
        Eliminar();

    }//GEN-LAST:event_BotonEliminarActionPerformed

    private void correoActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_correoActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_correoActionPerformed

    private void correoFocusLost(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_correoFocusLost
        // TODO add your handling code here:
        corr = Validacion.Email(correo.getText());
        if (corr != true) {
            // msge = msge + "\n Correo invalido";
            JOptionPane.showMessageDialog(null, "Correo invalido");
        }
    }//GEN-LAST:event_correoFocusLost

    private void nombreFocusLost(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_nombreFocusLost
nombre.setText(nombre.getText().toUpperCase());    }//GEN-LAST:event_nombreFocusLost

    private void direccionFocusLost(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_direccionFocusLost
        direccion.setText(direccion.getText().toUpperCase());
    }//GEN-LAST:event_direccionFocusLost

    private void ReporteActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_ReporteActionPerformed
        ArrayList Laboratorio = new ArrayList();
        ClaseReporte lab = new ClaseReporte(ruc.getText(), nombre.getText(), direccion.getText(), telefono.getText(), fecha.getText(), rutaimagen, correo.getText());
        Laboratorio.add(lab);
        try {
            String dir = System.getProperty("user.dir") + "/Reportes/" + "Editar_Lab.jasper";
            JasperReport reporte = (JasperReport) JRLoader.loadObject(dir);
            JasperPrint jprint = JasperFillManager.fillReport(reporte, null, new JRBeanCollectionDataSource(Laboratorio));
            JDialog frame = new JDialog(this);
            JRViewer viewer = new JRViewer(jprint);
            frame.add(viewer);
            frame.setSize(new Dimension(ancho / 2, alto / 2));
            frame.setLocationRelativeTo(null);
            frame.setVisible(true);
            viewer.setFitWidthZoomRatio();
        } catch (JRException ex) {
            Logger.getLogger(Editar_Lab.class.getName()).log(Level.SEVERE, null, ex);
        }
    }//GEN-LAST:event_ReporteActionPerformed

    private void jLabel1MousePressed(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jLabel1MousePressed
        x = evt.getX();
        y = evt.getY();
    }//GEN-LAST:event_jLabel1MousePressed

    private void jLabel1MouseDragged(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jLabel1MouseDragged
        Point point = MouseInfo.getPointerInfo().getLocation();
        setLocation(point.x - x, point.y - y);
    }//GEN-LAST:event_jLabel1MouseDragged

    public void Eliminar() {

        cc.Eliminar(obj2);
        Habilitar(false);
        JOptionPane.showMessageDialog(null, "Laboratorio eliminado");

    }

    public void Habilitar(boolean valor) {
        ruc.setEnabled(valor);
        nombre.setEnabled(valor);
        direccion.setEnabled(valor);
        telefono.setEnabled(valor);
        fecha.setEnabled(valor);
        correo.setEnabled(valor);
        BotonFecha.setEnabled(valor);
        BotonGuardar.setEnabled(valor);
        BotonImagen.setEnabled(valor);
        BotonSinImagen.setEnabled(valor);
        BotonEliminar.setEnabled(valor);
    }

    public void VaciarImagen() {
        // String fil = "\\G:\\sin-imagen.png";
        //   String  fil= "\\home\\ineval\\Escritorio\\P-FARMACIA\\sin-imagen.png"; //Windows
        fot = "logologin.png";
        imagen.setIcon(new ImageIcon(fot));
        ImageIcon icon = new ImageIcon(fot);
        Image img = icon.getImage();
        System.out.println(fot + " Foto " + imagen.getWidth() + " " + imagen.getHeight());
        Image newimg = img.getScaledInstance(223, 172, java.awt.Image.SCALE_SMOOTH);
        ImageIcon newIcono = new ImageIcon(newimg);
        imagen.setIcon(newIcono);
        rutaimagen = fot;
    }

    private void getPicture1(String path) {
        JFileChooser dig = new JFileChooser(path);
        dig.setFileFilter(new FileNameExtensionFilter("Archivos de imagen",
                "tif", "jpg", "jpeg", "png", "gif"));
        int opcion = dig.showOpenDialog(this);
        if (opcion == JFileChooser.APPROVE_OPTION) {
            fot = dig.getSelectedFile().getPath();
            rutaimagen = dig.getSelectedFile().getPath();
            imagen.setIcon(new ImageIcon(fot));
            ImageIcon icon = new ImageIcon(fot);
            Image img = icon.getImage();
            Image newimg = img.getScaledInstance(223, 172, java.awt.Image.SCALE_SMOOTH);
            ImageIcon newIcono = new ImageIcon(newimg);
            imagen.setIcon(newIcono);
            System.out.println(fot + " Foto " + imagen.getWidth() + " " + imagen.getHeight());
            System.out.println("ruta= " + rutaimagen + "\n"
                    + "ruta2 " + fot);
        }
    }

    private void getPicture2(String path) {
        //JFileChooser dig = new JFileChooser(path);
        //dig.setFileFilter(new FileNameExtensionFilter("Archivos de imagen",
        //  "tif", "jpg", "jpeg", "png", "gif"));
        //int opcion = dig.showOpenDialog(this);
        //if (opcion == JFileChooser.APPROVE_OPTION) {
        //fot = dig.getSelectedFile().getPath();
        //rutaimagen = dig.getSelectedFile().getPath();
        rutaimagen = path;
        imagen.setIcon(new ImageIcon(path));
        ImageIcon icon = new ImageIcon(path);
        Image img = icon.getImage();
        Image newimg = img.getScaledInstance(223, 172, java.awt.Image.SCALE_SMOOTH);
        ImageIcon newIcono = new ImageIcon(newimg);
        imagen.setIcon(newIcono);
        System.out.println(fot + " Foto " + imagen.getWidth() + " " + imagen.getHeight());
        System.out.println("ruta= " + rutaimagen + "\n"
                + "ruta2 " + fot);
    }

    public void vaciarimagen() {
        fot = "src/com/farmacia/imagenes/logologin.png";
        imagen.setIcon(new ImageIcon(fot));
        ImageIcon icon = new ImageIcon(fot);
        Image img = icon.getImage();
        System.out.println(fot + " Foto " + imagen.getWidth() + " " + imagen.getHeight());
        Image newimg = img.getScaledInstance(223, 172, java.awt.Image.SCALE_SMOOTH);
        ImageIcon newIcono = new ImageIcon(newimg);
        imagen.setIcon(newIcono);
        rutaimagen = fot;
    }

    public void Guardar() {
        if (ruc.getText().length() < 2 || nombre.getText().length() < 2 || corr != true
                || direccion.getText().length() < 2 || telefono.getText().length() < 2
                || correo.getText().length() < 2) {
            JOptionPane.showMessageDialog(null, "Datos incorrectos, revise todos los campos");
        } else {
            Laboratorio obj = new Laboratorio();
            obj.setId_Laboratorio(obj2.getId_Laboratorio());
            obj.setRUC(ruc.getText());
            obj.setNombre(nombre.getText());
            obj.setDireccion(direccion.getText());
            obj.setTelefono(telefono.getText());
            obj.setFecha(fecha1);
            obj.setImagen(rutaimagen);
            System.out.println("imagen: " + rutaimagen);
            obj.setCorreo(correo.getText());
            String cadena = "";
            lista = cc.ListarLab();
            posi = getposicion(obj.getRUC());
            System.out.println(posi);
            lista.set(posi, obj);
            try {
                cc.Actualizar(obj);
                lista.clear();
                JOptionPane.showMessageDialog(this, "Laboratorio modificado con exito ");
                setVisible(false);
            } catch (Exception e) {
                JOptionPane.showMessageDialog(this, e);
            }
        }
    }

    public int getposicion(String cedula) {
        int per = -1;
        try {
            for (int j = 0; j < lista.size(); j++) {
                if (cedula.equals(lista.get(j).getRUC())) {
                    per = j;
                    break;
                }
            }
        } catch (Exception e) {
        }
        return per;
    }

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(Editar_Lab.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(Editar_Lab.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(Editar_Lab.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(Editar_Lab.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>

        /* Create and display the dialog */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                Editar_Lab dialog = new Editar_Lab(new javax.swing.JFrame(), true);
                dialog.addWindowListener(new java.awt.event.WindowAdapter() {
                    @Override
                    public void windowClosing(java.awt.event.WindowEvent e) {
                        System.exit(0);
                    }
                });
                dialog.setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton BotonEliminar;
    private javax.swing.JButton BotonFecha;
    private javax.swing.JButton BotonGuardar;
    private javax.swing.JButton BotonImagen;
    private javax.swing.JButton BotonSalir;
    private javax.swing.JButton BotonSinImagen;
    private javax.swing.JButton Reporte;
    private javax.swing.JTextField correo;
    private javax.swing.JTextField direccion;
    private javax.swing.JTextField fecha;
    private javax.swing.JLabel imagen;
    private javax.swing.JButton jButton5;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel2;
    private javax.swing.JTextField nombre;
    private javax.swing.JTextField ruc;
    private javax.swing.JTextField telefono;
    // End of variables declaration//GEN-END:variables
}