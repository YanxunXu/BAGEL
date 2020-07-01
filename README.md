# BAGEL
BAGEL: A Bayesian Graphical Model for Inferring Drug Effect Longitudinally on Depression in People with HIV

example.R generates a simulated dataset and implements the proposed method BAGEL. 


Example: 

Rcpp::sourceCpp('BAGEL.cpp') #load Rcpp files for all supporting functions
source('BAGEL.R', echo=FALSE)
D = 5; #the number of drugs
Q=3; #the number of depression items
S=5; #the number of covaraites
N=100; #the number of patients
H=10
simulated_data <- generate_simulate_data(D, Q, S, N, H) # generate simulated data 

Burnin = 20
Niter = 100
thin = 5
mcmc <- main_mcmc(Data=simulated_data, Burnin,Niter,thin) # get MCMC 

x_new <- simulated_data$X[10,]
z_new <- simulated_data$Z[10,]
depression_prob_predict(mcmc, z_new, x_new) # predicttion
 
