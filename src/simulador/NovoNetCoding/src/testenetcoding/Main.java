/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package testenetcoding;


import java.util.ArrayList;
import org.jscience.mathematics.vector.Matrix;
import org.jscience.mathematics.vector.Vector;

/**
 *
 * @author pedpano
 */
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        Main main = new Main();

        //double [][] matrixOriginal =  {{0,1,0},{1,1,1},{1,0,1},{0,1,0}};
        double [][] matrixOriginal =  {{1,20,1},{1,1,1},{1,10,1},{1,7,1}};

        //Nodo 1
        double [][] aleatorio1 = {{2},{4},{10}};
        double [][] encoded1 = new double[4][1];

        encoded1 = main.multiplica(matrixOriginal, aleatorio1,4,3);
        //main.exibe(encoded1, 4,1);

        //nodo2
        double [][] aleatorio2 = {{25},{5},{5}};
        double [][] encoded2 = new double[4][1];

        encoded2= main.multiplica(matrixOriginal, aleatorio2,4,3);


        //nodo3
        double [][] aleatorio3 = {{7},{6},{3}};
        double [][] encoded3 = new double[4][1];

        encoded3 = main.multiplica(matrixOriginal, aleatorio3,4,3);



        //Nodo 4
        double [][] aleatorio4 = {{2},{3}};
        //main.exibe(encoded1,4,1);
        //main.exibe(encoded2,4,1);

        double matrix_encoded [][] = {{92,130},
                                      {16,35},
                                      {52,80},
                                      {40,65}};

        double encoded4[][] = main.multiplica(matrix_encoded, aleatorio4,4,2);


        main.exibe(encoded2,4,1);
        main.exibe(encoded3,4,1);
        //main.exibe(encoded4,4,1);
        

        //------------------------------

        double matrixParvial[][] =  {{130,130,574},
                                      {35,16,137},
                                      {80,70,344},
                                      {65,52,275}};

        double aleatorioFinal[][] = {{25,7,79},{5,6,23},{5,3,35}};




        Matrix X = Matrix.valueOf(matrixParvial);
        Matrix G = Matrix.valueOf(aleatorioFinal);

        //Matrix X = Matrix.valueOf(main.junta(encoded1,encoded2,encoded3, 4,1));

        //Matrix G = Matrix.valueOf(main.junta(aleatorio1,aleatorio2,aleatorio3,3,1));

        //main.exibe(main.junta(encoded1,encoded2,encoded3, 4,1), 4, 3);

        /*Matrix X = Matrix.valueOf(new double[][]
            {{ 0, 1, 1 },
             { 1, 0, 0 },
             { 1, 1, 1 },
             { 0, 1, 1 },
             });

        Matrix G = Matrix.valueOf(new double[][]
                {{ 1, 0, 1 },
                 { 0, 1, 1 },
                 { 0, 1, 0 },
             });*/

        Matrix M = X.times(G.inverse());//inverso so de matrizes quadradas
        

        main.exibeVector(M.getRow(0),0);
        main.exibeVector(M.getRow(1),1);
        main.exibeVector(M.getRow(2),2);
        main.exibeVector(M.getRow(3),3);

        //teste
   
       /* Matrix M0 = Matrix.valueOf(new double[][]
            {{ 3, 1 },
             { 4, 2}});

        M0 = M0.inverse();

        main.exibeVector(M0.getRow(0),0);
        main.exibeVector(M0.getRow(1),1);*/
       

    }

    public double[] soma(double[] vet1, double[] vet2)
    {
        double result[] = new double[vet1.length];


        for(int i=0; i<vet1.length; i++)
        {
            result[i] = (int)vet1[i]^(int)vet2[i];
        }

        return result;
    }

    public void exibe(double array[][], int linhas,int colunas)
    {
        for(int j=0; j<colunas; j++)
        {
            for(int i=0; i<linhas; i++)
            {
                System.out.println("["+i+"]["+j+"] = "+array[i][j]);
            }
        }
    }

    public void exibeVector(Vector vector, int linha)
    {
        for(int i=0;i<vector.getDimension();i++)
        {
            System.out.println("["+linha+"]["+i+"] = "+vector.get(i));
        }


    }

    public double[][] multiplica(double[][] original, double[][] aleatorio, int linhas, int colunas)
    {
        double[][] result = new double[4][1];
        for(int i=0;i<colunas;i++)
        {
              for (int j = 0; j<linhas; j++)
              {
                 result[j][0]=(aleatorio[i][0]*original[j][i])+result[j][0];
              }
        }
        return result;
    }


    /*public double[][] multiplica(ArrayList array, double[][] aleatorio)
    {
        double[][] result = new double[4][1];
        for(int i=0;i<array.size();i++)
        {
             double temp[][] = (double[][])array.get(i);
              for (int j = 0; j<4; j++)
              {
                 result[j][0]=(aleatorio[i][0]*temp[j][0])+result[j][0];
              }
        }
        return result;
    }*/




    public double[][] junta(double[][] arr1,double[][] arr2,double[][] arr3, int linha, int coluna){

        double juntado[][] = new double[linha][3];
        for(int i=0;i<3;i++)
        {
            for(int j=0;j<linha;j++)
            {
                if(i==0)
                {
                    juntado[j][i] = arr1[j][0];
                }
                else if(i==1)
                {
                    juntado[j][i] = arr2[j][0];
                }
                else
                {
                    juntado[j][i] = arr3[j][0];
                }
               
            }
        }

        return juntado;

    }


}
