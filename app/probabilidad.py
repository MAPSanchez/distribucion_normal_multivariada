
import random as r
import numpy as np
import math as m
#import matplotlib.pyplot as plt

class Probabilidad:
   
    v_medias = []
    vector_fx = []
    vector_z = []
    rechazados = []
    dataset_rechazados = []
    m_covarianza = []
    v_sigma = []

    def FuncionDensidadProbabilidad(self,vector_medias,x,matriz_covarianza,N_variables):
        
        determinante = np.linalg.det(matriz_covarianza)

        if determinante<0:
            return "Error"

        diferencia_x_medias = np.subtract(x,vector_medias)
        transpuesta = diferencia_x_medias.transpose()
        inversa = np.linalg.inv(matriz_covarianza)
        
        p1 = 1/(   m.sqrt((m.pow( (2*m.pi) ,N_variables)   ))   *  m.pow(determinante,1/2)   )
        p2 = m.exp(-0.5 * np.dot(np.dot(transpuesta,inversa),diferencia_x_medias))
        
        fx = p1 * p2
        return fx

    def ObtenerDataset(self,k,N_variables,vector_medias,matriz_covarianza):
        contador = 0
        dataset = []
        self.vector_fx = []
        self.vector_z= []
        self.dataset_rechazados = []
        self.rechazados = []
        while contador < k:
            Z = r.uniform(0,1)
            x = []
        
            for i in range(0,N_variables):
                x.append(r.uniform(0,1))
            
            valor_fx = self.FuncionDensidadProbabilidad(vector_medias,x,matriz_covarianza,N_variables)
            
            if valor_fx == "Error":
                return "Error"

            if valor_fx >= Z:
                dataset.append(x)
                self.vector_fx.append(valor_fx)
                contador = contador + 1
                self.vector_z.append(Z)
            
            if valor_fx < Z:
                self.dataset_rechazados.append(x)
                self.rechazados.append(Z)

        return dataset

    def GenerarRo(self,n_variables):
        matriz_ro = []
        for i in range(0,n_variables):
            fila = []
            for j in range(0,n_variables):
                if i==j:
                    valor_ro = 1
                else:
                    valor_ro = r.uniform(-1,1)
                fila.append(valor_ro)
            matriz_ro.append(fila)
        
        for i in range(0,n_variables):
            for j in range(0,n_variables):
                matriz_ro[i][j] = matriz_ro[j][i]

        return matriz_ro

    def generarMatrizCovarianza(self,sigma,matriz_ro):
        matriz = []
        variables = len(sigma)
        for i in range(0,variables):
            fila = []
            for j in range(0,variables):
                if i == j:
                    fila.append(sigma[i]*sigma[j])
                else:
                    fila.append(matriz_ro[i][j]*sigma[i]*sigma[j])
            matriz.append(fila)
            
        for i in range(0,variables):
            for j in range(0,variables):
                matriz[i][j] = matriz[j][i]
                
        return matriz
        

    def GetDataset(self,N,value_k,lim_inferior,lim_superior):
        N_variables = N
        k = value_k
        l1 = lim_inferior
        l2 = lim_superior

        vector_medias = []
        sigma = []
        for i in range(0,N_variables):
            sigma.append(r.uniform(l1,l2))
        
        self.v_sigma = sigma

        matriz_ro = self.GenerarRo(N_variables)
        matriz_covarianza = self.generarMatrizCovarianza(sigma,matriz_ro)
        self.m_covarianza = matriz_covarianza

        for i in range(0,N_variables):
            vector_medias.append(r.uniform(0,1))

        self.v_medias = vector_medias

        if self.ObtenerDataset(k,N_variables,vector_medias,matriz_covarianza) == "Error":
            return "Error"
        else:
            dataset = self.ObtenerDataset(k,N_variables,vector_medias,matriz_covarianza)

        #dataset = np.array(dataset)
        #self.dataset_rechazados = np.array(self.dataset_rechazados)

        return dataset
        
    def GetMatrizCovarianza(self):
        return self.m_covarianza

    def GetDeterminante(self):
        return np.linalg.det(self.m_covarianza)
    
    def GetDEstandar(self):
        return self.v_sigma
    
    def GetMedias(self):
        return self.v_medias
    
    def GetFX(self):
        return self.vector_fx

    def GetZ(self):
        return self.vector_z
    
    def GetDatasetRechazados(self):
        return self.dataset_rechazados
    
    def GetRechazados(self):
        return self.rechazados

#<N_variables = 2
#k = 100

#matriz_covarianza = [[0.01,0.0098],[0.0098,0.01]]
#matriz_covarianza = [[0.52,0.096],[0.096,0.5]]
'''
X = dataset[:,0]
Y = dataset[:,1]

X_r = self.dataset_rechazados[:,0]
Y_r = self.dataset_rechazados[:,1]

FX = self.vector_fx
vZ = self.vector_z


figura = plt.figure()
grafica = plt.axes(projection='3d')
grafica.scatter3D(X, Y, vZ, c='g', marker='o')
grafica.scatter3D(X_r, Y_r, rechazados, c='r', marker='.')
grafica.plot_trisurf(X,Y,FX,alpha=0.3,linewidth=0,antialiased=False)
grafica.set_xlabel("x_1")
grafica.set_ylabel("x_2")
grafica.set_zlabel("z")
plt.show()
'''
    



