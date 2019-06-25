package com.chart;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import javax.imageio.ImageIO;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.plot.CategoryPlot;
import org.jfree.data.general.DefaultPieDataset;

public class PieChart {

    public static JFreeChart getPieChart(ChartModel c,
            ArrayList<String> xAxisValues, ArrayList<Integer> bar1) {
        DefaultPieDataset pieDataset = new DefaultPieDataset();
        for (int i = 0; i < xAxisValues.size(); i++) {
            pieDataset.setValue(xAxisValues.get(i), bar1.get(i));
        }

        JFreeChart chart = ChartFactory.createPieChart(c.graphTitle, // Title
                pieDataset, // Dataset
                true, true, false);
//		try {


//			ChartUtilities.writeChartAsPNG(out, chart, c.getWidth(),
//					c.getHeight());
//		} catch (Exception e) {
//			System.out.println("Problem occurred creating chart.");
//		}
        return chart;
    }

    public static JFreeChart getPieChart(
            ArrayList<String> xAxisValues, ArrayList<Integer> bar1) {
        ChartModel c = new ChartModel();
        DefaultPieDataset pieDataset = new DefaultPieDataset();
        for (int i = 0; i < xAxisValues.size(); i++) {
            pieDataset.setValue(xAxisValues.get(i), bar1.get(i));
        }
        JFreeChart chart = ChartFactory.createPieChart(c.graphTitle, // Title
                pieDataset, // Dataset
                true, true, false);
        chart.setBackgroundPaint(c.chartBackground);
        chart.getTitle().setPaint(c.colorTitle);
        CategoryPlot p = chart.getCategoryPlot();
        p.setBackgroundPaint(c.graphColor);
        p.setRangeGridlinePaint(c.colorGrid);
        return chart;
//		try {
//			ChartUtilities.writeChartAsPNG(out, chart, c.getWidth(),
//					c.getHeight());
//		} catch (Exception e) {
//			System.out.println("Problem occurred creating chart.");
//		}
    }

    public static void main(String[] args) throws IOException {
        ArrayList<String> xAxisValues = new ArrayList();
        xAxisValues.add("MALE");
        xAxisValues.add("FEMALE");
        ArrayList<Integer> bar1 = new ArrayList();
        bar1.add(40);
        bar1.add(50);
        ChartModel cm = new ChartModel();
            cm.setGraphTitle(" For page Name :" );

            JFreeChart chart = PieChart.getPieChart(cm, xAxisValues, bar1);

            BufferedImage bi = chart.createBufferedImage(400, 400);
            File outputfile=new File("D:/a.png");
//            jLabel19.setIcon(new ImageIcon(bi));
           ImageIO.write(bi, "png", outputfile);
    }
}
