import numpy as np

X = np.array(([[1,1]]), dtype=float)
y = np.array(([[1]]), dtype=float)

class Neural_Network(object):
    def __init__(self):
        self.inputSize=2
        self.outputSize=1
        self.hidden1Size=2
        self.hidden2Size=2
        self.lr=0.1
        
        #Weights
        self.W1=np.array(([[0.1,0.1],[0.1,0.1]]), dtype=float)
        self.W2=np.array(([[0.1,0.1],[0.1,0.1]]), dtype=float)
        self.W3=np.array(([[0.1],[0.1]]), dtype=float)
        
    
    def forward(self,X):
        self.z=np.dot(X,self.W1)
        self.z2=self.sigmoid(self.z)
        self.z3=np.dot(self.z2,self.W2)
        self.z4=self.sigmoid(self.z3)
        o=np.dot(self.z4,self.W3)
        return o
    
    def sigmoid(self,s):
        return 1/(1+np.exp(-s))
    
    def sigmoidPrime(self,s):
        return s*(1-s)
    
    def backward(self,X,y,o):
        # Loss
        self.o_delta=o-y
        self.z4_delta=self.o_delta.dot(self.W3.T)*self.sigmoidPrime(self.z4)
        self.z2_delta=self.z4_delta.dot(self.W2.T)*self.sigmoidPrime(self.z2)
        # Update
        self.W3 -= self.lr*self.z4.T.dot(self.o_delta)
        self.W2 -= self.lr*self.z2.T.dot(self.z4_delta)
        self.W1 -= self.lr*X.T.dot(self.z2_delta)

    def train(self,X,y):
        o=self.forward(X)
        print('-----------Initial Weight-----------')
        print("W1: \n" + str(NN.W1))
        print("W2: \n" + str(NN.W2))
        print("W3: \n" + str(NN.W3))
        self.backward(X,y,o)
        o2=self.forward(X)
        print('-----------Updated Weight-----------')
        print("W1: \n" + str(NN.W1))
        print("W2: \n" + str(NN.W2))
        print("W3: \n" + str(NN.W3))
        print('-----------Prediction-----------')        
        print("Before Train:\t" + str(o))
        print("After Train:\t" + str(o2))

NN = Neural_Network()
NN.train(X,y)